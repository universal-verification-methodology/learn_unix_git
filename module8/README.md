# Module 8: End-to-End Project Workflow (Unix + Git + Design Flow)

**Goal**: Combine Unix and Git skills into a complete, repeatable project workflow.

## Overview

This final module connects all previous Unix and Git topics into one workflow: clone a template, run scripts, inspect logs, develop with small commits, and submit via GitHub. Work through the examples in `examples/`, then complete the exercises in [CHECKLIST.md](CHECKLIST.md).

- **Full module doc**: [docs/MODULE8.md](../docs/MODULE8.md)
- **Run Module 8 demo/check**: From repo root, run `./scripts/module8.sh`

## Directory Layout

```
module8/
├── README.md           # This file
├── CHECKLIST.md        # Exercise checklist (check off as you go)
├── EXAMPLES.md         # Index of hands-on examples with "Try these"
├── examples/           # Hands-on examples
│   ├── README.md       # How to run the examples
│   ├── template/       # clone, inspect layout
│   ├── scripts/        # run scripts, redirect output
│   ├── logs/           # log dirs, tail/grep, clean
│   ├── iterative/      # small commits, edit-run-commit loop
│   ├── submission/     # pre-submission checks, push
│   ├── end_to_end/     # full scenario walkthrough
│   ├── makefile_basics/   # Makefile build, run, clean
│   ├── pre_push_checks/   # check_ready.sh, pre-push checklist
│   ├── dry_run/        # dry-run scripts, remove_old.sh
│   └── env_file/       # .env, source, use_env.sh
```

## Quick Start

1. **Self-check** (from repo root):
   ```bash
   ./scripts/module8.sh --check
   ```

2. **Try the sample project** (template + script + logs):
   ```bash
   cd module8/examples/template/sample_project
   ls -la
   chmod +x scripts/run_demo.sh
   ./scripts/run_demo.sh
   ./scripts/run_demo.sh > logs/run.log 2>&1
   ls logs/
   grep -i error logs/run.log
   ```

3. **More examples**: See [EXAMPLES.md](EXAMPLES.md) for the full index; see `examples/README.md` for iterative development, submission, and end-to-end flow.

4. **Exercises**: See [CHECKLIST.md](CHECKLIST.md) and [docs/MODULE8.md#exercises](../docs/MODULE8.md#exercises).

## Next Steps

After completing this module, you are ready to apply Unix and Git in your digital design and verification courses.
