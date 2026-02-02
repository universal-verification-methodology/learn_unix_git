#!/usr/bin/env bash
# Module 4 read_input example: prompt for name and greet.
set -euo pipefail
read -p "Enter your name: " name
echo "Hello, ${name:-guest}!"
