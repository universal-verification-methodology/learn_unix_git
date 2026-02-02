#!/usr/bin/env bash
# Module 4 safe_scripting example: dry run by default; deletes tmp/*.tmp only with --confirm.
# Run: ./clean_tmp.sh [--confirm]
set -euo pipefail
DIR="tmp"
CONFIRM=false
for arg in "$@"; do
  if [ "$arg" = "--confirm" ]; then
    CONFIRM=true
  fi
done

if [ ! -d "$DIR" ]; then
  echo "Directory $DIR not found."
  exit 1
fi

for file in "$DIR"/*.tmp; do
  [ -e "$file" ] || continue
  if [ "$CONFIRM" = true ]; then
    echo "Deleting: $file"
    rm -- "$file"
  else
    echo "Would delete: $file (run with --confirm to actually delete)"
  fi
done
