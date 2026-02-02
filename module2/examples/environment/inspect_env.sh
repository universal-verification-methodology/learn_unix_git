#!/usr/bin/env bash
# Module 2 environment example: run with ./inspect_env.sh (chmod u+x first)
# Shows PATH, which, and a few common variables.

set -euo pipefail

echo "=== HOME ==="
echo "${HOME:-<not set>}"
echo ""
echo "=== PATH (first 3 entries) ==="
echo "$PATH" | tr ':' '\n' | head -3
echo "..."
echo ""
echo "=== which (bash, ls, git) ==="
for cmd in bash ls git; do
  if command -v "$cmd" &>/dev/null; then
    echo "  $cmd -> $(which "$cmd")"
  else
    echo "  $cmd -> not found"
  fi
done
echo ""
echo "=== SHELL ==="
echo "${SHELL:-<not set>}"
