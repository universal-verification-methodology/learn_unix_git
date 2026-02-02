#!/usr/bin/env bash
#
# Module 8: End-to-End Project Workflow — demo and self-check
# Usage: ./scripts/module8.sh [--check] [--demo]
#
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
MODULE8_DIR="$PROJECT_ROOT/module8"
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

Module 8: End-to-End Project Workflow — run checks or demo.

Options:
  --check     Run environment self-check (module8 examples)
  --demo      Print demo commands for template, scripts, logs, iterative, submission, end-to-end
  --help      Show this help

With no options, runs --check and then --demo.
EOF
}

run_check() {
  print_header "Module 8: Environment self-check"
  local failed=0

  if [[ -d "$MODULE8_DIR" ]]; then
    print_ok "module8 directory exists: $MODULE8_DIR"
  else
    print_fail "module8 directory missing: $MODULE8_DIR"
    ((failed++)) || true
  fi

  if [[ -d "$MODULE8_DIR/examples/template/sample_project" ]]; then
    print_ok "template/sample_project exists"
  else
    print_fail "template/sample_project missing"
    ((failed++)) || true
  fi

  if [[ -f "$MODULE8_DIR/examples/template/sample_project/scripts/run_demo.sh" ]]; then
    print_ok "sample_project/scripts/run_demo.sh exists"
  else
    print_fail "sample_project/scripts/run_demo.sh missing"
    ((failed++)) || true
  fi

  if [[ -f "$MODULE8_DIR/examples/logs/sample.log" ]]; then
    print_ok "logs/sample.log exists"
  else
    print_fail "logs/sample.log missing"
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
  print_header "Module 8: Demo commands (copy-paste to try)"
  echo "Template (inspect layout):"
  echo "  cd $MODULE8_DIR/examples/template/sample_project"
  echo "  ls -la"
  echo "  ls src tb docs scripts build logs"
  echo ""
  echo "Scripts (run and redirect):"
  echo "  cd $MODULE8_DIR/examples/template/sample_project"
  echo "  chmod +x scripts/run_demo.sh"
  echo "  ./scripts/run_demo.sh"
  echo "  ./scripts/run_demo.sh > logs/run.log 2>&1"
  echo "  cat logs/run.log"
  echo ""
  echo "Logs (inspect and search):"
  echo "  tail -20 logs/run.log"
  echo "  grep -i error logs/run.log"
  echo "  cd $MODULE8_DIR/examples/logs && grep ERROR sample.log"
  echo ""
  echo "Iterative (edit, run, commit):"
  echo "  cd ~/unix_practice/git_demo"
  echo "  echo 'Note' >> notes.md && git add notes.md && git commit -m 'Add note'"
  echo ""
  echo "Submission (pre-submit, push):"
  echo "  git status"
  echo "  git push"
  echo ""
  echo "End-to-end: see $MODULE8_DIR/examples/end_to_end/README.md"
  echo ""
  print_info "All examples: $MODULE8_DIR/examples/README.md"
  print_info "Full module doc: $DOCS_DIR/MODULE8.md"
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
