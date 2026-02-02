# Module 8 makefile_basics example: minimal Makefile for build/run/clean.
.PHONY: all build run clean help

all: build

build:
	@echo "[Make] Creating build/ and logs/..."
	@mkdir -p build logs
	@touch build/.gitkeep
	@echo "[Make] Done."

run: build
	@echo "[Make] Running demo..."
	@echo "[INFO] Project: $(shell pwd)" | tee -a logs/run.log
	@echo "[Make] Done. See logs/run.log"

clean:
	@echo "[Make] Cleaning build/ and logs/..."
	@find build logs -type f ! -name .gitkeep -delete 2>/dev/null || true
	@echo "[Make] Done."

help:
	@echo "Targets: all (default), build, run, clean, help"
