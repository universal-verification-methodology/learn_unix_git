#!/usr/bin/env bash
# Module 2 groups example: show current user and group info.
set -euo pipefail
echo "=== id ==="
id
echo ""
echo "=== id -un (username) ==="
id -un
echo ""
echo "=== id -Gn (group names) ==="
id -Gn
echo ""
echo "=== groups ==="
groups
