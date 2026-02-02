#!/usr/bin/env bash
#
# Module 6: Git Basics for Course Work — demo and self-check
# Usage: ./scripts/module6.sh [--check] [--demo] [--scaffold]
#
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
MODULE6_DIR="$PROJECT_ROOT/module6"
DOCS_DIR="$PROJECT_ROOT/docs"
PRACTICE_DIR="${HOME}/unix_practice"
GIT_DEMO_DIR="${PRACTICE_DIR}/git_demo"

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

Module 6: Git Basics for Course Work — run checks, demo, or create exercise scaffold.

Options:
  --check     Run environment self-check (git, module6 examples)
  --demo      Print demo commands for concepts, init/clone, status/diff, add/commit/log, gitignore, remote/undo
  --scaffold  Create ~/unix_practice/git_demo/ with git init and notes.md (initial commit)
  --help      Show this help

With no options, runs --check and then --demo.
EOF
}

run_check() {
  print_header "Module 6: Environment self-check"
  local failed=0

  if command -v git &>/dev/null; then
    print_ok "git available: $(git --version 2>/dev/null || true)"
  else
    print_fail "git not found"
    ((failed++)) || true
  fi

  if [[ -d "$MODULE6_DIR" ]]; then
    print_ok "module6 directory exists: $MODULE6_DIR"
  else
    print_fail "module6 directory missing: $MODULE6_DIR"
    ((failed++)) || true
  fi

  if [[ -f "$MODULE6_DIR/examples/gitignore/sample.gitignore" ]]; then
    print_ok "gitignore/sample.gitignore exists"
  else
    print_fail "gitignore/sample.gitignore missing"
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
  print_header "Module 6: Demo commands (copy-paste to try)"
  echo "Create practice repo (scaffold):"
  echo "  ./scripts/module6.sh --scaffold"
  echo "  cd ~/unix_practice/git_demo"
  echo "  git status"
  echo "  git log --oneline"
  echo ""
  echo "Status and diff:"
  echo "  cd ~/unix_practice/git_demo"
  echo "  echo 'new line' >> notes.md"
  echo "  git status"
  echo "  git diff"
  echo "  git add notes.md"
  echo "  git diff --staged"
  echo ""
  echo "Add, commit, log:"
  echo "  git commit -m 'Update notes'"
  echo "  git log --oneline"
  echo ""
  echo ".gitignore:"
  echo "  cp $MODULE6_DIR/examples/gitignore/sample.gitignore /path/to/repo/.gitignore"
  echo "  mkdir -p build && touch build/output.tmp"
  echo "  git status"
  echo ""
  echo "Remote and undo:"
  echo "  git remote -v"
  echo "  git restore notes.md"
  echo "  git restore --staged notes.md"
  echo ""
  print_info "All examples: $MODULE6_DIR/examples/README.md"
  print_info "Full module doc: $DOCS_DIR/MODULE6.md"
}

run_scaffold() {
  print_header "Module 6: Create exercise scaffold"
  mkdir -p "$PRACTICE_DIR"
  if [[ -d "$GIT_DEMO_DIR/.git" ]]; then
    print_info "git_demo already exists and is a Git repo: $GIT_DEMO_DIR"
    echo ""
    print_ok "Use: cd $GIT_DEMO_DIR && git status"
    print_info "Exercises: $MODULE6_DIR/exercises/README.md"
    return 0
  fi
  rm -rf "$GIT_DEMO_DIR"
  mkdir -p "$GIT_DEMO_DIR"
  cd "$GIT_DEMO_DIR"
  git init -q
  printf '# Git demo notes\n\nCreated by module6.sh --scaffold. Edit this file and try git status, git diff, git add, git commit.\n' > notes.md
  git add notes.md
  git commit -q -m "Add notes"
  print_ok "Created $GIT_DEMO_DIR with git init and notes.md (initial commit)"
  echo ""
  print_ok "Try: cd $GIT_DEMO_DIR && git status && git log --oneline"
  print_info "Exercises: $MODULE6_DIR/exercises/README.md"
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
