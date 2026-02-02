#!/usr/bin/env bash
# Module 4 arguments example: greets the name given as $1, or "World" if none.
# Run: ./greet.sh [name]
set -euo pipefail
NAME="${1:-World}"
echo "Hello, ${NAME}!"
