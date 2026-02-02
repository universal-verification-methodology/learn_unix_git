#!/usr/bin/env bash
# Module 8 scripts example: placeholder "run" script. Writes to logs/run.log.
# Run from sample_project root: ./scripts/run_demo.sh
# Or: ./scripts/run_demo.sh > logs/run.log 2>&1
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
LOG_DIR="$PROJECT_ROOT/logs"
mkdir -p "$LOG_DIR"
LOG_FILE="$LOG_DIR/run.log"
echo "[$(date -Iseconds)] Run started" | tee -a "$LOG_FILE"
echo "[INFO] Project root: $PROJECT_ROOT" | tee -a "$LOG_FILE"
echo "[INFO] Listing src/ and tb/" | tee -a "$LOG_FILE"
ls -la "$PROJECT_ROOT/src" "$PROJECT_ROOT/tb" 2>/dev/null || true | tee -a "$LOG_FILE"
echo "[$(date -Iseconds)] Run finished" | tee -a "$LOG_FILE"
