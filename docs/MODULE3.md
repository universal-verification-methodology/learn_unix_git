# Module 3: Processes, Pipes & Redirection

**Goal**: Manage running programs and connect commands using pipes and redirection

---

## Navigation

[← Previous: Module 2: Filesystem, Permissions & Environment](MODULE2.md) | [Next: Module 4: Shell Productivity & Basic Scripting →](MODULE4.md)

[↑ Back to README](../README.md)

---

## Running Module 3

From the repo root:

- **Self-check**: `./scripts/module3.sh --check`
- **Demo commands**: `./scripts/module3.sh --demo`
- **Exercise scaffold**: `./scripts/module3.sh --scaffold` (copies `sample.log` to `~/unix_practice/` for grep practice)

See [module3/README.md](../module3/README.md) for examples and quick start.

---

## Overview

This module teaches how Unix runs programs (processes), how to stop them, and how to connect commands together using pipes and redirection. These skills are critical when working with simulators, build tools, and large log files in digital design workflows.

### What You'll Learn

- **Processes**: How to see what is running and how to stop it
- **Foreground vs Background**: Long-running jobs and interactive control
- **Redirection**: Sending output to files and capturing errors
- **Pipes**: Combining simple tools to analyze logs and results
- **Basic Troubleshooting**: Using these tools to debug failing commands

### Prerequisites

Before starting this module, students should:

- [ ] Be comfortable navigating the filesystem from the terminal
- [ ] Know how to run simple commands and scripts
- [ ] Understand basic file permissions and executable scripts

---

## Topics Covered

### 1. Processes and Control

- **Running Programs**
  - How the shell starts a process
  - Exit status concept (0 = success, non-zero = error)
- **Interrupting and Stopping**
  - `Ctrl+C` to stop a foreground program
  - `Ctrl+Z` (suspend) concept (optional, high-level)
- **Listing Processes**
  - `ps` and `ps aux | head` (high-level view)
  - Concept of PID (Process ID)

### 2. Foreground and Background Jobs

- **Background Execution**
  - Running commands with `&` (when appropriate)
  - Example: Long-running simulations or builds
- **Job Control (Conceptual)**
  - `jobs`, `fg`, `bg` (enough to resume a stopped job)
  - When background jobs are useful vs confusing for beginners

### 3. Redirection (>, >>, 2>, &>)

- **Standard Output and Error**
  - `>` to overwrite a file
  - `>>` to append to a file
  - `2>` to capture errors separately
- **Common Patterns**
  - Saving logs: `command > run.log 2>&1`
  - Separating errors: `command > out.log 2> err.log`
  - Quick inspection with `tail -f run.log` for long-running tasks

### 4. Pipes and Text Processing

- **Using Pipes**
  - `|` to send the output of one command into another
  - Example: `ls -l | less`, `ps aux | grep <pattern>`
- **Searching Output**
  - `grep "ERROR" file_or_stream`
  - Case-insensitive search with `grep -i`
- **Combining Tools**
  - Example chains for log analysis:
    - `command 2>&1 | tee run.log | grep -i error`
    - `cat big.log | grep "test" | less`

### 5. Basic Troubleshooting Mindset

- **Reading Error Messages**
  - Identify the actual failing command and message
  - Use `echo $?` to check the last command’s exit status (optional)
- **Using Logs Effectively**
  - Redirect simulator/build output to log files
  - Search logs for warnings and errors
  - Use `head`, `tail`, and `less` to navigate quickly

---

## Learning Outcomes

By the end of this module, students should be able to:

- Start, interrupt, and (when necessary) background a command
- View running processes and understand what a PID is
- Redirect standard output and standard error to files
- Use pipes to connect commands and filter output
- Search logs and command output with `grep`
- Apply these tools to diagnose failing builds or simulations

---

## Exercises

1. **Process Basics**
   - Run a command that sleeps: `sleep 30`.
   - Use `Ctrl+C` to interrupt it.
   - Start `sleep 60 &` and note the job number and PID.
   - Use `ps` to find the `sleep` process.

2. **Foreground and Background**
   - Run `yes "running..."` (be ready to stop it).
   - Stop it with `Ctrl+C`.
   - Start it again as `yes "running..." > yes.log &`.
   - Use `tail -n 5 yes.log` to inspect the output, then stop the background job (e.g., with `ps` + `kill` or `jobs` + `fg` + `Ctrl+C`).

3. **Redirection Practice**
   - Run a command that prints both output and an error (e.g., `ls`, then `ls does_not_exist`).
   - Capture output to `out.log` and errors to `err.log`:
     - `ls existing_dir does_not_exist > out.log 2> err.log`
   - Inspect both files with `cat` or `less`.

4. **Pipes and Grep**
   - Create a sample log file:
     - `dmesg | tail -n 100 > sample.log` (or another command that generates text).
   - Use `grep` to find lines containing a specific word.
   - Use `grep -i` for case-insensitive search and compare results.
   - View filtered results with `grep "<word>" sample.log | less`.

5. **Log-Based Debugging**
   - Run a command that fails (e.g., intentionally misspell a command or pass a bad flag).
   - Capture its combined output to `debug.log`:
     - `badcommand 2>&1 | tee debug.log`
   - Open `debug.log` and identify:
     - The command that failed
     - The error message
     - At least one thing you could try to fix it

---

## Assessment

- [ ] Can start, interrupt, and (optionally) background commands
- [ ] Can list processes and understand what a PID is
- [ ] Can redirect both stdout and stderr to files
- [ ] Can construct simple pipelines using `|` and `grep`
- [ ] Can capture logs and search them for errors or warnings
- [ ] Can use these tools to collect information when a build or simulation fails

---

## Next Steps

After completing this module, proceed to **Module 4: Shell Productivity & Basic Scripting** to learn how to automate common workflows and wrap simulator or build commands in simple, reusable scripts.

