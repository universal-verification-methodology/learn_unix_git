# Module 2: Filesystem, Permissions & Environment

**Goal**: Understand Unix file types, permissions, and environment variables.

## Overview

This module explains how Unix represents files, directories, and permissions, and how the environment (variables like `PATH`) affects the tools you use. Work through the examples in `examples/`, then complete the exercises in `exercises/`.

- **Full module doc**: [docs/MODULE2.md](../docs/MODULE2.md)
- **Run Module 2 demo/check**: From repo root, run `./scripts/module2.sh`

## Directory Layout

```
module2/
├── README.md           # This file
├── examples/           # Hands-on examples
│   ├── README.md       # How to run the examples
│   ├── file_types/     # ls -l, regular files, dirs, symlinks, broken link
│   ├── permissions/    # chmod, hello.sh, config.txt, chmod table
│   ├── ownership/      # Owner/group in ls -l, explain_ls.sh
│   ├── environment/    # PATH, which, env, inspect_env.sh, commands_to_try.txt
│   ├── path_and_script/   # Why ./script.sh is needed, local_cmd.sh
│   └── dotfiles/       # Hidden files, ls -a, .sample_rc, .gitignore
└── exercises/          # Exercise instructions and optional scaffold
    └── README.md       # Exercise checklist and setup
```

## Quick Start

1. **Self-check** (from repo root):
   ```bash
   ./scripts/module2.sh --check
   ```

2. **Try the file types example** (ls -l, symlinks):
   ```bash
   cd module2/examples/file_types
   ls -l
   ls -l my_symlink
   readlink my_symlink
   ```

3. **Try the permissions example** (chmod, executable script):
   ```bash
   cd module2/examples/permissions
   ls -l hello.sh
   chmod u+x hello.sh
   ls -l hello.sh
   ./hello.sh
   ```

4. **Try the environment example** (PATH, which, inspect_env.sh):
   ```bash
   cd module2/examples/environment
   chmod u+x inspect_env.sh
   ./inspect_env.sh
   which bash
   which git
   ```

5. **Try PATH and scripts** (why ./ is needed):
   ```bash
   cd module2/examples/path_and_script
   ./local_cmd.sh
   local_cmd.sh
   ```

6. **More examples**: See `module2/examples/README.md` for ownership, dotfiles, and full command lists.

7. **Exercises**: See [module2/exercises/README.md](exercises/README.md) and [docs/MODULE2.md](../docs/MODULE2.md#exercises).

## Next Steps

After completing this module, proceed to [Module 3: Processes, Pipes & Redirection](../docs/MODULE3.md).
