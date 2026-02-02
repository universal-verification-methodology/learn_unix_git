#!/usr/bin/env bash
# Module 3 combining example: prints mixed stdout/stderr for pipeline practice.
# Use: ./combine_demo.sh 2>&1 | tee run.log | grep -i error
set -euo pipefail
echo "[INFO] Combine demo started"
echo "[ERROR] Simulated error line one" >&2
echo "[INFO] Step 2 complete"
echo "[WARNING] Low disk space" >&2
echo "[ERROR] Simulated error line two" >&2
echo "[INFO] Done"
