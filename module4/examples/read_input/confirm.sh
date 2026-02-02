#!/usr/bin/env bash
# Module 4 read_input example: y/n confirmation before proceeding.
set -euo pipefail
read -p "Proceed? (y/n) " answer
if [[ "${answer,,}" == y ]]; then
  echo "Proceeding..."
else
  echo "Aborted."
fi
