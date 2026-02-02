#!/usr/bin/env bash
# Module 2 umask example: creates a file and dir so you can see current umask effect.
set -euo pipefail
echo "Current umask: $(umask)"
touch demo_file.txt
mkdir -p demo_dir
ls -l demo_file.txt demo_dir
echo "Remove with: rm demo_file.txt; rmdir demo_dir"
