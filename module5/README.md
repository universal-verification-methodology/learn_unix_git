# Module 5: Editors, Projects & Archives

**Goal**: Work effectively with editors, organize projects, and move/share code safely.

## Overview

This module covers practical skills for managing source code and project files: using editors, structuring projects, and using archives to move or back up work. Work through the examples in `examples/`, then complete the exercises in [CHECKLIST.md](CHECKLIST.md).

- **Full module doc**: [docs/MODULE5.md](../docs/MODULE5.md)
- **Run Module 5 demo/check**: From repo root, run `./scripts/module5.sh`

## Directory Layout

```
module5/
├── README.md           # This file
├── CHECKLIST.md        # Exercise checklist (check off as you go)
├── EXAMPLES.md         # Index of hands-on examples with "Try these"
├── examples/           # Hands-on examples
│   ├── README.md       # How to run the examples
│   ├── editor/         # open from terminal, nano/code
│   ├── project_structure/   # src/, tb/, docs/, scripts/, build/
│   ├── find_grep/      # find -name, grep -R
│   ├── tar_archives/   # tar czf, tar xzf
│   ├── zip_archives/   # zip -r, unzip
│   ├── backup/         # timestamped archive, what to exclude
│   ├── diff_patch/     # diff -u, patch
│   ├── clean_build/    # clean script, list-before-delete
│   ├── sed_basics/     # sed -e, substitution, config-like files
│   └── link_relative/  # relative symlinks for portability
```

## Quick Start

1. **Self-check** (from repo root):
   ```bash
   ./scripts/module5.sh --check
   ```

2. **Try the project structure example** (sample layout):
   ```bash
   cd module5/examples/project_structure/sample_project
   ls -la
   find . -type f
   ```

3. **Try find and grep** (search by name and content):
   ```bash
   cd module5/examples/find_grep
   find . -name "*.v"
   grep -R "CLOCK_SIGNAL" .
   ```

4. **Try tar** (create and extract):
   ```bash
   cd module5/examples/tar_archives
   tar czf demo.tar.gz demo_dir/
   tar tzf demo.tar.gz
   ```

5. **Try zip** (create and extract):
   ```bash
   cd module5/examples/zip_archives
   zip -r demo.zip demo_dir/
   unzip -l demo.zip
   ```

6. **More examples**: See [EXAMPLES.md](EXAMPLES.md) for the full index; see `examples/README.md` for editor and backup.

7. **Exercises**: See [CHECKLIST.md](CHECKLIST.md) and [docs/MODULE5.md#exercises](../docs/MODULE5.md#exercises).

## Next Steps

After completing this module, proceed to [Module 6: Git Basics for Course Work](../docs/MODULE6.md).
