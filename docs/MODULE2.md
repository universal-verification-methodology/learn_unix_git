# Module 2: Filesystem, Permissions & Environment

**Goal**: Understand Unix file types, permissions, and environment variables

---

## Navigation

[← Previous: Module 1: Linux & Shell Basics](MODULE1.md) | [Next: Module 3: Processes, Pipes & Redirection →](MODULE3.md)

[↑ Back to README](../README.md)

---

## Running Module 2

From the repo root:

- **Self-check**: `./scripts/module2.sh --check`
- **Demo commands**: `./scripts/module2.sh --demo`
- **Exercise scaffold**: `./scripts/module2.sh --scaffold` (copies `hello.sh` to `~/unix_practice/` for chmod practice)

See [module2/README.md](../module2/README.md) for examples and quick start.

---

## Overview

This module explains how Unix represents files, directories, and permissions, and how the environment (variables like `PATH`) affects the tools students use for digital design. By the end of this module, students should understand why some commands fail with “Permission denied” or “command not found” and how to fix those issues safely.

### What You'll Learn

- **File Types**: Regular files, directories, and symbolic links
- **Permissions**: Read, write, execute bits and how they apply to users and groups
- **Ownership**: User and group ownership and why it matters
- **Environment Variables**: Especially `PATH`, `HOME`, and basic configuration
- **Hidden Files and Config**: Dotfiles and where shell configuration lives

### Prerequisites

Before starting this module, students should:

- [ ] Be comfortable with basic navigation (`cd`, `ls`, `pwd`)
- [ ] Know how to create and remove files and directories
- [ ] Be able to open a text file with `nano` or another editor

---

## Topics Covered

### 1. Understanding File Types

- **Listing with Details**
  - `ls -l` output: permissions, links, owner, group, size, timestamp, name
  - Recognizing directories (`d`), regular files (`-`), symlinks (`l`)
- **Symbolic Links**
  - What symlinks are and when they appear in projects (e.g., toolchains, build outputs)
  - Basic commands: `ln -s target link_name`

### 2. Permissions and Ownership

- **Permission Bits**
  - Structure: `rwxr-xr--` (user, group, others)
  - Read, write, execute meaning for files vs directories
- **Viewing Permissions**
  - `ls -l` and interpreting each column
- **Changing Permissions**
  - `chmod u+x script.sh` (symbolic mode)
  - `chmod 755 script.sh` (numeric mode, high-level only)
  - Making scripts executable vs making everything world-writable (what not to do)
- **Ownership Basics**
  - User and group columns in `ls -l`
  - Concept of `chown` (without requiring students to use it heavily)

### 3. The Unix Environment

- **Key Environment Variables**
  - `HOME`, `USER`, `SHELL`, `PWD`
  - `PATH` and how the shell finds commands
- **Inspecting the Environment**
  - `echo $HOME`, `echo $PATH`
  - `env` and `printenv` (read-only usage)
- **Path Resolution**
  - `which command` to see what will run (e.g., `which iverilog`, `which git`)
  - Common “command not found” scenarios in toolchains

### 4. Modifying the Environment

- **Temporary Variables**
  - `VAR=value command` (one-shot environment change)
  - `export VAR=value` (for current shell session)
- **Persistent Configuration (Concept Only)**
  - Dotfiles: `~/.bashrc`, `~/.profile`, `~/.zshrc`
  - High-level explanation of adding a directory to `PATH`
  - Caution about editing system-wide configuration without understanding

### 5. Hidden Files, Config, and Project Structure

- **Hidden Files and Directories**
  - Using `ls -a` to see dotfiles
  - Common items: `.git/`, `.gitignore`, `.config/`
- **Project Structure for Dev Work**
  - Home directory for personal files
  - Project directories under `~/proj` or similar
  - Keeping tool installs and project data organized

---

## Command Reference (Detailed)

This section describes each command and concept introduced in Module 2: file types and permissions, symbolic links, environment variables, and how the shell finds and runs commands.

---

### Interpreting `ls -l` Output

The long listing from `ls -l` (see Module 1) has a specific column layout. Understanding it is essential for file types and permissions.

**Typical line:**

```
-rwxr-xr--  1 alice devs  2048 Feb  3 10:00 script.sh
```

