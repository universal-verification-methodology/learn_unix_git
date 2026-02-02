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

## Command Reference (Detailed)

This section describes the commands and concepts introduced in Module 4: command history and editing, aliases, shell script structure, variables and arguments, control flow, and safe scripting practices.

---

### Command History and Editing

#### `history` — Display or Use Command History

- **What it does**: Lists the **command history** for the current shell (or a range of line numbers). The shell stores previously entered commands; you can recall, edit, and re-run them. History is session-based unless configured to persist (e.g. in bash via `HISTFILE` and `HISTSIZE`).
- **How it works**: The shell maintains an in-memory list of commands; `history` prints them with line numbers. Other features (e.g. `!n`, `!!`, `Ctrl+R`) use the same history.
- **Syntax**: `history [options] [n]` — with no arguments, list all (or many) entries; with a number `n`, list the last `n` entries.
- **Common options**:
  - **`-c`**: Clear the history list in the current session (bash).
  - **`-d offset`**: Delete the entry at that history position (bash).
- **Examples**:
  ```bash
  history           # list recent commands with numbers
  history 20        # last 20 commands
  history -c        # clear current session history (bash)
  ```
- **Tip**: Use the line numbers with **`!n`** to re-run command number `n` (e.g. `!42`). **`!!`** re-runs the previous command; **`!$`** expands to the last argument of the previous command.

---

#### History Expansion and Recall (Shell Features)

- **`!n`**: Re-run the command with history line number `n` (e.g. `!100`). Use `history` to see numbers.
- **`!!`**: Re-run the **last** command. Handy after you forget `sudo`: `sudo !!`.
- **`!$`**: Expands to the **last argument** of the previous command (e.g. after `ls long_filename.txt`, type `cat !$` to get `cat long_filename.txt`).
- **`!prefix`**: Re-run the most recent command that started with `prefix` (e.g. `!make`).
- **Tip**: History expansion can be destructive if the wrong command is recalled; glance at what `!!` or `!n` expands to before pressing Enter if your shell shows it.

---

#### Keyboard Shortcuts for Editing the Line

These are handled by the shell (or Readline, in bash); they are not separate commands.

| Shortcut   | Action |
|------------|--------|
| **↑** / **↓** | Move backward/forward through history (one command per keypress). |
| **Ctrl+A** | Move cursor to **beginning** of line. |
| **Ctrl+E** | Move cursor to **end** of line. |
| **Ctrl+U** | Kill from cursor **back to start** of line (clear left part). |
| **Ctrl+K** | Kill from cursor **to end** of line (clear right part). |
| **Ctrl+W** | Kill the word **before** the cursor. |
| **Ctrl+R** | **Reverse search** history: type a substring and the shell shows the most recent command containing it; press Enter to run, or Ctrl+R again to go further back. |
| **Ctrl+C** | Cancel the current line (do not run it). |

- **Tip**: Use Ctrl+A and Ctrl+E to jump to start/end when fixing a recalled command; use Ctrl+U/Ctrl+K to clear half the line before retyping.

---

### Aliases

#### `alias` — Define or List Aliases

- **What it does**: **Defines** a short name (alias) that the shell expands to a longer command string before execution, or **lists** all current aliases when given no arguments. Aliases are useful for frequently used options or multi-step commands.
- **How it works**: The shell stores alias definitions in memory. When you type a command word, the shell checks if it is an alias and, if so, replaces it with the definition (then parses the result again; aliases can contain arguments).
- **Syntax**: `alias [name[=value] ...]` — with no arguments, list all aliases; with `name=value`, define an alias.
- **Examples**:
  ```bash
  alias ll='ls -alF'                    # long listing, all files, type suffixes
  alias cproj='cd ~/projects/course'    # quick cd to project
  alias gs='git status'                 # short git status
  alias                              # list all current aliases
  ```
- **Persistence**: Alias definitions are **per-session** unless you put them in a startup file. Add lines like `alias ll='ls -alF'` to **`~/.bashrc`** (bash) or **`~/.zshrc`** (zsh), then run `source ~/.bashrc` or open a new terminal.
- **Tip**: Use single quotes around the value so the shell does not expand variables or history at definition time; use double quotes only if you want expansion when the alias is defined.

