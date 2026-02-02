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

See [module1/README.md](../module1/README.md) for examples and quick start.

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

