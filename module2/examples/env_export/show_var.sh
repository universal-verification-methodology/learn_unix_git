#!/usr/bin/env bash
# Module 2 env_export example: print MY_VAR (only visible if exported or passed).
set -euo pipefail
echo "MY_VAR is: '${MY_VAR:-<not set>}'"
