#!/usr/bin/env bash
# Module 3 xargs example: echoes each argument on its own line.
set -euo pipefail
for arg in "$@"; do
  echo "Got: $arg"
done
