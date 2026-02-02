# Module 6: Git Basics for Course Work

**Goal**: Use Git to track changes, work with course repositories, and submit homework.

## Overview

This module introduces Git as a local version control system and shows how to use it with GitHub for typical course workflows. Work through the examples in `examples/`, then complete the exercises in `exercises/`.

- **Full module doc**: [docs/MODULE6.md](../docs/MODULE6.md)
- **Run Module 6 demo/check**: From repo root, run `./scripts/module6.sh`

## Directory Layout

```
module6/
├── README.md           # This file
├── examples/           # Hands-on examples
│   ├── README.md       # How to run the examples
│   ├── concepts/       # repo, working tree, staging area, commit
│   ├── init_clone/     # git init, git clone
│   ├── status_diff/    # git status, git diff
│   ├── add_commit_log/ # git add, git commit, git log
│   ├── gitignore/      # .gitignore for build/, *.log
│   └── remote_undo/   # remote -v, pull, push; git restore
└── exercises/          # Exercise instructions and optional scaffold
    └── README.md       # Exercise checklist and setup
```

## Quick Start

1. **Self-check** (from repo root):
   ```bash
   ./scripts/module6.sh --check
   ```

2. **Create a practice repo** (so you can try commands safely):
   ```bash
   ./scripts/module6.sh --scaffold
   cd ~/unix_practice/git_demo
   git status
   git log --oneline
   ```

3. **Try status and diff** (in your practice repo or this repo):
   ```bash
   cd ~/unix_practice/git_demo
   git status
   echo "new line" >> notes.md
   git diff
   ```

4. **Try .gitignore** (see `module6/examples/gitignore/` for sample file and README).

5. **More examples**: See `module6/examples/README.md` for concepts, init/clone, add/commit/log, remote, and undo.

6. **Exercises**: See [module6/exercises/README.md](exercises/README.md) and [docs/MODULE6.md](../docs/MODULE6.md#exercises).

## Next Steps

After completing this module, proceed to [Module 7: Advanced Git for Collaboration & IP Reuse](../docs/MODULE7.md).