---

#### `unalias` — Remove an Alias

- **What it does**: Removes one or more **alias** definitions from the current shell. The name reverts to the normal command (or nothing) after that.
- **How it works**: The shell deletes the alias from its internal table; it does not affect startup files.
- **Syntax**: `unalias name...` or `unalias -a` (remove all aliases, bash).
- **Examples**:
  ```bash
  unalias ll       # remove ll alias
  unalias -a       # remove all aliases (bash)
  ```
- **Tip**: Use `unalias ll` if you redefined `ll` by mistake or want to test the real `ls` again.

---

### Shell Script Basics

#### Shebang and Executable Scripts

- **Shebang**: The first line of a script can be **`#!/usr/bin/env bash`** (or `#!/bin/bash`). The kernel uses this to run the script with the right interpreter. **`#!/usr/bin/env bash`** is preferred so the script uses whatever `bash` is first in `PATH` (useful on systems where bash is not in `/bin`).
- **Making a script executable**: Run **`chmod +x script.sh`** (or `chmod u+x script.sh`) so you can run it as **`./script.sh`**. Without the execute bit, you must run **`bash script.sh`** (or `sh script.sh`); the shebang is then ignored and the interpreter is the one you specify.
- **`./script.sh` vs `bash script.sh`**:
  - **`./script.sh`**: The kernel runs the file; it uses the shebang to choose the interpreter. Requires execute permission and that the script is in the current directory (or you use a path). The script runs in a **subshell**.
  - **`bash script.sh`**: You run `bash` and pass the script as an argument. No execute bit needed; the shebang is not used. Good for one-off or debugging runs.
- **Tip**: Use `#!/usr/bin/env bash` and `chmod +x script.sh` for scripts you intend to run as `./script.sh`; use relative or absolute paths for `./script.sh` (e.g. `./scripts/run.sh`) so the shell knows where to find it.

---

### Variables and Arguments in Scripts

#### Variables: Assignment and Expansion

- **What they are**: **Variables** hold strings (or numbers as strings). You assign with **`NAME=value`** (no spaces around `=`) and use **`$NAME`** or **`${NAME}`** to expand. Variables are **untyped** and **global** to the script (or shell) unless made local (e.g. `local` in a function, bash).
- **How it works**: The shell expands `$VAR` (or `${VAR}`) before running the command; the command sees the expanded value. Quoting matters: **`"$VAR"`** keeps the value as one word; unquoted **`$VAR`** is subject to word splitting and globbing.
- **Syntax**: `VAR=value` (assignment; no spaces), `$VAR` or `"$VAR"` (expansion).
- **Examples**:
  ```bash
  NAME="world"
  echo "Hello, $NAME"           # Hello, world
  COUNT=42
  echo Count is $COUNT
  FILE="$1"                    # first argument (see below)
  ```
- **Tip**: **Always quote variables in scripts**: use **`"$VAR"`** so filenames or values with spaces do not get split into multiple words. Use **`${VAR:-default}`** to supply a default if `VAR` is unset or empty.

---

#### Positional Parameters

- **What they are**: **Positional parameters** are the arguments passed to the script (or function): **`$1`**, **`$2`**, **`$3`**, ... The script name itself is **`$0`**. You use them to make scripts accept input (e.g. filenames, flags).
- **How it works**: The shell sets `$1` to the first argument, `$2` to the second, and so on, after the script name. They are read-only during the script run.
- **Common variables**:
  - **`$0`**: Name used to invoke the script (path as typed, or as set by the caller).
  - **`$1`, `$2`, ...**: First, second, ... argument.
  - **`$#`**: Number of positional parameters (argument count).
  - **`"$@"`**: All arguments as separate words; use in loops or when passing arguments through: `"$@"` preserves each argument as one word even if it contains spaces.
  - **`"$*"`**: All arguments as a single string (joined with the first character of `IFS`); rarely what you want; prefer **`"$@"`**.
