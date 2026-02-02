#!/usr/bin/env bash
#
# Show status of all Git submodules (run from repo root).
# Usage: ./scripts/git-submodule-status.sh [--help]
#
# Prints git submodule status and optionally checks for uncommitted changes
# inside each submodule.
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

Show status of Git submodules. Run from the repository root (or from scripts/).

Options:
  --verbose   After status, run 'git status' in each submodule (shows uncommitted changes)
  --help      Show this help

Examples:
  $0
  $0 --verbose
  git submodule status   # raw Git command
EOF
}

VERBOSE=
while [[ $# -gt 0 ]]; do
  case "$1" in
    --verbose|-v)
      VERBOSE=1
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

cd "$PROJECT_ROOT"
if ! git rev-parse --git-dir &>/dev/null; then
  print_fail "Not a Git repository: $PROJECT_ROOT"
  exit 1
fi

if [[ ! -f .gitmodules ]]; then
  print_info "No submodules in this repo."
  exit 0
fi

echo -e "${CYAN}Submodule status:${NC}"
git submodule status
echo ""

if [[ -n "${VERBOSE:-}" ]]; then
  echo -e "${CYAN}Per-submodule status:${NC}"
  git submodule foreach --recursive 'echo "--- $name ---"; git status -s'
fi
