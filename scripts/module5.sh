#!/usr/bin/env bash
#
# Module 5: Editors, Projects & Archives — demo and self-check
# Usage: ./scripts/module5.sh [--check] [--demo] [--scaffold]
#
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
MODULE5_DIR="$PROJECT_ROOT/module5"
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

Module 5: Editors, Projects & Archives — run checks, demo, or create exercise scaffold.

Options:
  --check     Run environment self-check (tar, zip, find, grep, module5 examples)
  --demo      Print demo commands for editor, project structure, find/grep, tar, zip, backup
  --scaffold  Create ~/unix_practice/unix_course_project/ with src/, tb/, docs/, scripts/, build/
  --help      Show this help

With no options, runs --check and then --demo.
EOF
}

run_check() {
  print_header "Module 5: Environment self-check"
  local failed=0

  if command -v tar &>/dev/null; then
    print_ok "tar available"
  else
    print_fail "tar not found"
    ((failed++)) || true
  fi

  if command -v zip &>/dev/null; then
    print_ok "zip available"
  else
    print_fail "zip not found"
    ((failed++)) || true
  fi

  if command -v unzip &>/dev/null; then
    print_ok "unzip available"
  else
    print_fail "unzip not found"
    ((failed++)) || true
  fi

  if command -v find &>/dev/null; then
    print_ok "find available"
  else
    print_fail "find not found"
    ((failed++)) || true
  fi

  if command -v grep &>/dev/null; then
    print_ok "grep available"
  else
    print_fail "grep not found"
    ((failed++)) || true
  fi

  if [[ -d "$MODULE5_DIR" ]]; then
    print_ok "module5 directory exists: $MODULE5_DIR"
  else
    print_fail "module5 directory missing: $MODULE5_DIR"
    ((failed++)) || true
  fi

  if [[ -d "$MODULE5_DIR/examples/project_structure/sample_project" ]]; then
    print_ok "project_structure/sample_project exists"
  else
    print_fail "project_structure/sample_project missing"
    ((failed++)) || true
  fi

  if [[ -f "$MODULE5_DIR/examples/backup/backup_demo.sh" ]]; then
    print_ok "backup/backup_demo.sh exists"
  else
    print_fail "backup/backup_demo.sh missing"
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
  print_header "Module 5: Demo commands (copy-paste to try)"
  echo "Editor (open from terminal):"
  echo "  cd $MODULE5_DIR/examples/editor"
  echo "  nano sample.txt"
  echo "  code sample.v"
  echo ""
  echo "Project structure:"
  echo "  cd $MODULE5_DIR/examples/project_structure/sample_project"
  echo "  ls -la"
  echo "  find . -type f"
  echo ""
  echo "Find and grep:"
  echo "  cd $MODULE5_DIR/examples/find_grep"
  echo "  find . -name '*.v'"
  echo "  grep -R 'CLOCK_SIGNAL' ."
  echo ""
  echo "Tar archives:"
  echo "  cd $MODULE5_DIR/examples/tar_archives"
  echo "  tar czf demo.tar.gz demo_dir/"
  echo "  tar tzf demo.tar.gz"
  echo ""
  echo "Zip archives:"
  echo "  cd $MODULE5_DIR/examples/zip_archives"
  echo "  zip -r demo.zip demo_dir/"
  echo "  unzip -l demo.zip"
  echo ""
  echo "Backup (timestamped archive):"
  echo "  cd $MODULE5_DIR/examples/backup"
  echo "  chmod u+x backup_demo.sh"
  echo "  ./backup_demo.sh"
  echo "  tar czf \"backup_\$(date +%Y%m%d).tar.gz\" project_dir"
  echo ""
  print_info "All examples: $MODULE5_DIR/examples/README.md"
  print_info "Full module doc: $DOCS_DIR/MODULE5.md"
}

run_scaffold() {
  print_header "Module 5: Create exercise scaffold"
  local practice_dir="${HOME}/unix_practice"
  local project_dir="${practice_dir}/unix_course_project"
  local dirs=("src" "tb" "docs" "scripts" "build")

  if [[ ! -d "$practice_dir" ]]; then
    print_info "Creating $practice_dir (run module1.sh --scaffold first for full layout)"
    mkdir -p "$practice_dir"
  fi

  mkdir -p "$project_dir"
  for d in "${dirs[@]}"; do
    mkdir -p "${project_dir}/${d}"
  done
  touch "${project_dir}/src/main.txt"
  touch "${project_dir}/tb/test.txt"
  touch "${project_dir}/docs/notes.txt"
  touch "${project_dir}/scripts/build.sh"
  touch "${project_dir}/build/.gitkeep"

  print_ok "Created $project_dir with src/, tb/, docs/, scripts/, build/"
  print_ok "Placeholder files: src/main.txt, tb/test.txt, docs/notes.txt, scripts/build.sh"
  echo ""
  print_ok "Scaffold ready. Try: cd $project_dir && ls -la && find . -type f"
  print_info "Exercises: $MODULE5_DIR/exercises/README.md"
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
