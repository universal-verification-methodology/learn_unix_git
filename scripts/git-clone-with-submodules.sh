#!/usr/bin/env bash
#
# Clone a Git repository and initialize submodules.
# Usage: ./scripts/git-clone-with-submodules.sh <repo-url> [directory]
#
# If directory is omitted, the repo is cloned into the current directory
# using the last component of the URL (e.g. .../learn_unix_git.git -> learn_unix_git/).
# Then runs: git submodule update --init --recursive
#
# Alternative: git clone --recurse-submodules <url> [dir]
#
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

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
Usage: $0 <repo-url> [directory]

Clone a Git repository and run 'git submodule update --init --recursive' inside it.
Run from the parent directory where you want the clone (e.g. ~/proj).

Options:
  --help   Show this help

Examples:
  $0 https://github.com/org/repo.git
  $0 https://github.com/org/repo.git my-repo
  git clone --recurse-submodules <url> [dir]   # one-step alternative
EOF
}

if [[ $# -ge 1 && "${1:-}" == --help || "${1:-}" == -h ]]; then
  show_usage
  exit 0
fi

if [[ $# -lt 1 ]]; then
  print_fail "Missing repo URL."
  show_usage
  exit 1
fi

REPO_URL="$1"
CLONE_DIR="${2:-}"

if [[ -z "$CLONE_DIR" ]]; then
  # Basename of URL without .git
  CLONE_DIR="${REPO_URL%/}"
  CLONE_DIR="${CLONE_DIR%.git}"
  CLONE_DIR="${CLONE_DIR##*/}"
fi

if ! command -v git &>/dev/null; then
  print_fail "git not found."
  exit 1
fi

print_info "Cloning $REPO_URL into $CLONE_DIR ..."
git clone "$REPO_URL" "$CLONE_DIR"
cd "$CLONE_DIR"
if [[ -f .gitmodules ]]; then
  print_info "Initializing submodules..."
  git submodule update --init --recursive
  print_ok "Clone and submodules ready: $CLONE_DIR"
else
  print_ok "Clone ready (no submodules): $CLONE_DIR"
fi
