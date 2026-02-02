# Module 1: Linux & Shell Basics

**Goal**: Get comfortable with the Unix terminal and basic file operations

---

## Navigation

[← Previous: N/A (First Module)] | [Next: Module 2: Filesystem, Permissions & Environment →](MODULE2.md)

[↑ Back to README](../README.md)

---

## Running Module 1

From the repo root:

- **Self-check**: `./scripts/module1.sh --check`
- **Demo commands**: `./scripts/module1.sh --demo`
- **Exercise scaffold**: `./scripts/module1.sh --scaffold` (creates `~/unix_practice/`)

See [module1/README.md](../module1/README.md) for examples and quick start. Examples include: **navigation**, **paths** (absolute vs relative), **file_operations** (cp, mv, mkdir, rm), **viewing** (cat, head, tail, less), **design_files** (RTL-style .v/.sv/.md/.cpp), and **help** (man, --help).

---

## Overview

This module introduces the Unix shell and the essential commands students need before doing any digital design or verification work. By the end of this module, students should be able to open a terminal, navigate the filesystem, inspect files, and run simple commands with confidence.

### What You'll Learn

- **Terminal Basics**: What a shell is, how to open it, and how to run commands
- **Navigation**: Moving between directories, understanding absolute vs relative paths
- **File Operations**: Creating, copying, moving, and deleting files and directories
- **Viewing Files**: Using `cat`, `less`, `head`, and `tail` to inspect text files
- **Getting Help**: Using `man` pages and `--help` flags effectively

### Prerequisites

Before starting this module, students should:

- [ ] Have access to a Unix-like environment (Linux, macOS, or WSL2 on Windows)
- [ ] Know how to open a terminal on their system
- [ ] Be able to type and execute simple commands

---

## Topics Covered

### 1. What Is Unix and the Shell?

- **Operating System Overview**
  - What "Unix-like" means (Linux, macOS, WSL2)
  - Why command-line skills matter for digital design and verification
- **The Shell**
  - Shell vs terminal emulator
  - Common shells: `bash`, `zsh`, others (high-level only)
  - Prompt structure (username, host, current directory)

### 2. Paths and Navigation

- **Current Directory**
  - `pwd` (print working directory)
  - Understanding the home directory (`~`)
- **Listing Files**
  - `ls`, `ls -l`, `ls -a` (basic flags only)
- **Changing Directories**
  - `cd` with relative and absolute paths
  - Special directories: `.`, `..`, `~`
- **Practical Focus for RTL/Verification**
  - Navigating into course repositories
  - Moving between `src/`, `tb/`, and `build/`-style directories

### 3. Files and Directories

- **Creating and Removing**
  - `mkdir`, `mkdir -p`
  - `rmdir` vs `rm -r`
- **Copying and Moving**
  - `cp file1 file2`, `cp -r dir1 dir2`
  - `mv` for renaming and moving
- **Deleting Safely**
  - `rm file`, `rm -r directory`
  - Why `rm -rf` is dangerous and how to avoid accidents

### 4. Viewing and Editing Text Files

- **Viewing Text**
  - `cat` for small files
  - `less` for long files (navigation keys, `/` search, `q` to quit)
  - `head` and `tail` for quick inspection
- **Intro to Text Editors**
  - `nano` as a beginner-friendly default (open, edit, save, exit)
  - Mention of other editors (VS Code, Vim, etc.) but no deep dive yet
- **Digital Design Context**
  - Opening `.v`, `.sv`, `.cpp`, and `.md` files from the terminal

### 5. Getting Help and Exploring Commands

- **Manual Pages**
  - `man <command>` and basic navigation (`Space`, `b`, `/`, `q`)
- **Inline Help**
  - `command --help` and `command -h` patterns
  - Using `whatis` and `apropos` where available
- **Discoverability**
  - Using tab completion for commands and paths
  - Command history basics (`↑`, `↓`)

---

## Command Reference (Detailed)

This section describes each command introduced in Module 1: what it does, how it works, common options, and typical usage.

---

### Navigation and Paths

#### `pwd` — Print Working Directory

