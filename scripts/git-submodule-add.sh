#!/usr/bin/env bash
#
# Add a Git submodule (wrapper around git submodule add).
# Usage: ./scripts/git-submodule-add.sh <url> [path]
#
# Examples:
#   ./scripts/git-submodule-add.sh https://github.com/org/shared-ip.git external/shared-ip
#   ./scripts/git-submodule-add.sh https://github.com/org/lib.git   # path defaults to external/lib
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
Usage: $0 <url> [path]

Add a Git submodule. Run from the repository root (or from scripts/).
If path is omitted, defaults to external/<basename-of-repo> (e.g. .../foo.git -> external/foo).

Options:
  --help   Show this help

Examples:
  $0 https://github.com/org/shared-ip.git external/shared-ip
  $0 https://github.com/org/lib.git
  git submodule add <url> <path>   # raw Git command
EOF
}

# Derive default path from URL: strip .git and take basename, put under external/
default_path_from_url() {
  local url="$1"
  local base
  base="${url%/}"
  base="${base%.git}"
  base="${base##*/}"
  echo "external/${base}"
}

# Main
if [[ $# -ge 1 && "$1" == --help || "$1" == -h ]]; then
  show_usage
  exit 0
fi

if [[ $# -lt 1 ]]; then
  print_fail "Missing URL."
  show_usage
  exit 1
fi

SUBMODULE_URL="$1"
SUBMODULE_PATH="${2:-$(default_path_from_url "$SUBMODULE_URL")}"

cd "$PROJECT_ROOT"
if ! git rev-parse --git-dir &>/dev/null; then
  print_fail "Not a Git repository: $PROJECT_ROOT"
  exit 1
fi

print_info "Adding submodule: $SUBMODULE_URL -> $SUBMODULE_PATH"
git submodule add "$SUBMODULE_URL" "$SUBMODULE_PATH"
print_ok "Submodule added. Commit the change: git add .gitmodules $SUBMODULE_PATH && git commit -m 'Add submodule $SUBMODULE_PATH'"
