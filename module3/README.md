# Module 3: Processes, Pipes & Redirection

**Goal**: Manage running programs and connect commands using pipes and redirection.

## Overview

This module teaches how Unix runs programs (processes), how to stop them, and how to connect commands with pipes and redirection. Work through the examples in `examples/`, then complete the exercises in [CHECKLIST.md](CHECKLIST.md).

- **Full module doc**: [docs/MODULE3.md](../docs/MODULE3.md)
- **Run Module 3 demo/check**: From repo root, run `./scripts/module3.sh`

## Directory Layout

```
module3/
├── README.md           # This file
├── CHECKLIST.md        # Exercise checklist (check off as you go)
├── EXAMPLES.md         # Index of hands-on examples with "Try these"
├── examples/           # Hands-on examples
│   ├── README.md       # How to run the examples
│   ├── processes/     # ps, PID, exit status, Ctrl+C
│   ├── redirection/   # >, >>, 2>, 2>&1, tee
│   ├── pipes/         # |, grep, grep -i, sample log
│   ├── background/    # &, jobs, tail -f
│   ├── troubleshooting/   # tee, 2>&1, failing command
│   ├── combining/     # 2>&1 | tee | grep, pipeline chains
│   ├── sort_uniq/     # sort, uniq, wc -l
│   ├── xargs/         # xargs from find/grep -l
│   ├── cut_columns/   # cut -d, -f, -c
│   └── here_doc/      # <<EOF here documents
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

6. **More examples**: See [EXAMPLES.md](EXAMPLES.md) for the full index; see `examples/README.md` for background jobs and full command lists.

7. **Exercises**: See [CHECKLIST.md](CHECKLIST.md) and [docs/MODULE3.md#exercises](../docs/MODULE3.md#exercises).

## Next Steps

After completing this module, proceed to [Module 4: Shell Productivity & Basic Scripting](../docs/MODULE4.md).
