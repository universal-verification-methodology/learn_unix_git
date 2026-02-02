#!/usr/bin/env bash
#
# Module 3: Processes, Pipes & Redirection — demo and self-check
# Usage: ./scripts/module3.sh [--check] [--demo] [--scaffold]
#
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
MODULE3_DIR="$PROJECT_ROOT/module3"
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

Module 3: Processes, Pipes & Redirection — run checks, demo, or create exercise scaffold.

Options:
  --check     Run environment self-check (ps, grep, module3 examples)
  --demo      Print demo commands for processes, redirection, pipes, background, troubleshooting
  --scaffold  Copy sample.log to ~/unix_practice/ for grep practice (if ~/unix_practice exists)
  --help      Show this help

With no options, runs --check and then --demo.
EOF
}

run_check() {
  print_header "Module 3: Environment self-check"
  local failed=0

  if command -v ps &>/dev/null; then
    print_ok "ps available"
  else
    print_fail "ps not found"
    ((failed++)) || true
  fi

  if command -v grep &>/dev/null; then
    print_ok "grep available"
  else
    print_fail "grep not found"
    ((failed++)) || true
  fi

  if command -v tail &>/dev/null; then
    print_ok "tail available"
  else
    print_fail "tail not found"
    ((failed++)) || true
  fi

  if [[ -d "$MODULE3_DIR" ]]; then
    print_ok "module3 directory exists: $MODULE3_DIR"
  else
    print_fail "module3 directory missing: $MODULE3_DIR"
    ((failed++)) || true
  fi

  if [[ -f "$MODULE3_DIR/examples/processes/show_pid.sh" ]]; then
    print_ok "processes/show_pid.sh exists"
  else
    print_fail "processes/show_pid.sh missing"
    ((failed++)) || true
  fi

  if [[ -f "$MODULE3_DIR/examples/redirection/print_both.sh" ]]; then
    print_ok "redirection/print_both.sh exists"
  else
    print_fail "redirection/print_both.sh missing"
    ((failed++)) || true
  fi

  if [[ -f "$MODULE3_DIR/examples/pipes/sample.log" ]]; then
    print_ok "pipes/sample.log exists"
  else
    print_fail "pipes/sample.log missing"
    ((failed++)) || true
  fi

  if [[ -f "$MODULE3_DIR/examples/troubleshooting/failing_cmd.sh" ]]; then
    print_ok "troubleshooting/failing_cmd.sh exists"
  else
    print_fail "troubleshooting/failing_cmd.sh missing"
    ((failed++)) || true
  fi

  if [[ -f "$MODULE3_DIR/examples/combining/combine_demo.sh" ]]; then
    print_ok "combining/combine_demo.sh exists"
  else
    print_fail "combining/combine_demo.sh missing"
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
  print_header "Module 3: Demo commands (copy-paste to try)"
  echo "Processes (ps, PID, exit status):"
  echo "  cd $MODULE3_DIR/examples/processes"
  echo "  chmod u+x show_pid.sh fail.sh"
  echo "  ./show_pid.sh"
  echo "  echo \$?"
  echo "  ./fail.sh"
  echo "  echo \$?"
  echo "  ps aux | head -10"
  echo ""
  echo "Redirection (>, >>, 2>, 2>&1):"
  echo "  cd $MODULE3_DIR/examples/redirection"
  echo "  chmod u+x print_both.sh"
  echo "  ./print_both.sh > out.log 2> err.log"
  echo "  cat out.log err.log"
  echo ""
  echo "Pipes and grep:"
  echo "  cd $MODULE3_DIR/examples/pipes"
  echo "  grep ERROR sample.log"
  echo "  grep -i warning sample.log"
  echo "  grep -i error sample.log | less"
  echo ""
  echo "Background jobs (&, jobs, tail):"
  echo "  cd $MODULE3_DIR/examples/background"
  echo "  chmod u+x slow_output.sh"
  echo "  ./slow_output.sh > bg.log 2>&1 &"
  echo "  jobs"
  echo "  tail -5 bg.log"
  echo ""
  echo "Troubleshooting (tee, 2>&1):"
  echo "  cd $MODULE3_DIR/examples/troubleshooting"
  echo "  chmod u+x failing_cmd.sh"
  echo "  ./failing_cmd.sh 2>&1 | tee debug.log"
  echo "  cat debug.log"
  echo ""
  echo "Combining tools (2>&1 | tee | grep):"
  echo "  cd $MODULE3_DIR/examples/combining"
  echo "  chmod u+x combine_demo.sh"
  echo "  ./combine_demo.sh 2>&1 | tee run.log | grep -i error"
  echo "  cat run.log"
  echo ""
  print_info "All examples: $MODULE3_DIR/examples/README.md"
  print_info "Full module doc: $DOCS_DIR/MODULE3.md"
}

run_scaffold() {
  print_header "Module 3: Create exercise scaffold"
  local practice_dir="${HOME}/unix_practice"
  local sample_src="$MODULE3_DIR/examples/pipes/sample.log"
  local sample_dst="${practice_dir}/sample.log"

  if [[ ! -d "$practice_dir" ]]; then
    print_info "Creating $practice_dir (run module1.sh --scaffold first for full layout)"
    mkdir -p "$practice_dir"
  fi

  if [[ -f "$sample_src" ]]; then
    cp "$sample_src" "$sample_dst"
    print_ok "Copied sample.log to $sample_dst (use grep ERROR sample.log etc.)"
  else
    print_fail "Source not found: $sample_src"
    return 1
  fi

  echo ""
  print_ok "Scaffold ready. Try: cd $practice_dir && grep ERROR sample.log"
  print_info "Exercises: $MODULE3_DIR/exercises/README.md"
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
