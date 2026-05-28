#!/usr/bin/env bash
#
# Build slides (pptx), PDF, and narrated video for all learn_unix_git modules.
# Uses the module-to-slides-video skill (~/.cursor/skills/module-to-slides-video).
#
# Usage (from repo root):
#   ./scripts/build_all_media.sh
#   ./scripts/build_all_media.sh --regenerate-outlines   # full syllabus + EXAMPLES → outlines
#   ./scripts/build_all_media.sh --pptx-only
#   ./scripts/build_all_media.sh --module 3
#   ./scripts/build_all_media.sh --install-deps
#
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
COURSE_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
SKILL_ROOT="${SKILL_ROOT:-$HOME/.cursor/skills/module-to-slides-video}"
SKILL_SCRIPTS="$SKILL_ROOT/scripts"

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

PPTX_ONLY=0
REGENERATE=0
INSTALL_DEPS=0
MODULES_FILTER=""
SECONDS_PER_SLIDE=8
RUN_DEMOS=1
EXTRA_ARGS=()

usage() {
  cat <<EOF
Usage: $0 [options]

One command for the full skill pipeline (same as module-to-slides-video):

  1. (optional) regenerate_course_outlines.sh  — docs/MODULE*.md + EXAMPLES.md
  2. build_course_media.sh                     — diagrams, captures, pptx, pdf, TTS, video

Options:
  --regenerate-outlines   Regenerate all outline.yaml before build (~39–42 slides/module)
  --pptx-only             Stop after slides.pptx
  --module N              Only module N or comma list: 1,2,3
  --install-deps          sudo apt: libreoffice-impress, ffmpeg, poppler-utils
  --seconds-per-slide N   Silent video timing if no narration (default: 8)
  --no-run-demos          Skip capture commands during verify (faster rebuild)
  --no-narration          Silent video only
  --burn-captions         Burn subtitles into video
  --skip-capture          Reuse existing screenshots
  --skip-diagrams         Skip Mermaid render
  -h, --help              Show this help

Also:
  ./scripts/regenerate_media_outlines.sh       # outlines only (skill)
  ./scripts/verify_all_media.sh                # verify after build

Skill: $SKILL_ROOT
EOF
}

log() { echo -e "${CYAN}==>${NC} $*"; }
ok() { echo -e "${GREEN}OK:${NC} $*"; }
warn() { echo -e "${YELLOW}WARN:${NC} $*" >&2; }
die() { echo -e "${RED}ERROR:${NC} $*" >&2; exit 1; }

while [[ $# -gt 0 ]]; do
  case "$1" in
    --pptx-only) PPTX_ONLY=1; shift ;;
    --regenerate-outlines) REGENERATE=1; shift ;;
    --install-deps) INSTALL_DEPS=1; shift ;;
    --module) MODULES_FILTER="$2"; shift 2 ;;
    --seconds-per-slide) SECONDS_PER_SLIDE="$2"; shift 2 ;;
    --no-run-demos) RUN_DEMOS=0; shift ;;
    -h|--help) usage; exit 0 ;;
    *) EXTRA_ARGS+=("$1"); shift ;;
  esac
done

[[ -d "$SKILL_SCRIPTS" ]] || die "Skill not found: $SKILL_SCRIPTS"
[[ -x "$SKILL_SCRIPTS/regenerate_course_outlines.sh" ]] || die "Missing: $SKILL_SCRIPTS/regenerate_course_outlines.sh"
[[ -x "$SKILL_SCRIPTS/build_course_media.sh" ]] || die "Missing: $SKILL_SCRIPTS/build_course_media.sh"

install_system_deps() {
  log "Installing system packages (sudo required)..."
  sudo DEBIAN_FRONTEND=noninteractive apt-get update -qq
  sudo DEBIAN_FRONTEND=noninteractive apt-get install -y -qq \
    libreoffice-impress libreoffice-core libreoffice-writer \
    default-jre-headless ffmpeg poppler-utils
  ok "System dependencies installed"
}

check_system_deps() {
  local missing=0
  if [[ $PPTX_ONLY -eq 0 ]]; then
    command -v soffice >/dev/null 2>&1 || command -v libreoffice >/dev/null 2>&1 || {
      warn "LibreOffice not found — PDF/video may fail (use --install-deps)"
      missing=1
    }
    command -v ffmpeg >/dev/null 2>&1 || {
      warn "ffmpeg not found — video will fail (use --install-deps)"
      missing=1
    }
    command -v pdftoppm >/dev/null 2>&1 || {
      warn "pdftoppm not found — video may fail (use --install-deps)"
      missing=1
    }
  fi
  return $missing
}

log "Course: $COURSE_ROOT"
log "Skill:  $SKILL_ROOT"

if [[ $INSTALL_DEPS -eq 1 ]]; then
  install_system_deps
fi

log "Setting up Python skill venv..."
bash "$SKILL_SCRIPTS/setup.sh" | tail -3

# Regenerate outlines via skill (all modules, full syllabus + examples)
if [[ $REGENERATE -eq 1 ]]; then
  log "Regenerating outlines (skill: generate_outline_from_module.py)..."
  bash "$SCRIPT_DIR/regenerate_media_outlines.sh"
fi

BUILD_ARGS=("$COURSE_ROOT")
[[ -n "$MODULES_FILTER" ]] && BUILD_ARGS+=(--module "$MODULES_FILTER")
[[ $PPTX_ONLY -eq 1 ]] && BUILD_ARGS+=(--pptx-only)
[[ $RUN_DEMOS -eq 1 ]] && BUILD_ARGS+=(--run-demos)
BUILD_ARGS+=(--seconds-per-slide "$SECONDS_PER_SLIDE")
# Allow skill-only flags: --no-narration, --burn-captions, --skip-capture, etc.
BUILD_ARGS+=("${EXTRA_ARGS[@]}")

check_system_deps || true

log "Building media (skill: build_course_media.sh)..."
bash "$SKILL_SCRIPTS/build_course_media.sh" "${BUILD_ARGS[@]}"

echo ""
log "Slide counts:"
for n in 1 2 3 4 5 6 7 8; do
  o="$COURSE_ROOT/media/module$n/outline.yaml"
  if [[ -f "$o" ]]; then
    c=$(grep -c "type:" "$o" 2>/dev/null || echo 0)
    echo "  module $n: $c slides"
  fi
done

echo ""
log "Outputs:"
for f in "$COURSE_ROOT"/media/module*/slides.pptx; do
  [[ -f "$f" ]] && echo "  pptx: $f"
done
if [[ $PPTX_ONLY -eq 0 ]]; then
  for f in "$COURSE_ROOT"/media/module*/slides.pdf; do
    [[ -f "$f" ]] && echo "  pdf:  $f"
  done
  for f in "$COURSE_ROOT"/media/module*/video.mp4; do
    [[ -f "$f" ]] && echo "  mp4:  $f"
  done
fi

log "Verify (optional): ./scripts/verify_all_media.sh"
ok "Done. Review: $COURSE_ROOT/media/"