| Part | Meaning |
|------|--------|
| **First character** | **File type**: `-` = regular file, `d` = directory, `l` = symbolic link. Less common: `b` (block device), `c` (character device), `p` (pipe), `s` (socket). |
| **Next 9 characters** | **Permission bits**: three groups of `rwx` — **user** (owner), **group**, **others**. `r` = read, `w` = write, `x` = execute. `-` means that permission is off. |
| **Number** | **Link count**: For files, number of hard links; for directories, number of entries (including `.` and `..`). |
| **Owner** | User who owns the file (e.g. `alice`). |
| **Group** | Group associated with the file (e.g. `devs`). |
| **Size** | Size in bytes (use `ls -lh` for human-readable units). |
| **Date/time** | Last modification time. |
| **Name** | Filename. For a symlink, `ls -l` shows the link name and target (e.g. `tool -> /opt/tool`). |

**Permissions for files vs directories:**

- **File**: `r` = read contents, `w` = write/modify, `x` = execute (run as a program or script).
- **Directory**: `r` = list names inside, `w` = create/rename/delete entries, `x` = “search” — required to `cd` into it or access any file inside. So a directory often has at least `r-x` or `rwx` for whoever should use it.

---

### Symbolic Links

#### `ln` — Create Links (Symbolic and Hard)

- **What it does**: Creates a **link** to a file or directory. **Symbolic links** (with `-s`) are the usual choice: a small file that points to another path by name. **Hard links** (default, no `-s`) are alternate names for the same inode; they only work for files, not directories.
- **How it works**: A symbolic link stores the target path as text. When you open the link, the kernel follows that path to the real file. If the target is moved or deleted, the link becomes “broken”. Hard links share the same inode; deleting one name does not delete the data until the last link is removed.
- **Syntax**: `ln [-s] target link_name` or `ln [-s] target... directory`
- **Common options**:
  - **`-s`** (symbolic): Create a symbolic link. Use this for directories and for “shortcuts” across filesystems.
- **Examples**:
  ```bash
  ln -s /opt/toolchain/bin/iverilog iverilog   # symlink iverilog -> toolchain
  ln -s ../config/settings.ini config.ini      # relative symlink
  ln -s /path/to/dir mydir                     # symlink to directory
  ```
- **Tip**: Use relative paths in symlinks when possible (e.g. `../src`) so the link still works if the whole project is moved. Use `ls -l` to see the target of a symlink; `readlink link_name` prints the target path.

---

### Permissions and Ownership

#### `chmod` — Change File Mode (Permissions)

- **What it does**: Changes the **read**, **write**, and **execute** bits for the **user** (owner), **group**, and **others** on files or directories. You must own the file (or be root) to change permissions.
- **How it works**: The kernel stores permission bits per inode. `chmod` updates those bits according to the mode you give (symbolic like `u+x` or numeric like `755`).
- **Syntax**: `chmod [options] mode file...` or `chmod [options] mode -R directory...`
- **Symbolic mode** (who op permission):
  - **Who**: `u` = user (owner), `g` = group, `o` = others, `a` = all.
  - **Op**: `+` add, `-` remove, `=` set exactly.
  - **Permission**: `r`, `w`, `x` (or combinations).
- **Numeric mode** (octal): Three digits for user, group, others. Each digit = 4 (r) + 2 (w) + 1 (x). Examples: `755` = rwxr-xr-x, `644` = rw-r--r--, `600` = rw-------.
- **Common options**:
  - **`-R`** (recursive): Change permissions on the directory and everything under it. Use carefully — avoid making everything world-writable.
- **Examples**:
  ```bash
  chmod u+x script.sh           # make script executable for owner
  chmod g+w report.txt          # allow group to write
  chmod o-r secret.txt          # remove read for others
  chmod 755 script.sh            # rwxr-xr-x (common for executables)
  chmod 644 config.txt           # rw-r--r-- (common for config files)
  chmod -R u+rX mydir            # add r (and X for dirs) for owner (capital X = x only on dirs)
  ```
- **Safety**: Prefer `chmod u+x` for your own scripts. Avoid `chmod 777` or `chmod a+rwx` — giving everyone write and execute is a security risk. Use `chmod -R` only when you understand the target tree.

---

#### `chown` — Change Owner (and Optional Group)

- **What it does**: Changes the **owner** and optionally the **group** of a file or directory. Usually only root (or the right capability) can change ownership; normal users can sometimes change the group to one they belong to.
- **How it works**: Updates the user and group IDs stored in the file’s inode. Used when fixing “Permission denied” after copying files as root or when organizing project ownership.
- **Syntax**: `chown [options] owner[:group] file...`
- **Examples**:
  ```bash
  sudo chown alice report.txt    # give file to alice
  sudo chown alice:devs dir/     # owner alice, group devs
  chown :devs file.txt          # change only group to devs
  ```
- **Note**: This module introduces the *concept* of ownership (the columns in `ls -l`). You typically use `chown` when administering systems or when a script must run as a specific user; for your own files, `chmod` is what you use most.

---

### Environment Variables and the Shell

