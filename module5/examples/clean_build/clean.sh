#!/usr/bin/env bash
# Module 5 clean_build example: remove build/ and logs/ contents in sample_project.
set -euo pipefail
cd "$(dirname "$0")/sample_project"
echo "Removing files in build/ and logs/..."
find build logs -type f 2>/dev/null || true
find build logs -type f -delete 2>/dev/null || true
echo "Done. build/ and logs/ are now empty (dirs kept)."
