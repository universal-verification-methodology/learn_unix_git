#!/usr/bin/env bash
# Module 3 background example: prints lines slowly so you can try tail -f.
# Run: ./slow_output.sh > bg.log 2>&1 &
set -euo pipefail
for i in 1 2 3 4 5 6 7 8 9 10; do
  echo "[$(date +%H:%M:%S)] Line $i"
  sleep 1
done
echo "[$(date +%H:%M:%S)] Done"