- **What it does**: Prints the **absolute path** of the directory you are currently in. The shell always has a "current working directory"; every relative path is interpreted relative to this directory.
- **How it works**: The shell (or the `pwd` program) reads the process’s current working directory from the kernel and prints it to standard output.
- **Syntax**: `pwd` (no arguments; a few systems support `-L` / `-P` for logical vs physical path).
- **Example**:
  ```bash
  $ pwd
  /home/student/projects/learn_unix_git
  ```
- **Tip**: Run `pwd` whenever you are unsure where you are before running destructive commands like `rm` or `mv`.

---

#### `ls` — List Directory Contents

- **What it does**: Lists files and subdirectories in the given directory (or the current directory if none is given). By default, names are shown in columns; hidden files (names starting with `.`) are omitted unless you use `-a`.
- **How it works**: `ls` reads the directory’s inode entries and displays filenames and, with the right options, metadata (permissions, size, time, etc.).
- **Syntax**: `ls [options] [path...]`
- **Common options**:
  - **`-l`** (long format): One line per file; shows permissions, link count, owner, group, size, modification time, and name. Essential for checking permissions and sizes.
  - **`-a`** or **`--all`**: Include entries whose names start with `.` (hidden files and directories, e.g. `.git`, `.bashrc`).
  - **`-h`** (with `-l`): Show file sizes in human-readable units (e.g. `1.2K`, `340M`).
  - **`-t`**: Sort by modification time (newest first).
  - **`-r`**: Reverse the sort order.
- **Examples**:
  ```bash
  ls                  # current directory, short form
  ls -l               # long listing
  ls -la              # long listing including hidden
  ls -lh src/         # human-readable sizes in src/
  ls -lt              # newest files first
  ```
- **Tip**: Use `ls -la` in a new project directory to see config files (e.g. `.gitignore`, `.env`) and hidden folders like `.git`.

---

#### `cd` — Change Directory

- **What it does**: Changes the shell’s **current working directory** to the given path. All subsequent relative paths and commands run in this new directory until you `cd` again.
- **How it works**: The shell calls the system call that changes the process’s current working directory. Only directories can be the target; the path must exist.
- **Syntax**: `cd [directory]`
- **Special path names**:
  - **`.`** — Current directory (useful in scripts; rarely needed interactively).
  - **`..`** — Parent directory (one level up).
  - **`~`** — Your home directory (e.g. `/home/student` or `/Users/student`).
  - **`-`** — The previous working directory (toggle back after a `cd`).
- **Examples**:
  ```bash
  cd ~                # go to home
  cd ~/projects       # go to projects inside home
  cd ..               # go up one level
  cd ../tb            # go to sibling tb/
  cd -                # return to previous directory
  cd                 # no args: same as cd ~
  ```
- **Tip**: If `cd` fails, the path may not exist or may not be a directory; use `ls` and `pwd` to verify.

---

### Creating and Removing Directories

#### `mkdir` — Make Directory

- **What it does**: Creates one or more directories. By default, parent directories must already exist.
- **How it works**: Creates new directory inodes; the path is interpreted relative to the current directory (or as absolute if the path starts with `/` or `~`).
- **Syntax**: `mkdir [options] directory...`
- **Common options**:
  - **`-p`**: Create any missing parent directories; do not report an error if the directory already exists. Very useful for creating deep trees in one command.
- **Examples**:
  ```bash
  mkdir notes                    # create notes/ in current dir
  mkdir notes projects           # create both
  mkdir -p build/sim/logs        # create build, build/sim, build/sim/logs
  ```
- **Tip**: Use `mkdir -p` in scripts so the same command works whether the directory exists or not.

---

#### `rmdir` — Remove Empty Directory

- **What it does**: Removes **empty** directories. Fails if the directory contains any files or subdirectories.
- **How it works**: Removes the directory inode; the filesystem only allows this when the directory’s link count and contents indicate it is empty.
- **Syntax**: `rmdir [options] directory...`
- **Example**: `rmdir empty_folder`
- **Tip**: Prefer `rmdir` when you want to avoid deleting non-empty directories by mistake. Use `rm -r` only when you intend to remove a directory and its contents.

---

### Copying, Moving, and Deleting Files

#### `cp` — Copy Files and Directories

