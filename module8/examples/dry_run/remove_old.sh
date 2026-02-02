#!/usr/bin/env bash
# Module 8 dry_run example: list or remove files older than 365 days; --dry-run only lists.
set -euo pipefail
DRY_RUN=
while [[ $# -gt 0 ]]; do
  case "$1" in
    --dry-run) DRY_RUN=1; shift ;;
    --help)    echo "Usage: $0 [--dry-run]"; exit 0 ;;
    *)         shift ;;
  esac
done
count=0
while IFS= read -r -d '' f; do
  if [[ -n "${DRY_RUN:-}" ]]; then
    echo "Would remove: $f"
  else
    rm -f "$f"
  fi
  ((count++)) || true
done < <(find . -maxdepth 1 -type f -mtime +365 -print0 2>/dev/null || true)
if [[ -n "${DRY_RUN:-}" ]]; then
  echo "[dry-run] Would remove $count file(s). Run without --dry-run to remove."
else
  echo "Removed $count file(s)."
fi
