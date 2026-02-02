# Module 7: Advanced Git for Collaboration & IP Reuse

**Goal**: Use Git effectively in collaborative projects, including branching, merging, and submodules.

## Overview

This module builds on Git basics to cover branching, merging and conflicts, submodules for shared IP, and inspecting history. Work through the examples in `examples/`, then complete the exercises in `exercises/`.

- **Full module doc**: [docs/MODULE7.md](../docs/MODULE7.md)
- **Run Module 7 demo/check**: From repo root, run `./scripts/module7.sh`

## Directory Layout

```
module7/
├── README.md           # This file
├── examples/           # Hands-on examples
│   ├── README.md       # How to run the examples
│   ├── branching/      # git branch, git checkout -b
│   ├── merging/        # git merge, fast-forward
│   ├── conflicts/      # conflict markers, resolve
│   ├── submodules/     # git submodule add, update --init
│   ├── blame_bisect/   # git blame, git bisect
│   └── team_workflow/  # branch naming, PR flow
└── exercises/          # Exercise instructions and optional scaffold
    └── README.md       # Exercise checklist and setup
```

## Quick Start

1. **Self-check** (from repo root):
   ```bash
   ./scripts/module7.sh --check
   ```

2. **Use a practice repo** (from Module 6 scaffold or your own):
   ```bash
   cd ~/unix_practice/git_demo
   git branch
   git checkout -b feature/readme-update
   git checkout main
   git merge feature/readme-update
   ```

3. **Try conflict resolution** (see `module7/examples/conflicts/` for markers and steps).

4. **More examples**: See `module7/examples/README.md` for submodules, blame, bisect, and team workflow.

5. **Exercises**: See [module7/exercises/README.md](exercises/README.md) and [docs/MODULE7.md](../docs/MODULE7.md#exercises).

## Next Steps

After completing this module, proceed to [Module 8: End-to-End Project Workflow](../docs/MODULE8.md).