- **What it does**: Copies files or directory trees. With one source file and one destination (file or directory), it creates a copy; with multiple sources, the last argument must be an existing directory.
- **How it works**: Reads the source and writes to the destination; for directories with `-r`, it walks the tree and copies files and subdirectories recursively.
- **Syntax**:
  - `cp [options] source file_dest` — copy one file, optionally with a new name.
  - `cp [options] source... directory` — copy one or more items into an existing directory.
- **Common options**:
  - **`-r`** (or **`-R`**, **`--recursive`**): Copy directories recursively. Required when the source is a directory.
  - **`-i`**: Prompt before overwriting an existing file.
  - **`-n`**: Do not overwrite existing files (no-clobber).
- **Examples**:
  ```bash
  cp readme.txt readme_backup.txt    # copy and rename
  cp file1 file2 dir/                # copy both files into dir/
  cp -r src/ backup_src/             # copy entire src/ tree
  cp -i config.v config.v.bak        # prompt if config.v.bak exists
  ```
- **Tip**: Always check the destination: `cp file dir/` copies *into* `dir/`; `cp file dir` (no slash) can overwrite a file named `dir` if it exists.

---

#### `mv` — Move (or Rename) Files and Directories

- **What it does**: Moves files and directories to another path, or renames them. Same command for "rename" and "move": it’s just changing the path of the same inode(s).
- **How it works**: Within the same filesystem, `mv` typically changes directory entries (rename); across filesystems, it copies then removes the source.
- **Syntax**:
  - `mv source dest` — one source: rename or move to `dest`.
  - `mv source... directory` — multiple sources: last argument must be an existing directory.
- **Common options**:
  - **`-i`**: Prompt before overwriting.
  - **`-n`**: Do not overwrite existing files.
- **Examples**:
  ```bash
  mv old_name.txt new_name.txt       # rename
  mv file.txt ~/docs/                # move into docs/
  mv a.txt b.txt c.txt archive/      # move several into archive/
  ```
- **Tip**: Like `cp`, `mv file dir/` moves into the directory; `mv file dir` can overwrite a file named `dir`.

---

#### `rm` — Remove Files or Directory Trees

- **What it does**: Deletes files and, with `-r`, directories and their contents. **There is no standard "undo"**; deleted data is not moved to a trash can by default.
- **How it works**: Unlinks the file or, with `-r`, walks the tree and unlinks every file and directory. Data may remain on disk until overwritten, but the name is gone.
- **Syntax**: `rm [options] path...`
- **Common options**:
  - **`-r`** (or **`-R`**, **`--recursive`**): Remove directories and their contents.
  - **`-i`**: Prompt before each removal (slower but safer).
  - **`-f`**: Force: ignore nonexistent files and do not prompt. **Dangerous** when combined with `-r` (e.g. `rm -rf`) — one wrong path can wipe large parts of the filesystem.
- **Examples**:
  ```bash
  rm junk.txt                        # delete one file
  rm -i *.bak                        # delete with confirmation
  rm -r old_build/                   # delete directory and contents
  ```
- **Safety**: Avoid `rm -rf` with variables or wildcards unless you are certain of the path. Prefer `rm -ri` when deleting directories; run `pwd` and `ls` first to confirm location.

---

### Viewing Text Files

#### `cat` — Concatenate and Print Files

- **What it does**: Reads one or more files and prints their contents to standard output in order. Often used to view a single small file.
- **How it works**: Opens each file, reads its contents, and writes them to stdout. No paging — the entire output scrolls by.
- **Syntax**: `cat [options] [file...]`
- **Common options**:
  - **`-n`**: Number all output lines.
  - **`-b`**: Number non-empty lines only.
- **Examples**:
  ```bash
  cat README.txt
  cat -n source.v              # view with line numbers
  cat file1 file2              # concatenate two files to screen
  ```
- **Tip**: Use `cat` only for small files. For long files, use `less` (or `head` / `tail`) so you can scroll and search without flooding the terminal.

---

#### `less` — Pager for Viewing Text

