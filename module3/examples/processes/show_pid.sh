#!/usr/bin/env bash
# Module 3 processes example: prints this script's PID and exits 0.
set -euo pipefail
echo "PID of this process: $$"
echo "Run 'echo \$?' after this to see exit status (0 = success)"
exit 0
