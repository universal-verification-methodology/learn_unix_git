#!/usr/bin/env bash
# Module 3 redirection example: prints to stdout and stderr.
# Use: ./print_both.sh > out.log 2> err.log
set -euo pipefail
echo "This line goes to stdout (standard output)"
echo "This line also goes to stdout" >&1
echo "This line goes to stderr (standard error)" >&2
echo "Another stderr line" >&2
