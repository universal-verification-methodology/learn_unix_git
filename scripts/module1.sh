#!/usr/bin/env bash
#
# Module 1: Linux & Shell Basics — demo and self-check
# Usage: ./scripts/module1.sh [--check] [--demo] [--scaffold]
#
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
MODULE1_DIR="$PROJECT_ROOT/module1"
DOCS_DIR="$PROJECT_ROOT/docs"

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

print_header() {
  echo ""
  echo -e "${CYAN}========================================${NC}"
  echo -e "${CYAN}$1${NC}"
  echo -e "${CYAN}========================================${NC}"
  echo ""
}

print_ok() { echo -e "${GREEN}[OK]${NC} $1"; }
print_fail() { echo -e "${RED}[FAIL]${NC} $1"; }
print_info() { echo -e "${YELLOW}[INFO]${NC} $1"; }

show_usage() {
  cat << EOF
Usage: $0 [OPTIONS]

Module 1: Linux & Shell Basics — run checks, demo, or create exercise scaffold.

Options:
  --check     Run environment self-check (pwd, ls, cat, less, man)
  --demo      Print demo commands for navigation and viewing (no execution)
  --scaffold  Create ~/unix_practice/ with notes/ and projects/, and copy sample file
  --help      Show this help

With no options, runs --check and then --demo.
EOF
}

run_check() {
  print_header "Module 1: Environment self-check"
  local failed=0

  if command -v pwd &>/dev/null; then
    print_ok "pwd: $(pwd)"
  else
    print_fail "pwd not found"
    ((failed++)) || true
  fi

  if command -v ls &>/dev/null; then
    print_ok "ls available"
  else
    print_fail "ls not found"
    ((failed++)) || true
  fi

  if command -v cat &>/dev/null; then
    print_ok "cat available"
  else
    print_fail "cat not found"
    ((failed++)) || true
  fi

  if command -v less &>/dev/null; then
    print_ok "less available"
  else
    print_info "less not found (optional; use 'more' or 'cat' if needed)"
  fi

  if command -v man &>/dev/null; then
    print_ok "man available"
  else
    print_info "man not found (optional)"
  fi

  if [[ -d "$MODULE1_DIR" ]]; then
    print_ok "module1 directory exists: $MODULE1_DIR"
  else
    print_fail "module1 directory missing: $MODULE1_DIR"
    ((failed++)) || true
  fi

  if [[ -f "$MODULE1_DIR/examples/viewing/sample_for_viewing.txt" ]]; then
    print_ok "sample_for_viewing.txt exists"
  else
    print_fail "sample_for_viewing.txt missing"
    ((failed++)) || true
  fi

  if [[ -d "$MODULE1_DIR/examples/navigation/sample_repo" ]]; then
    print_ok "sample_repo (navigation) exists"
  else
    print_fail "sample_repo missing"
    ((failed++)) || true
  fi

  echo ""
  if [[ $failed -eq 0 ]]; then
    print_ok "All required checks passed."
  else
    print_fail "$failed check(s) failed."
    return 1
  fi
}

run_demo() {
  print_header "Module 1: Demo commands (copy-paste to try)"
  echo "Navigation (from repo root):"
  echo "  cd $MODULE1_DIR/examples/navigation/sample_repo"
  echo "  pwd; ls -la; cd src && pwd && ls && cd .."
  echo ""
  echo "Paths (absolute vs relative):"
  echo "  cd $MODULE1_DIR/examples/paths"
  echo "  cd .. ; cd examples/paths ; cd ~"
  echo ""
  echo "File operations (cp, mv, mkdir, rm):"
  echo "  cd $MODULE1_DIR/examples/file_operations"
  echo "  mkdir backup; cp original.txt copy.txt; ls -la"
  echo ""
  echo "Viewing files (cat, head, tail, less):"
  echo "  cat $MODULE1_DIR/examples/viewing/short.txt"
  echo "  head -n 5 $MODULE1_DIR/examples/viewing/sample_for_viewing.txt"
  echo "  tail -n 5 $MODULE1_DIR/examples/viewing/sample_for_viewing.txt"
  echo "  less $MODULE1_DIR/examples/viewing/sample_for_viewing.txt"
  echo ""
  echo "Design-style files (.v, .sv, .md, .cpp):"
  echo "  cd $MODULE1_DIR/examples/design_files"
  echo "  cat src/counter.v; less tb/tb_counter.sv"
  echo ""
  echo "Help:"
  echo "  man ls; ls --help; whatis ls; apropos directory"
  echo ""
  print_info "All examples: $MODULE1_DIR/examples/README.md"
  print_info "Full module doc: $DOCS_DIR/MODULE1.md"
}

run_scaffold() {
  print_header "Module 1: Create exercise scaffold"
  local practice_dir="${HOME}/unix_practice"
  local notes_dir="${practice_dir}/notes"
  local projects_dir="${practice_dir}/projects"
  local sample_src="$MODULE1_DIR/examples/viewing/sample_for_viewing.txt"
  local sample_dst="${notes_dir}/longfile.txt"

  mkdir -p "$notes_dir" "$projects_dir"
  print_ok "Created $notes_dir and $projects_dir"

  if [[ -f "$sample_src" ]]; then
    cp "$sample_src" "$sample_dst"
    print_ok "Copied sample file to $sample_dst"
  else
    print_fail "Sample file not found: $sample_src"
    return 1
  fi

  echo ""
  print_ok "Scaffold ready. Try: cd $practice_dir && ls -la"
  print_info "Exercises: $MODULE1_DIR/exercises/README.md"
}

# Main
if [[ $# -eq 0 ]]; then
  run_check
  run_demo
  exit 0
fi

while [[ $# -gt 0 ]]; do
  case "$1" in
    --check)
      run_check
      ;;
    --demo)
      run_demo
      ;;
    --scaffold)
      run_scaffold
      ;;
    --help|-h)
      show_usage
      exit 0
      ;;
    *)
      print_fail "Unknown option: $1"
      show_usage
      exit 1
      ;;
  esac
  shift
done
