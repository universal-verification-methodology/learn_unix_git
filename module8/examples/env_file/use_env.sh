#!/usr/bin/env bash
# Module 8 env_file example: source sample.env and print variables.
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
if [[ -f "$SCRIPT_DIR/sample.env" ]]; then
  source "$SCRIPT_DIR/sample.env"
  echo "MY_VAR=${MY_VAR:-<unset>}"
  echo "ANOTHER_VAR=${ANOTHER_VAR:-<unset>}"
else
  echo "sample.env not found"
  exit 1
fi
