#!/usr/bin/env bash
#
# Module 4: Shell Productivity & Basic Scripting — demo and self-check
# Usage: ./scripts/module4.sh [--check] [--demo] [--scaffold]
#
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
MODULE4_DIR="$PROJECT_ROOT/module4"
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

Module 4: Shell Productivity & Basic Scripting — run checks, demo, or create exercise scaffold.

Options:
  --check     Run environment self-check (bash, module4 examples)
  --demo      Print demo commands for history, aliases, scripts, arguments, control flow, safe scripting
  --scaffold  Copy say_hello.sh and greet.sh to ~/unix_practice/ (if ~/unix_practice exists)
  --help      Show this help

With no options, runs --check and then --demo.
EOF
}

run_check() {
  print_header "Module 4: Environment self-check"
  local failed=0

  if command -v bash &>/dev/null; then
    print_ok "bash available"
  else
    print_fail "bash not found"
    ((failed++)) || true
  fi

  if [[ -d "$MODULE4_DIR" ]]; then
    print_ok "module4 directory exists: $MODULE4_DIR"
  else
    print_fail "module4 directory missing: $MODULE4_DIR"
    ((failed++)) || true
  fi

  if [[ -f "$MODULE4_DIR/examples/script_basics/say_hello.sh" ]]; then
    print_ok "script_basics/say_hello.sh exists"
  else
    print_fail "script_basics/say_hello.sh missing"
    ((failed++)) || true
  fi

  if [[ -f "$MODULE4_DIR/examples/arguments/greet.sh" ]]; then
    print_ok "arguments/greet.sh exists"
  else
    print_fail "arguments/greet.sh missing"
    ((failed++)) || true
  fi

  if [[ -f "$MODULE4_DIR/examples/control_flow/count_lines.sh" ]]; then
    print_ok "control_flow/count_lines.sh exists"
  else
    print_fail "control_flow/count_lines.sh missing"
    ((failed++)) || true
  fi

  if [[ -f "$MODULE4_DIR/examples/safe_scripting/clean_tmp.sh" ]]; then
    print_ok "safe_scripting/clean_tmp.sh exists"
  else
    print_fail "safe_scripting/clean_tmp.sh missing"
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
  print_header "Module 4: Demo commands (copy-paste to try)"
  echo "History and shortcuts (in your shell):"
  echo "  history | tail -20"
  echo "  Ctrl+R to search history"
  echo "  Ctrl+A / Ctrl+E for start/end of line"
  echo ""
  echo "Aliases (in your shell):"
  echo "  alias ll='ls -alF'"
  echo "  alias"
  echo ""
  echo "Script basics:"
  echo "  cd $MODULE4_DIR/examples/script_basics"
  echo "  chmod u+x say_hello.sh"
  echo "  ./say_hello.sh"
  echo ""
  echo "Arguments:"
  echo "  cd $MODULE4_DIR/examples/arguments"
  echo "  chmod u+x greet.sh"
  echo "  ./greet.sh Alice"
  echo "  ./greet.sh"
  echo ""
  echo "Control flow (for loop, count lines):"
  echo "  cd $MODULE4_DIR/examples/control_flow"
  echo "  chmod u+x count_lines.sh"
  echo "  ./count_lines.sh"
  echo ""
  echo "Safe scripting (dry run, --confirm):"
  echo "  cd $MODULE4_DIR/examples/safe_scripting"
  echo "  chmod u+x clean_tmp.sh"
  echo "  ./clean_tmp.sh"
  echo "  ./clean_tmp.sh --confirm"
  echo ""
  print_info "All examples: $MODULE4_DIR/examples/README.md"
  print_info "Full module doc: $DOCS_DIR/MODULE4.md"
}

run_scaffold() {
  print_header "Module 4: Create exercise scaffold"
  local practice_dir="${HOME}/unix_practice"
  local say_src="$MODULE4_DIR/examples/script_basics/say_hello.sh"
  local greet_src="$MODULE4_DIR/examples/arguments/greet.sh"
  local say_dst="${practice_dir}/say_hello.sh"
  local greet_dst="${practice_dir}/greet.sh"

  if [[ ! -d "$practice_dir" ]]; then
    print_info "Creating $practice_dir (run module1.sh --scaffold first for full layout)"
    mkdir -p "$practice_dir"
  fi

  if [[ -f "$say_src" ]]; then
    cp "$say_src" "$say_dst"
    print_ok "Copied say_hello.sh to $say_dst"
  else
    print_fail "Source not found: $say_src"
  fi

  if [[ -f "$greet_src" ]]; then
    cp "$greet_src" "$greet_dst"
    print_ok "Copied greet.sh to $greet_dst"
  else
    print_fail "Source not found: $greet_src"
  fi

  echo ""
  print_ok "Scaffold ready. Try: cd $practice_dir && chmod u+x say_hello.sh greet.sh && ./say_hello.sh && ./greet.sh YourName"
  print_info "Exercises: $MODULE4_DIR/exercises/README.md"
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