- **Examples**:
  ```bash
  # In script: ./greet.sh Alice
  echo "Hello, $1"              # Hello, Alice
  echo "Script: $0"             # ./greet.sh (or full path)
  echo "Number of args: $#"     # 1
  for arg in "$@"; do echo "$arg"; done   # loop over each argument
  ```
- **Tip**: Use **`"$1"`** (quoted) when treating the first argument as a filename or string; use **`"$@"`** when forwarding or iterating over all arguments. Check **`$#`** before using `$1` if the script requires at least one argument.

---

### Control Flow: Conditionals and Loops

#### `test` / `[` — Evaluate Conditions

- **What it does**: **`test`** (or **`[`** ... **`]`**) evaluates conditions and exits with 0 (true) or non-zero (false). Used in `if` and `while` to decide branches or loops. **`[`** is the same as `test` but requires a closing **`]`** as the last argument.
- **How it works**: The command runs the requested check (file type, string comparison, etc.) and sets its exit status. The shell uses that in `if [ ... ]; then ... fi`.
- **Syntax**: `test condition` or `[ condition ]` — note spaces around `[` and `]` and around operators.
- **Common file tests**:
  - **`-f file`**: True if `file` exists and is a **regular file**.
  - **`-d file`**: True if `file` exists and is a **directory**.
  - **`-e file`**: True if `file` **exists** (any type).
  - **`-r file`**: True if **readable**.
  - **`-w file`**: True if **writable**.
  - **`-x file`**: True if **executable** (or directory is searchable).
- **Common string tests**:
  - **`-z "$s"`**: True if string **`$s`** is **empty**.
  - **`-n "$s"`**: True if string **`$s`** is **non-empty**.
  - **`"$a" = "$b"`**: True if strings are equal.
  - **`"$a" != "$b"`**: True if strings differ.
- **Examples**:
  ```bash
  if [ -f "$1" ]; then echo "File exists"; fi
  if [ -d build ]; then cd build; fi
  if [ -z "$NAME" ]; then NAME="default"; fi
  if [ "$1" = "install" ]; then run_install; fi
  ```
- **Tip**: Always quote variables in tests: **`[ -f "$1" ]`**, **`[ -z "$VAR" ]`**. Omitted quotes can cause syntax errors or wrong behavior when values contain spaces or are empty.

---

#### `if` / `then` / `else` / `fi`

- **What it does**: Runs a block of commands **only if** a condition (usually a `test` or `[ ... ]`) is true; optionally runs an **`else`** block when false. Supports **`elif`** for multiple branches.
- **How it works**: The shell runs the condition command; if its exit status is 0, it runs the **`then`** branch; otherwise it runs **`else`** (if present) or **`elif`** chains.
- **Syntax**:
  ```bash
  if condition_command; then
    commands
  elif condition_command; then
    commands
  else
    commands
  fi
  ```
- **Examples**:
  ```bash
  if [ -f "$1" ]; then
    echo "Processing $1"
  else
    echo "Usage: $0 <file>"
    exit 1
  fi

  if [ "$1" = "--help" ]; then
    show_help
  elif [ "$1" = "--version" ]; then
    echo "1.0"
  else
    do_work "$@"
  fi
  ```
- **Tip**: Use **`exit 1`** (or another non-zero code) in the `else` branch when the script is misused (e.g. missing required argument), so callers can detect failure.

---

#### `for` / `do` / `done`

- **What it does**: Repeats a block of commands **once for each word** in a list. The list can be a literal set of words, a variable expansion, or the result of globbing (e.g. `*.log`). Very common for batch operations on files.
- **How it works**: The shell sets the loop variable to each word in turn and runs the loop body; when the list is exhausted, the loop ends.
- **Syntax**:
  ```bash
  for variable in list; do
    commands
  done
  ```
- **Examples**:
  ```bash
  for file in *.log; do
    echo "$file has $(wc -l < "$file") lines"
  done

  for arg in "$@"; do
    process "$arg"
  done

  for i in 1 2 3; do
    echo "Step $i"
  done
  ```
