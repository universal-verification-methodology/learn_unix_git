#!/usr/bin/env bash
# Module 8 pre_push_checks example: quick "ready to push?" check.
# Run from inside a Git repo (e.g. project root).
set -euo pipefail
echo "=== git status ==="
git status --short
echo ""
echo "=== Last 3 commits (what would be pushed) ==="
git log --oneline -3
echo ""
if [[ -n $(git status -s) ]]; then
  echo "You have uncommitted changes. Commit or stash before pushing."
  exit 1
fi
echo "Working tree clean. Consider: git pull, then git push."
