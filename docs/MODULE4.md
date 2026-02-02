# Module 4: Shell Productivity & Basic Scripting

**Goal**: Automate repetitive commands and work efficiently in the shell

---

## Navigation

[← Previous: Module 3: Processes, Pipes & Redirection](MODULE3.md) | [Next: Module 5: Editors, Projects & Archives →](MODULE5.md)

[↑ Back to README](../README.md)

---

## Running Module 4

From the repo root:

- **Self-check**: `./scripts/module4.sh --check`
- **Demo commands**: `./scripts/module4.sh --demo`
- **Exercise scaffold**: `./scripts/module4.sh --scaffold` (copies `say_hello.sh` and `greet.sh` to `~/unix_practice/`)

See [module4/README.md](../module4/README.md) for examples and quick start.

---

## Overview

This module focuses on getting students comfortable and efficient in the shell, and on writing small, safe scripts to automate common tasks. The emphasis is on practical workflows that will later wrap digital design flows (e.g., compile → simulate → view results), but the scripts here remain tool-agnostic.

### What You'll Learn

- **History & Shortcuts**: Quickly re-running and editing previous commands
- **Aliases**: Short names for long, frequently used commands
- **Basic Shell Scripts**: Creating, editing, and executing simple `bash` scripts
- **Arguments & Variables**: Passing parameters to scripts
- **Safe Scripting Practices**: Avoiding common pitfalls and making scripts predictable

### Prerequisites

Before starting this module, students should:

- [ ] Be comfortable with navigation, file operations, and processes
- [ ] Understand redirection and pipes at a basic level
- [ ] Know how to make a file executable using `chmod`

---

## Topics Covered

### 1. Command History and Editing

- **History Basics**
  - `history` command to list recent commands
  - `!n` (optional) and simple recall of previous commands
- **Keyboard Shortcuts**
  - Arrow keys (`↑`, `↓`) to navigate history
  - `Ctrl+A`, `Ctrl+E` for start/end of line
  - `Ctrl+U`, `Ctrl+K` to clear parts of a line
- **Reverse Search**
  - `Ctrl+R` to search command history by typing part of a previous command

### 2. Aliases for Common Workflows

- **Creating Aliases**
  - Temporary alias in current shell: `alias ll='ls -alF'`
  - Common examples for listing, navigation, or project-specific commands
- **Persisting Aliases (High-Level)**
  - Adding aliases to `~/.bashrc` or `~/.zshrc` (concept)
  - Caution: Keep course instructions simple and documented

### 3. Shell Script Basics

- **Script Structure**
  - Shebang: `#!/usr/bin/env bash`
  - Comments and readability
  - Executable bit (`chmod +x script.sh`)
- **Running Scripts**
  - `./script.sh` vs `bash script.sh`
  - Using relative vs absolute paths

### 4. Variables, Arguments, and Control Flow

- **Variables**
  - Assigning: `NAME="world"`
  - Using: `echo "Hello, $NAME"`
- **Positional Parameters**
  - `$0`, `$1`, `$2`, `"$@"`
  - Example: `run_task.sh input_file.log`
- **Simple Conditionals and Loops**
  - `if [ -f "$1" ]; then ... fi` (file checks)
  - `for file in *.log; do ... done` (batch operations)
  - Emphasis on simple, robust patterns over cleverness

### 5. Safe Scripting Practices

- **Defensive Defaults**
  - `set -e` to stop on errors (with explanation)
  - Quoting variables: `"$VAR"` to avoid word splitting
- **Dry Runs and Echo**
  - Printing commands before running destructive operations
  - Using `echo` for debugging script behavior
- **Course Context**
  - Preparing to wrap digital design tasks like:
    - Running tests
    - Collecting logs
    - Cleaning build directories

---

## Learning Outcomes

By the end of this module, students should be able to:

- Use history and keyboard shortcuts to re-run and edit commands quickly
- Define simple aliases to streamline frequent tasks
- Write and execute small `bash` scripts with a proper shebang
- Use positional parameters to make scripts reusable
- Add basic logic (conditionals, loops) to automate repetitive operations
- Apply basic safety practices when writing scripts that modify files

---

## Exercises

1. **History and Shortcuts**
   - Run at least 5 different commands.
   - Use `history` to view them.
   - Use `Ctrl+R` to search for one of the commands and re-run it.
   - Practice editing a recalled command using `Ctrl+A` and `Ctrl+E`.

2. **Creating Aliases**
   - Create a temporary alias `ll` for `ls -alF`.
   - Create an alias `cproj` that `cd`s into your main course project directory.
   - Use `alias` (with no arguments) to list all active aliases.

3. **First Script**
   - Create a script `say_hello.sh` with:
     - A shebang line.
     - A message that prints “Hello from the script!”.
   - Make it executable and run it with `./say_hello.sh`.

4. **Script with Arguments**
   - Create `greet.sh` that:
     - Accepts a name as `$1`.
     - Prints `Hello, <name>!` (or a default if no name is given).
   - Test it with and without providing a name.

5. **Batch Operation Script**
   - In a directory with several `.log` files, create a script `count_lines.sh` that:
     - Loops over `*.log`.
     - Prints the file name and line count (using `wc -l`).
   - Run it and verify the counts match manual checks on a couple of files.

6. **Safety Check**
   - Write a script `clean_tmp.sh` that:
     - Echoes which files it would delete in a `tmp/` directory.
     - Only deletes them if a `--confirm` flag is passed.
   - Test it without `--confirm` to see the dry run, then with `--confirm` in a safe test directory.

---

## Assessment

- [ ] Can effectively use command history and shortcuts
- [ ] Can create and use aliases in the current shell
- [ ] Can write and run basic `bash` scripts with a shebang
- [ ] Can pass and use arguments in scripts
- [ ] Can implement basic loops and conditionals in scripts
- [ ] Can demonstrate at least one script that automates a small multi-step task

---

## Next Steps

After completing this module, proceed to **Module 5: Editors, Projects & Archives** to learn how to work with editors, manage multi-file projects, and move or back up your work using archives.