- **Tip**: Quote the loop variable when it holds filenames: **`"$file"`**. Use **`*.log`** or **`$@`** to drive the loop; avoid parsing `ls` output for filenames (use globs or `find` for robustness).

---

#### `while` / `do` / `done` (Brief)

- **What it does**: Repeats a block **while** a condition command succeeds (exit status 0). Stops when the condition fails.
- **Syntax**: `while condition_command; do commands; done`
- **Example**:
  ```bash
  while read -r line; do
    echo "Line: $line"
  done < file.txt
  ```
- **Tip**: Use `while read -r line` for line-by-line input; use **`set -e`** with care so a failing command in the loop does not exit the script if that is not what you want.

---

### Safe Scripting Practices

#### `set -e` — Exit on Error

- **What it does**: **`set -e`** tells the shell to **exit immediately** if any command in the script fails (returns a non-zero exit status). Helps avoid continuing after an error (e.g. a failed `cd` or `make`).
- **How it works**: After each command, the shell checks the exit status; if it is non-zero and `set -e` is on, the shell exits with that status. Commands in condition contexts (e.g. `if`, `while`, or `cmd || true`) do not trigger exit.
- **Syntax**: Put **`set -e`** near the top of the script (after the shebang and optional comments).
- **Examples**:
  ```bash
  #!/usr/bin/env bash
  set -e
  cd build
  make              # if make fails, script exits here
  ./run_tests
  ```
- **Tip**: Use **`command || true`** when you intentionally want to ignore a command’s failure. Combine with **`set -u`** (exit on use of unset variable) for stricter scripts; use **`set -o pipefail`** (bash) so a failure in a pipeline fails the script.

---

#### Quoting Variables

- **Why**: Unquoted **`$VAR`** is split into words by spaces and newlines, and glob characters (`*`, `?`, `[ ]`) are expanded. That can break when filenames or arguments contain spaces or special characters.
- **Rule of thumb**: In scripts, **use double quotes around variables**: **`"$VAR"`**, **`"$1"`**, **`"$@"`**. Use **`"$@"`** (not `"$*"`) when passing arguments through or looping.
- **Examples**:
  ```bash
  file="$1"           # safe: one word even if $1 has spaces
  cp "$file" backup/  # safe
  for f in "$@"; do   # safe: each argument one word
    process "$f"
  done
  ```
- **Tip**: Omitted quotes are a common source of bugs (e.g. `rm $file` when `file` is "a b" deletes `a` and `b`). Quote by default; remove quotes only when you explicitly want word splitting or globbing.

---

#### Dry Runs and Debugging

- **Dry run**: For destructive or important operations, **echo** the command (or list of files) first and only run the real command when the user confirms (e.g. with a `--confirm` flag). Reduces risk of deleting or overwriting the wrong things.
- **Pattern**: Check for a flag like `--confirm`; if not set, print what *would* be done and exit; if set, perform the action.
- **Examples**:
  ```bash
  if [ "$1" != "--confirm" ]; then
    echo "Would delete:"
    printf '  %s\n' tmp/*
    echo "Run with --confirm to actually delete."
    exit 0
  fi
  rm -rf tmp/*
  ```
- **Debugging**: Use **`echo "debug: VAR=$VAR"`** (or **`set -x`** to trace commands) to see what the script is doing. Remove or comment out debug output before sharing or committing.
- **Tip**: For scripts that delete or move files, a dry run by default is a good habit; require an explicit flag or confirmation before doing the real operation.

---

### Summary: Script Skeleton

A minimal, safe script template:

```bash
#!/usr/bin/env bash
set -e

# Optional: require arguments
if [ $# -eq 0 ]; then
  echo "Usage: $0 <file>"
  exit 1
fi

FILE="$1"
if [ ! -f "$FILE" ]; then
  echo "Not a file: $FILE"
  exit 1
fi

# Your logic here
echo "Processing $FILE"
```

- Use **`#!/usr/bin/env bash`**, **`set -e`**, and **quoted variables**; check **`$#`** and **`-f "$1"`** when the script needs a file argument; **`exit 1`** on usage errors.

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

