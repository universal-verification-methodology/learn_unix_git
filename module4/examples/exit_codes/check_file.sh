#!/usr/bin/env bash
# Module 4 exit_codes example: exit 0 if file exists, 1 otherwise.
set -euo pipefail
if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <file>"
  exit 1
fi
if [[ -f "$1" ]]; then
  echo "File exists: $1"
  exit 0
else
  echo "File not found: $1"
  exit 1
fi
