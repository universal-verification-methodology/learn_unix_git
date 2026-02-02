#!/usr/bin/env bash
# Module 4 case_statement example: case on first argument.
set -euo pipefail
word="${1:-}"
case "$word" in
  hello|hi)   echo "Hi there!" ;;
  bye|exit)   echo "Goodbye!" ;;
  *)          echo "Unknown: $word" ;;
esac
