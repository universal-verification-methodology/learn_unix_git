# Module 3: Processes, Pipes & Redirection

**Goal**: Manage running programs and connect commands using pipes and redirection.

## Overview

This module teaches how Unix runs programs (processes), how to stop them, and how to connect commands with pipes and redirection. Work through the examples in `examples/`, then complete the exercises in `exercises/`.

- **Full module doc**: [docs/MODULE3.md](../docs/MODULE3.md)
- **Run Module 3 demo/check**: From repo root, run `./scripts/module3.sh`

## Directory Layout

```
module3/
├── README.md           # This file
├── examples/           # Hands-on examples
│   ├── README.md       # How to run the examples
│   ├── processes/     # ps, PID, exit status, Ctrl+C
│   ├── redirection/   # >, >>, 2>, 2>&1, tee
│   ├── pipes/         # |, grep, grep -i, sample log
│   ├── background/    # &, jobs, tail -f
│   ├── troubleshooting/   # tee, 2>&1, failing command
│   └── combining/     # 2>&1 | tee | grep, pipeline chains
└── exercises/          # Exercise instructions and optional scaffold
    └── README.md       # Exercise checklist and setup
```

## Quick Start

1. **Self-check** (from repo root):
   ```bash
   ./scripts/module3.sh --check
   ```

2. **Try the processes example** (ps, PID, exit status):
   ```bash
   cd module3/examples/processes
   ./show_pid.sh
   echo $?
   ps aux | head -5
   ```

3. **Try the redirection example** (> , >>, 2>, 2>&1):
   ```bash
   cd module3/examples/redirection
   ./print_both.sh > out.log 2> err.log
   cat out.log err.log
   ```

4. **Try the pipes example** (|, grep):
   ```bash
   cd module3/examples/pipes
   grep ERROR sample.log
   grep -i warning sample.log
   grep -i error sample.log | less
   ```

5. **Try the combining example** (2>&1 | tee | grep):
   ```bash
   cd module3/examples/combining
   chmod u+x combine_demo.sh
   ./combine_demo.sh 2>&1 | tee run.log | grep -i error
   cat run.log
   ```

6. **More examples**: See `module3/examples/README.md` for background jobs and full command lists.

7. **Exercises**: See [module3/exercises/README.md](exercises/README.md) and [docs/MODULE3.md](../docs/MODULE3.md#exercises).

## Next Steps

After completing this module, proceed to [Module 4: Shell Productivity & Basic Scripting](../docs/MODULE4.md).
