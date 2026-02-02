#!/usr/bin/env bash
#
# Module 7: Advanced Git for Collaboration & IP Reuse — demo and self-check
# Usage: ./scripts/module7.sh [--check] [--demo]
#
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
MODULE7_DIR="$PROJECT_ROOT/module7"
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

Module 7: Advanced Git for Collaboration & IP Reuse — run checks or demo.

Options:
  --check     Run environment self-check (git, module7 examples)
  --demo      Print demo commands for branching, merging, conflicts, submodules, blame/bisect, team workflow
  --help      Show this help

With no options, runs --check and then --demo.
EOF
}

run_check() {
  print_header "Module 7: Environment self-check"
  local failed=0

  if command -v git &>/dev/null; then
    print_ok "git available: $(git --version 2>/dev/null || true)"
  else
    print_fail "git not found"
    ((failed++)) || true
  fi

  if [[ -d "$MODULE7_DIR" ]]; then
    print_ok "module7 directory exists: $MODULE7_DIR"
  else
    print_fail "module7 directory missing: $MODULE7_DIR"
    ((failed++)) || true
  fi

  if [[ -f "$MODULE7_DIR/examples/conflicts/sample_conflict.txt" ]]; then
    print_ok "conflicts/sample_conflict.txt exists"
  else
    print_fail "conflicts/sample_conflict.txt missing"
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
  print_header "Module 7: Demo commands (copy-paste to try)"
  echo "Use a practice repo (e.g. ~/unix_practice/git_demo from module6.sh --scaffold)."
  echo ""
  echo "Branching:"
  echo "  cd ~/unix_practice/git_demo"
  echo "  git branch"
  echo "  git checkout -b feature/readme-update"
  echo "  echo 'Update' >> notes.md && git add notes.md && git commit -m 'Update notes'"
  echo "  git checkout main"
  echo ""
  echo "Merging:"
  echo "  git merge feature/readme-update"
  echo "  git log --oneline --graph --all"
  echo ""
  echo "Conflict (create two branches that change same line, then merge):"
  echo "  See module7/examples/conflicts/README.md"
  echo ""
  echo "Submodules:"
  echo "  git submodule add <url> external/example"
  echo "  git submodule update --init --recursive"
  echo ""
  echo "Blame and bisect:"
  echo "  git blame notes.md"
  echo "  git bisect start; git bisect bad; git bisect good <hash>"
  echo ""
  echo "Team workflow:"
  echo "  Push branch, open PR on GitHub, address review, merge."
  echo ""
  print_info "All examples: $MODULE7_DIR/examples/README.md"
  print_info "Full module doc: $DOCS_DIR/MODULE7.md"
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
