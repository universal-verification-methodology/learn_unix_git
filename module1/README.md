# Module 1: Linux & Shell Basics

**Goal**: Get comfortable with the Unix terminal and basic file operations.

## Overview

This module introduces the Unix shell and the essential commands you need before doing any digital design or verification work. Work through the examples in `examples/`, then complete the exercises in `exercises/`.

- **Full module doc**: [docs/MODULE1.md](../docs/MODULE1.md)
- **Run Module 1 demo/check**: From repo root, run `./scripts/module1.sh`

## Directory Layout

```
module1/
├── README.md           # This file
├── examples/           # Hands-on examples (navigation, viewing files)
│   ├── README.md       # How to run the examples
│   ├── navigation/     # Sample project structure for cd/ls/pwd practice
│   └── viewing/        # Sample text file for head/tail/less practice
└── exercises/         # Exercise instructions and optional scaffold
    └── README.md       # Exercise checklist and setup
```

## Quick Start

1. **Self-check** (from repo root):
   ```bash
   ./scripts/module1.sh --check
   ```

2. **Try the navigation example** (sample repo layout):
   ```bash
   cd module1/examples/navigation/sample_repo
   pwd
   ls -la
   cd src && pwd && ls && cd ..
   cd tb && pwd && cd ..
   ```

3. **Try the viewing example** (head, tail, less):
   ```bash
   cd module1/examples/viewing
   head -n 5 sample_for_viewing.txt
   tail -n 5 sample_for_viewing.txt
   less sample_for_viewing.txt   # use / to search, q to quit
   ```

4. **Exercises**: See [module1/exercises/README.md](exercises/README.md) and [docs/MODULE1.md](../docs/MODULE1.md#exercises).

## Next Steps

After completing this module, proceed to [Module 2: Filesystem, Permissions & Environment](../docs/MODULE2.md).