#### `echo` — Print a Line (Including Variable Values)

- **What it does**: Prints its arguments to standard output. Used in scripts and interactively to show the value of **environment variables** (e.g. `echo $HOME`).
- **How it works**: The shell expands `$VAR` (or `${VAR}`) before running `echo`; `echo` just prints the resulting words. So `echo $PATH` prints the current `PATH` value.
- **Syntax**: `echo [options] [string...]`
- **Examples**:
  ```bash
  echo hello
  echo $HOME
  echo $PATH
  echo "PATH is $PATH"
  ```
- **Tip**: Use quotes when the value might contain spaces: `echo "HOME=$HOME"`. Avoid `echo` for arbitrary data (use `printf` in scripts for portability), but for inspecting variables it’s fine.

---

#### `env` — Run a Command in a Modified Environment, or List Environment

- **What it does**: (1) With no program name: **lists** all environment variables (name=value, one per line). (2) With `VAR=value` pairs and a command: runs that command with the given variables set (and optionally clears the rest with `-i`).
- **How it works**: When listing, it iterates over the process environment and prints it. When running a command, it builds a new environment from the assignments and (unless `-i`) the current environment, then executes the command.
- **Syntax**: `env [options] [VAR=value...] [command [args...]]`
- **Common options**:
  - **`-i`** or **`--ignore-environment`**: Start with an empty environment (only the given `VAR=value` pairs apply). Useful for minimal, reproducible runs.
- **Examples**:
  ```bash
  env                           # list all environment variables
  env | grep PATH               # find PATH in the list
  env MYVAR=hello ./my_script   # run script with MYVAR set
  env -i PATH=/usr/bin ./minimal_script   # run with almost no environment
  ```
- **Tip**: Use `env` to run a program with a one-off variable (e.g. `env DEBUG=1 ./tool`) without changing your current shell.

---

#### `printenv` — Print Environment or One Variable

- **What it does**: Prints environment variables. With no argument, prints all (like `env`). With a variable name, prints only that variable’s value (or nothing if unset).
- **How it works**: Looks up the variable(s) in the process environment and prints to stdout.
- **Syntax**: `printenv [variable_name]`
- **Examples**:
  ```bash
  printenv              # same as env (list all)
  printenv HOME         # print value of HOME
  printenv PATH USER    # print PATH and USER (GNU version)
  ```
- **Tip**: Handy in scripts to check a single variable: `if [ -n "$(printenv CONFIG_PATH)" ]; then ...`

---

#### `which` — Locate a Command’s Executable File

- **What it does**: Prints the **full path** of the executable that would run when you type a given command name. Uses your current `PATH`; does not run the command.
- **How it works**: Walks the directories in `PATH` in order and looks for an executable file with that name; prints the first match. Explains “command not found” when the program is not in any `PATH` directory.
- **Syntax**: `which [options] command_name...`
- **Examples**:
  ```bash
  which ls              # e.g. /usr/bin/ls
  which python python3  # which Python is used
  which iverilog git    # common in design/verification
  ```
- **Tip**: If `which my_tool` prints nothing, the tool is not in `PATH`. Add its directory to `PATH` or call it by full path (e.g. `/opt/tools/bin/my_tool`).

---

#### `export` — Export Variables to Child Processes

- **What it does**: Marks shell variables as **exported** so that **child processes** (programs you run from the shell) see them. Without `export`, a variable is only visible in the current shell, not in commands you run.
- **How it works**: The shell adds the variable to the “environment” block that is passed to every child process. Existing variables can be exported with `export VAR`; new ones with `export VAR=value`.
- **Syntax**: `export name[=value]...` (bash and similar).
- **Examples**:
  ```bash
  export MYTOOL=/opt/my_tool
  export PATH=$PATH:/opt/my_tool/bin
  export VAR=value
  ```
- **Tip**: Changes last only for the current shell session unless you put them in `~/.bashrc` or `~/.profile`. Use `VAR=value command` when you need a variable only for one command.

---

#### Inline environment: `VAR=value command`

- **What it does**: Sets one (or more) environment variables **only for the duration of that single command**. The variable is not set in your current shell after the command finishes.
- **How it works**: The shell assigns the variables and then runs the command; the command’s process receives those variables in its environment. No `export` needed for that command.
- **Syntax**: `VAR=value [VAR2=value2 ...] command [args...]`
- **Examples**:
  ```bash
  DEBUG=1 ./my_script
  HOME=/tmp LANG=C some_tool
  PATH=/opt/special/bin:$PATH iverilog -v
  ```
- **Tip**: Use this for one-off overrides (debug flags, alternate configs, or a custom `PATH` for one run) without polluting your shell.

