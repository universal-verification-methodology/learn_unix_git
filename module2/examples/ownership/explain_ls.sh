#!/usr/bin/env bash
# Module 2 ownership example: run with ./explain_ls.sh
# Prints ls -l in this directory and explains the columns.

set -euo pipefail

echo "=== ls -l in this directory ==="
ls -l
echo ""
echo "=== Column meanings (left to right) ==="
echo "  1. Type + permissions (e.g. -rw-r--r-- or drwxr-xr-x)"
echo "  2. Link count"
echo "  3. Owner (user)"
echo "  4. Group"
echo "  5. Size (bytes)"
echo "  6. Date/time"
echo "  7. Name"
echo ""
echo "You are: $(whoami). Files you create are owned by you."
