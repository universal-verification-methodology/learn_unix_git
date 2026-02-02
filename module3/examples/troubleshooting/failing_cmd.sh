#!/usr/bin/env bash
# Module 3 troubleshooting example: prints then exits with status 1.
# Use: ./failing_cmd.sh 2>&1 | tee debug.log
set -euo pipefail
echo "Simulating a failing command..."
echo "stdout: build started"
echo "stderr: ERROR: missing file config.v" >&2
echo "stderr: FAIL: compilation aborted" >&2
exit 1