---

### Key Environment Variables (Concepts)

These are not commands but variables the shell and programs use:

| Variable | Meaning |
|----------|--------|
| **`HOME`** | Your home directory (e.g. `/home/student`). `cd` with no arguments goes here; `~` expands to this. |
| **`USER`** / **`LOGNAME`** | Your username. |
| **`SHELL`** | Path to your login shell (e.g. `/bin/bash`). |
| **`PWD`** | Current working directory (set by the shell when you `cd`). |
| **`PATH`** | Colon-separated list of directories searched for executable names. When you type `ls`, the shell looks for `ls` in each directory in order. If a tool is “not found”, its directory is usually missing from `PATH`. |

To inspect: `echo $HOME`, `echo $PATH`, `printenv PATH`.

---

### Persistent Configuration (Dotfiles)

- **What they are**: “Dotfiles” are files or directories whose names start with `.`. They are hidden from plain `ls`; use `ls -a` to see them. Many hold **configuration** for the shell and other tools.
- **Common locations** (in your home directory):
  - **`~/.bashrc`** (bash): Sourced by interactive bash shells; put aliases, `export PATH=...`, and other interactive settings here.
  - **`~/.profile`** or **`~/.bash_profile`**: Sourced at login; often used for login-time setup (and then sourcing `.bashrc`).
  - **`~/.zshrc`** (zsh): Analogous to `.bashrc` for zsh.
  - **`~/.gitconfig`**: Git configuration.
  - **`~/.config/`**: Directory used by many modern tools for config files.
- **Adding a directory to `PATH`**: In `~/.bashrc` (or equivalent), add a line like `export PATH="$PATH:/opt/my_tools/bin"`. Then run `source ~/.bashrc` or open a new terminal so the change takes effect.
- **Caution**: Edit only your own dotfiles. Changing system-wide files (e.g. `/etc/environment`) can affect all users and break login if done incorrectly.

---

### Hidden Files and Project Structure (Recap)

- **Seeing hidden files**: `ls -a` or `ls -la` (see Module 1). In project directories you’ll see `.git/`, `.gitignore`, sometimes `.env` or `.config/`.
- **Project layout**: Keep projects under a dedicated directory (e.g. `~/proj/` or `~/projects/`). Use dotfiles in your home for shell and tool config; use repo-local files (e.g. `.gitignore`, scripts in the repo) for project-specific setup. This keeps tool installs and project data organized and makes PATH and permissions easier to reason about.

---

## Learning Outcomes

By the end of this module, students should be able to:

- Use `ls -l` to inspect file types, ownership, and permissions
- Explain what `r`, `w`, and `x` mean for files and directories
- Safely change permissions for scripts they own using `chmod`
- Inspect and reason about `PATH` and why some commands are not found
- Temporarily set environment variables for a single command or session
- Identify hidden files and basic config locations relevant to their shell and projects

---

## Exercises

1. **Inspecting File Types**
   - In your home directory, run `ls -l` and identify:
     - At least one regular file
     - At least one directory
     - Any symbolic links (if present)

2. **Permission Practice**
   - Create a script `hello.sh` that prints a message.
   - Use `ls -l hello.sh` to confirm it is not executable.
   - Run `chmod u+x hello.sh` and confirm the `x` bit appears for the user.
   - Execute `./hello.sh` and verify it runs.

3. **Exploring Ownership**
   - Run `ls -l` in a project directory and note the owner and group.
   - Identify which files you own and which might belong to another user (if any).

4. **PATH and Command Resolution**
   - Run `echo $PATH` and identify at least three directories.
   - Use `which bash`, `which python`, and `which git` to see where they live.
   - If a tool you expect is missing, run `which <tool>` and record the result.

5. **Environment Variables and Dotfiles**
   - Use `env | head` to see a sample of environment variables.
   - Use `ls -a ~` and locate at least three dotfiles or dot-directories (e.g., `.bashrc`, `.gitconfig`).
   - Open `~/.bashrc` (or equivalent) in `less` or `nano` and find a line that modifies `PATH` (do not change it yet).

---

## Assessment

- [ ] Can interpret `ls -l` output, including file type and permission bits
- [ ] Can safely change file permissions for their own scripts
- [ ] Can explain why a script in the current directory requires `./script.sh` to run
- [ ] Can describe what `PATH` is and how it affects command resolution
- [ ] Can find basic shell configuration files in their home directory
- [ ] Can recognize and explain the purpose of hidden project directories like `.git/`

---

## Next Steps

After completing this module, proceed to **Module 3: Processes, Pipes & Redirection** to learn how to run, manage, and connect commands—skills that are essential for working with simulators, build systems, and logs.

