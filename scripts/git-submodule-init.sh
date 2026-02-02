#!/usr/bin/env bash
#
# Initialize and update Git submodules (run from repo root).
# Usage: ./scripts/git-submodule-init.sh [--check] [--recursive]
#
# After cloning a repo that has submodules, run this to populate submodule dirs:
#   ./scripts/git-submodule-init.sh
# Or from anywhere in the repo: git submodule update --init --recursive
#
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

print_ok() { echo -e "${GREEN}[OK]${NC} $1"; }
print_fail() { echo -e "${RED}[FAIL]${NC} $1"; }
print_info() { echo -e "${YELLOW}[INFO]${NC} $1"; }

show_usage() {
  cat << EOF
Usage: $0 [OPTIONS]

Initialize and update Git submodules. Run from the repository root (or from scripts/).

Options:
  --check      Only check if we're in a Git repo and list submodules (no update)
  --recursive  Update submodules recursively (default: yes, same as git submodule update --init --recursive)
  --help       Show this help

Examples:
  $0                  # init and update all submodules (recursive)
  $0 --check          # list submodules, do not clone/update
  git submodule update --init --recursive   # equivalent from repo root
EOF
}

run_check() {
  cd "$PROJECT_ROOT"
  if ! git rev-parse --git-dir &>/dev/null; then
    print_fail "Not a Git repository: $PROJECT_ROOT"
    return 1
  fi
  print_ok "Git repo: $PROJECT_ROOT"
  if [[ -f .gitmodules ]]; then
    print_ok ".gitmodules exists"
    echo ""
    echo "Submodules:"
    git submodule status
    echo ""
    print_info "Run without --check to init and update: $0"
  else
    print_info "No .gitmodules; this repo has no submodules."
  fi
}

run_init() {
  cd "$PROJECT_ROOT"
  if ! git rev-parse --git-dir &>/dev/null; then
    print_fail "Not a Git repository: $PROJECT_ROOT"
    exit 1
  fi
  if [[ ! -f .gitmodules ]]; then
    print_info "No .gitmodules; nothing to update."
    exit 0
  fi
  print_info "Initializing and updating submodules (recursive)..."
  git submodule update --init --recursive
  print_ok "Submodules initialized and updated."
}

# Main
RECURSIVE=1
while [[ $# -gt 0 ]]; do
  case "$1" in
    --check)
      run_check
      exit 0
      ;;
    --recursive)
      RECURSIVE=1
      shift
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

run_init
