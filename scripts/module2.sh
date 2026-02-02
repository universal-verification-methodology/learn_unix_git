#!/usr/bin/env bash
#
# Module 2: Filesystem, Permissions & Environment — demo and self-check
# Usage: ./scripts/module2.sh [--check] [--demo] [--scaffold]
#
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
MODULE2_DIR="$PROJECT_ROOT/module2"
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

Module 2: Filesystem, Permissions & Environment — run checks, demo, or create exercise scaffold.

Options:
  --check     Run environment self-check (ls, chmod, which, env, module2 examples)
  --demo      Print demo commands for file types, permissions, environment, dotfiles
  --scaffold  Create ~/unix_practice/hello.sh for chmod practice (if ~/unix_practice exists)
  --help      Show this help

With no options, runs --check and then --demo.
EOF
}

run_check() {
  print_header "Module 2: Environment self-check"
  local failed=0

  if command -v ls &>/dev/null; then
    print_ok "ls available"
  else
    print_fail "ls not found"
    ((failed++)) || true
  fi

  if command -v chmod &>/dev/null; then
    print_ok "chmod available"
  else
    print_fail "chmod not found"
    ((failed++)) || true
  fi

  if command -v which &>/dev/null; then
    print_ok "which available"
  else
    print_fail "which not found"
    ((failed++)) || true
  fi

  if command -v readlink &>/dev/null; then
    print_ok "readlink available"
  else
    print_info "readlink not found (optional)"
  fi

  if [[ -n "${HOME:-}" ]]; then
    print_ok "HOME set: $HOME"
  else
    print_fail "HOME not set"
    ((failed++)) || true
  fi

  if [[ -n "${PATH:-}" ]]; then
    print_ok "PATH set"
  else
    print_fail "PATH not set"
    ((failed++)) || true
  fi

  if [[ -d "$MODULE2_DIR" ]]; then
    print_ok "module2 directory exists: $MODULE2_DIR"
  else
    print_fail "module2 directory missing: $MODULE2_DIR"
    ((failed++)) || true
  fi

  if [[ -d "$MODULE2_DIR/examples/file_types" ]]; then
    print_ok "file_types example exists"
  else
    print_fail "file_types example missing"
    ((failed++)) || true
  fi

  if [[ -f "$MODULE2_DIR/examples/permissions/hello.sh" ]]; then
    print_ok "permissions/hello.sh exists"
  else
    print_fail "permissions/hello.sh missing"
    ((failed++)) || true
  fi

  if [[ -L "$MODULE2_DIR/examples/file_types/my_symlink" ]]; then
    print_ok "file_types symlink (my_symlink) exists"
  else
    print_fail "file_types my_symlink missing or not a symlink"
    ((failed++)) || true
  fi

  if [[ -f "$MODULE2_DIR/examples/environment/inspect_env.sh" ]]; then
    print_ok "environment/inspect_env.sh exists"
  else
    print_fail "environment/inspect_env.sh missing"
    ((failed++)) || true
  fi

  if [[ -x "$MODULE2_DIR/examples/path_and_script/local_cmd.sh" ]]; then
    print_ok "path_and_script/local_cmd.sh exists and is executable"
  else
    print_fail "path_and_script/local_cmd.sh missing or not executable"
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
  print_header "Module 2: Demo commands (copy-paste to try)"
  echo "File types (ls -l, symlinks, broken link):"
  echo "  cd $MODULE2_DIR/examples/file_types"
  echo "  ls -l"
  echo "  readlink my_symlink"
  echo "  readlink broken_link"
  echo ""
  echo "Permissions (chmod, hello.sh, config.txt):"
  echo "  cd $MODULE2_DIR/examples/permissions"
  echo "  ls -l hello.sh config.txt"
  echo "  chmod u+x hello.sh"
  echo "  ./hello.sh"
  echo ""
  echo "Ownership (owner/group in ls -l):"
  echo "  cd $MODULE2_DIR/examples/ownership"
  echo "  ls -l"
  echo "  chmod u+x explain_ls.sh && ./explain_ls.sh"
  echo ""
  echo "Environment (PATH, which, inspect_env.sh):"
  echo "  cd $MODULE2_DIR/examples/environment"
  echo "  chmod u+x inspect_env.sh && ./inspect_env.sh"
  echo "  echo \$PATH"
  echo "  which bash"
  echo "  which git"
  echo ""
  echo "PATH and scripts (why ./ is needed):"
  echo "  cd $MODULE2_DIR/examples/path_and_script"
  echo "  ./local_cmd.sh"
  echo "  local_cmd.sh   # expect 'command not found'"
  echo ""
  echo "Hidden files / dotfiles:"
  echo "  cd $MODULE2_DIR/examples/dotfiles"
  echo "  ls"
  echo "  ls -a"
  echo "  cat .sample_rc"
  echo ""
  print_info "All examples: $MODULE2_DIR/examples/README.md"
  print_info "Full module doc: $DOCS_DIR/MODULE2.md"
}

run_scaffold() {
  print_header "Module 2: Create exercise scaffold"
  local practice_dir="${HOME}/unix_practice"
  local hello_src="$MODULE2_DIR/examples/permissions/hello.sh"
  local hello_dst="${practice_dir}/hello.sh"

  if [[ ! -d "$practice_dir" ]]; then
    print_info "Creating $practice_dir (run module1.sh --scaffold first for full layout)"
    mkdir -p "$practice_dir"
  fi

  if [[ -f "$hello_src" ]]; then
    cp "$hello_src" "$hello_dst"
    print_ok "Copied hello.sh to $hello_dst (use chmod u+x and ./hello.sh to practice)"
  else
    print_fail "Source not found: $hello_src"
    return 1
  fi

  echo ""
  print_ok "Scaffold ready. Try: cd $practice_dir && ls -l hello.sh && chmod u+x hello.sh && ./hello.sh"
  print_info "Exercises: $MODULE2_DIR/exercises/README.md"
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
