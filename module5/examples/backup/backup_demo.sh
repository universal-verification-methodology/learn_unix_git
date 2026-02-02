#!/usr/bin/env bash
# Module 5 backup example: creates a timestamped tar.gz of project_structure/sample_project.
# Run from repo root or from module5/examples: ./backup_demo.sh
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
EXAMPLES_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
PROJECT_DIR="$EXAMPLES_DIR/project_structure/sample_project"
STAMP=$(date +%Y%m%d_%H%M%S)
ARCHIVE="backup_sample_project_${STAMP}.tar.gz"
cd "$EXAMPLES_DIR"
if [ ! -d "$PROJECT_DIR" ]; then
  echo "Project dir not found: $PROJECT_DIR"
  exit 1
fi
tar czf "$ARCHIVE" -C "$EXAMPLES_DIR" project_structure/sample_project
echo "Created: $EXAMPLES_DIR/$ARCHIVE"
ls -la "$ARCHIVE"