- **What it does**: Opens a file (or piped input) in a **pager**: you can scroll forward and backward, search, and jump by line without loading the whole file into the terminal at once.
- **How it works**: Reads and displays the file in chunks; you navigate with single-key commands. Does not modify the file.
- **Syntax**: `less [options] [file...]`
- **Essential keys**:
  - **Space** or **Page Down** — next page
  - **b** or **Page Up** — previous page
  - **↓** / **j** — next line; **↑** / **k** — previous line
  - **/** — search forward (type pattern, Enter); **n** next match, **N** previous
  - **?** — search backward
  - **g** — go to start of file; **G** — go to end
  - **q** — quit
- **Examples**:
  ```bash
  less long_log.txt
  less +F /var/log/syslog        # follow mode (like tail -f)
  ```
- **Tip**: `less` is the default pager for `man`. Learning a few keys (`/`, `n`, `q`) makes both manual pages and log files much easier to use.

---

#### `head` — Output First Part of Files

- **What it does**: Prints the **first** lines (default 10) of each given file. Useful for a quick look at the start of a file or command output.
- **How it works**: Reads from the beginning of each file and stops after the requested number of lines (or bytes with `-c`).
- **Syntax**: `head [options] [file...]`
- **Common options**:
  - **`-n N`** or **`-N`**: Print the first N lines (e.g. `head -n 20` or `head -20`).
  - **`-c N`**: Print the first N bytes.
- **Examples**:
  ```bash
  head report.txt               # first 10 lines
  head -n 25 source.v           # first 25 lines
  head -5 file1 file2           # first 5 lines of each file
  ```
- **Tip**: Combine with pipelines: `some_command | head -20` to see only the start of long output.

---

#### `tail` — Output Last Part of Files

- **What it does**: Prints the **last** lines (default 10) of each given file. Often used to check the end of a log or to **follow** a growing file in real time.
- **How it works**: For a fixed number of lines, reads from the end of the file (efficient even for large files). With `-f`, keeps the file open and prints new lines as they are written.
- **Syntax**: `tail [options] [file...]`
- **Common options**:
  - **`-n N`** or **`-N`**: Print the last N lines.
  - **`-f`**: Follow: keep reading and display new lines as they are appended (e.g. log files). Exit with **Ctrl+C**.
  - **`-c N`**: Print the last N bytes.
- **Examples**:
  ```bash
  tail log.txt                   # last 10 lines
  tail -n 50 build.log           # last 50 lines
  tail -f /var/log/app.log       # follow log in real time
  ```
- **Tip**: Use `tail -f` when monitoring a running simulation or server log; **Ctrl+C** stops following.

---

### Text Editor (Brief)

#### `nano` — Simple Terminal Text Editor

- **What it does**: Opens a small, beginner-friendly text editor in the terminal. Good for quick edits when a graphical editor is not available.
- **How it works**: Full-screen terminal UI; you type normally; shortcut keys (shown at the bottom) perform actions like save and exit.
- **Syntax**: `nano [options] [file]` — if `file` is omitted, you can name it when saving.
- **Essential keys**:
  - **Ctrl+O** — Write (save) file; Enter to confirm path.
  - **Ctrl+X** — Exit; prompts to save if buffer was modified.
  - **Ctrl+W** — Search within the file.
- **Example**: `nano notes.txt` — create or edit `notes.txt`.
- **Tip**: The `^` symbol in the shortcut list means the **Ctrl** key (e.g. `^X` = Ctrl+X).

---

### Getting Help

#### `man` — Display Manual Pages

- **What it does**: Shows the **manual page** (documentation) for a command, system call, or config file. This is the standard, system-installed documentation on Unix-like systems.
- **How it works**: Looks up the topic in the man page database (e.g. `/usr/share/man`) and displays it using a pager (usually `less`).
- **Syntax**: `man [section] topic` or `man topic`
- **Sections**: Manual is split into sections (1 = user commands, 2 = system calls, 3 = library functions, 5 = file formats, etc.). `man ls` is the same as `man 1 ls`.
- **Navigation** (same as in `less`): **Space** next page, **b** previous page, **/** search, **n** next match, **q** quit.
- **Examples**:
  ```bash
  man ls
  man 1 printf
  man bash
  ```
