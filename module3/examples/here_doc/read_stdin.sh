#!/usr/bin/env bash
# Module 3 here_doc example: reads stdin and echoes each line.
set -euo pipefail
echo "Reading from stdin (use <<EOF ... EOF to feed input):"
while IFS= read -r line; do
  echo "  Got: $line"
done
