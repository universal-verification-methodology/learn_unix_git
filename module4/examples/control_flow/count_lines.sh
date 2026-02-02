#!/usr/bin/env bash
# Module 4 control_flow example: for each .log file, print name and line count.
# Run: ./count_lines.sh
set -euo pipefail
for file in *.log; do
  if [ -f "$file" ]; then
    count=$(wc -l < "$file")
    echo "$file: $count lines"
  fi
done