- **Tip**: If you forget a flag, open `man command` and use `/` to search for the option name (e.g. `/recursive` in `man cp`).

---

#### `--help` / `-h` — Inline Command Help

- **What it does**: Many GNU and other commands support a **`--help`** (or sometimes **`-h`**) option that prints a short usage summary and list of options to stdout. Often quicker than opening `man` for a reminder.
- **How it works**: The program prints its built-in help text and exits; no man page or pager is involved.
- **Syntax**: `command --help` or `command -h`
- **Examples**:
  ```bash
  ls --help
  cp --help
  ```
- **Tip**: Pipe to `less` if the output is long: `ls --help | less`.

---

#### `whatis` — One-Line Description of a Command

- **What it does**: Shows the **one-line description** from the manual page for the given keyword(s). Useful to quickly recall what a command does.
- **How it works**: Queries the man page index (e.g. `mandb`) and prints the short description from the NAME section.
- **Syntax**: `whatis keyword...`
- **Example**: `whatis ls cp mv` → short lines like "ls (1) - list directory contents".
- **Tip**: Handy when you remember a name but not the exact purpose: `whatis grep find`.

---

#### `apropos` — Search Manual Descriptions by Keyword

- **What it does**: Searches the **short descriptions** of man pages for the given keyword and lists matching pages. Good for discovering which command does something (e.g. "copy", "permission").
- **How it works**: Same database as `whatis`; matches the keyword against the description text.
- **Syntax**: `apropos keyword` or `man -k keyword`
- **Example**: `apropos copy` → list of commands whose description mentions "copy".
- **Tip**: If you get too many results, use a more specific word or phrase.

---

### Shell Conveniences (No Separate Command)

- **Tab completion**: Type the first part of a command or path and press **Tab**; the shell completes the name or shows possible matches. Reduces typing and avoids typos.
- **Command history**: **↑** and **↓** scroll through previously entered commands. **Ctrl+R** (in bash) starts a reverse search in history.
- **`~` and `-`**: As described under `cd`, `~` expands to your home directory in many contexts; `cd -` switches back to the previous directory.

---

## Learning Outcomes

By the end of this module, students should be able to:

- Open a terminal and identify the current working directory
- Navigate between directories using `cd`, `pwd`, and `ls`
- Create, copy, move, and delete files and directories safely
- View the contents of text files with `cat`, `less`, `head`, and `tail`
- Use `man` pages and `--help` to discover how commands work
- Confidently move into and around a cloned course repository from the shell

---

## Exercises

1. **Hello Terminal**
   - Open a terminal.
   - Run `pwd` and note the result.
   - Use `ls` to list files, then `ls -la` to view hidden files.

2. **Directory Navigation**
   - Create a directory called `unix_practice` in your home directory.
   - Inside `unix_practice`, create subdirectories `notes` and `projects`.
   - Practice moving between these directories using only relative paths.

3. **File Operations**
   - In `notes`, create a file `readme.txt` with some text using `nano`.
   - Copy `readme.txt` to `notes/readme_copy.txt`.
   - Move `readme_copy.txt` into `projects/` and rename it to `project_notes.txt`.
   - Delete `project_notes.txt`.

4. **Viewing Files**
   - Create a text file with at least 30 lines (e.g., by copying a log or using a simple script).
   - Use `head` and `tail` to view the beginning and end of the file.
   - Use `less` to scroll through the file and search for a specific word.

5. **Help and Documentation**
   - Use `man ls` to find at least two useful flags and try them.
   - Use `ls --help` and compare it with the `man` page.
   - Use tab completion to type a few commands and paths more quickly.

---

## Assessment

- [ ] Can open a terminal and explain what the shell is
- [ ] Can reliably navigate using `cd`, `pwd`, and `ls`
- [ ] Can create, copy, move, and delete files and directories without errors
- [ ] Can view and scroll through text files using `cat`, `less`, `head`, and `tail`
- [ ] Can use `man` and `--help` to find command options
- [ ] Feels comfortable navigating into a project directory cloned from GitHub

---

## Next Steps

After completing this module, proceed to **Module 2: Filesystem, Permissions & Environment** to learn how Unix manages file types, permissions, and environment variables—critical for running simulators and tools reliably.

