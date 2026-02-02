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

