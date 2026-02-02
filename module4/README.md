# Module 4: Shell Productivity & Basic Scripting

**Goal**: Automate repetitive commands and work efficiently in the shell.

## Overview

This module focuses on getting comfortable and efficient in the shell and on writing small, safe scripts. Work through the examples in `examples/`, then complete the exercises in [CHECKLIST.md](CHECKLIST.md).

- **Full module doc**: [docs/MODULE4.md](../docs/MODULE4.md)
- **Run Module 4 demo/check**: From repo root, run `./scripts/module4.sh`

## Directory Layout

```
module4/
├── README.md           # This file
├── CHECKLIST.md        # Exercise checklist (check off as you go)
├── EXAMPLES.md         # Index of hands-on examples with "Try these"
├── examples/           # Hands-on examples
│   ├── README.md       # How to run the examples
│   ├── history/        # history, shortcuts, Ctrl+R
│   ├── aliases/        # alias ll, cproj, persist
│   ├── script_basics/  # shebang, say_hello.sh
│   ├── arguments/      # $1, greet.sh, default
│   ├── control_flow/   # if, for, count_lines.sh
│   ├── safe_scripting/ # set -e, quoting, dry run (clean_tmp.sh)
│   ├── functions/      # shell functions vs scripts
│   ├── read_input/     # read -p, prompt_name.sh, confirm.sh
│   ├── exit_codes/     # exit, $?, success/failure scripts
│   └── case_statement/ # case ... esac, greet.sh
```

## Quick Start

1. **Self-check** (from repo root):
   ```bash
   ./scripts/module4.sh --check
   ```

2. **Try the script basics example** (shebang, first script):
   ```bash
   cd module4/examples/script_basics
   ./say_hello.sh
   ```

3. **Try the arguments example** ($1, default):
   ```bash
   cd module4/examples/arguments
   ./greet.sh Alice
   ./greet.sh
   ```

4. **Try the control flow example** (for loop, batch):
   ```bash
   cd module4/examples/control_flow
   ./count_lines.sh
   ```

5. **Try the safe scripting example** (dry run, --confirm):
   ```bash
   cd module4/examples/safe_scripting
   ./clean_tmp.sh
   ./clean_tmp.sh --confirm
   ```

6. **More examples**: See [EXAMPLES.md](EXAMPLES.md) for the full index; see `examples/README.md` for history, aliases, and full command lists.

7. **Exercises**: See [CHECKLIST.md](CHECKLIST.md) and [docs/MODULE4.md#exercises](../docs/MODULE4.md#exercises).

## Next Steps

After completing this module, proceed to [Module 5: Editors, Projects & Archives](../docs/MODULE5.md).
