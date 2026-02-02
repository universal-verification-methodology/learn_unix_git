# Module 1: Linux & Shell Basics

**Goal**: Get comfortable with the Unix terminal and basic file operations.

## Overview

This module introduces the Unix shell and the essential commands you need before doing any digital design or verification work. Work through the examples in `examples/`, then complete the exercises in [CHECKLIST.md](CHECKLIST.md).

- **Full module doc**: [docs/MODULE1.md](../docs/MODULE1.md)
- **Run Module 1 demo/check**: From repo root, run `./scripts/module1.sh`

## Directory Layout

```
module1/
├── README.md           # This file
├── CHECKLIST.md        # Exercise checklist (check off as you go)
├── EXAMPLES.md         # Index of hands-on examples with "Try these"
├── examples/           # Hands-on examples
│   ├── README.md       # How to run the examples
│   ├── navigation/     # Sample project structure for cd/ls/pwd practice
│   ├── paths/          # Absolute vs relative path practice
│   ├── file_operations/   # cp, mv, mkdir, rm sandbox
│   ├── viewing/        # cat, head, tail, less (short + long files)
│   ├── design_files/   # RTL-style .v, .sv, .md, .cpp for cat/less
│   ├── help/           # man, --help, whatis, apropos
│   ├── wildcards/      # *, ?, [...] filename expansion
│   ├── touch/          # touch (empty files, timestamps)
│   ├── ls_options/     # ls -l, -t, -S, -h, -R
│   └── wc_basics/      # wc -l, -w, -c
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

3. **Try the viewing example** (cat, head, tail, less):
   ```bash
   cd module1/examples/viewing
   cat short.txt
   head -n 5 sample_for_viewing.txt
   tail -n 5 sample_for_viewing.txt
   less sample_for_viewing.txt   # use / to search, q to quit
   ```

4. **More examples**: See [EXAMPLES.md](EXAMPLES.md) for the full index; see `examples/README.md` for the same list with more detail.

5. **Exercises**: See [CHECKLIST.md](CHECKLIST.md) and [docs/MODULE1.md#exercises](../docs/MODULE1.md#exercises).

## Next Steps

After completing this module, proceed to [Module 2: Filesystem, Permissions & Environment](../docs/MODULE2.md).
