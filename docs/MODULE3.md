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

## Command Reference (Detailed)

This section describes the commands and concepts introduced in Module 3: processes, job control, redirection, pipes, and text filtering—essential for running simulators, builds, and debugging from the shell.

---

### Standard Streams and File Descriptors

Before using redirection and pipes, it helps to know what the shell connects by default:

| Stream        | File descriptor | Default destination | Typical use        |
|---------------|-----------------|---------------------|--------------------|
| **stdin**     | 0               | Keyboard (terminal) | Input to a program |
| **stdout**    | 1               | Terminal screen     | Normal output      |
| **stderr**    | 2               | Terminal screen     | Error messages     |

When you run a command, it inherits these three from the shell. Redirection changes where stdout/stderr (or stdin) go; pipes connect one command's stdout to the next command's stdin.

---

### Exit Status

- **What it is**: Every command returns an **exit status** (a small integer) when it finishes. By convention, **0** means success and **any non-zero value** means some kind of failure. Scripts and tools use this to decide what to do next.
- **How to check**: In the shell, the last command's exit status is stored in the variable **`$?`**. Run `echo $?` immediately after a command to see it (the next command will overwrite `$?`).
- **Examples**:
  ```bash
  ls /tmp
  echo $?        # 0 if /tmp exists and was listed
  ls /nonexistent
  echo $?        # non-zero (e.g. 2) on failure
  ```
- **Tip**: In scripts you often see `if command; then ...` or `command && next_command`; both rely on exit status. Use `echo $?` when debugging "why did this fail?"

---

### Interrupting and Stopping Programs (Keyboard)

- **Ctrl+C**: Sends **SIGINT** to the foreground process. Most programs react by exiting. Use this to cancel a running command (e.g. a stuck build or simulation).
- **Ctrl+Z**: Sends **SIGTSTP** and **suspends** the foreground process; it stays in memory but stops running. The shell then shows a prompt; you can resume with `fg` (foreground) or `bg` (background). Optional for this module but useful once you use job control.
- **Tip**: If the terminal seems stuck, try Ctrl+C first. If the program ignores it, you may need `kill` from another terminal (see below).

---

### Processes

#### `ps` — Report Process Status

- **What it does**: Lists **processes** (running programs). Shows PID (process ID), user, CPU/memory use, command line, and more depending on options. Essential for seeing what is running and for finding a PID to stop a process.
- **How it works**: Reads process information from the kernel's process table (often from `/proc` on Linux). Different systems support different option sets; **BSD-style** (`ps aux`) and **GNU-style** (`ps -ef`) are common.
- **Syntax**: `ps [options]`
- **Common options**:
  - **`ps`** (no options): Shows processes associated with the current terminal (often just your shell and maybe one command).
  - **`ps aux`**: (BSD-style) List all processes: `a` = all users, `u` = user-oriented output, `x` = include processes without a terminal. Columns: USER, PID, %CPU, %MEM, VSZ, RSS, TTY, STAT, START, TIME, COMMAND.
  - **`ps -ef`**: (SysV-style) Similar "all processes" view. Columns include UID, PID, PPID, C, STIME, TTY, TIME, CMD.
- **Examples**:
  ```bash
  ps                # your terminal's processes
  ps aux            # all processes, detailed
  ps aux | head -20 # first 20 lines
  ps aux | grep iverilog   # find iverilog processes
  ```
- **Tip**: Use `ps aux | grep <name>` to find a process by name and get its PID; then use `kill <PID>` if you need to stop it. PID 1 is the init process; your shell and commands have larger PIDs.

---

#### `kill` — Send a Signal to a Process

- **What it does**: Sends a **signal** to one or more processes by PID (or sometimes by job spec). The default signal is **SIGTERM** (15), which asks the process to exit gracefully. **SIGKILL** (9) forces immediate termination when a process ignores SIGTERM.
- **How it works**: The kernel delivers the signal to the process; the process's signal handler (or default action) runs. SIGTERM can be caught and ignored; SIGKILL cannot.
- **Syntax**: `kill [-signal] PID...` or `kill -l` (list signal names).
- **Common usage**:
  - **`kill PID`** or **`kill -15 PID`**: Ask the process to terminate (SIGTERM).
  - **`kill -9 PID`** or **`kill -KILL PID`**: Force kill (SIGKILL). Use when a process does not respond to Ctrl+C or `kill`.
- **Examples**:
  ```bash
  kill 12345        # send SIGTERM to process 12345
  kill -9 12345     # force kill
  kill -9 %1        # kill job 1 (job control, see below)
  ```
- **Tip**: Prefer `kill PID` first; use `kill -9` only if the process does not exit. Force-killing can leave temporary files or inconsistent state.

---

### Foreground and Background Jobs

#### Running a Command in the Background: `&`

- **What it does**: Appending **`&`** to a command line runs the command in the **background**. The shell starts the process and immediately prints a new prompt and the job number; the command keeps running without owning the terminal. Useful for long simulations or builds while you keep using the shell.
- **How it works**: The shell forks and runs the command in a process group; it does not wait for it. stdout/stderr still go to the terminal unless you redirect them.
- **Syntax**: `command [args] &`
- **Examples**:
  ```bash
  sleep 60 &
  iverilog -o sim ... &
  make all > build.log 2>&1 &
  ```
- **Tip**: Redirect output when running in background so it does not mix with what you type: `long_command > run.log 2>&1 &`.

---

#### `jobs` — List Active Jobs

- **What it does**: Lists the **jobs** (background or suspended commands) associated with the current shell. Shows job number, status (Running, Stopped, Done), and the command line. Job numbers are used with `fg` and `bg`.
- **How it works**: The shell tracks jobs by job number (e.g. `[1]`, `[2]`). Only jobs in this shell session are shown.
- **Syntax**: `jobs [options]`
- **Examples**:
  ```bash
  jobs              # list all jobs
  jobs -l           # include PIDs
  ```
- **Tip**: After starting something with `&`, run `jobs` to see its job number so you can bring it to the foreground with `fg %1` if needed.

---

#### `fg` — Bring Job to Foreground

- **What it does**: Brings a **background or suspended** job to the **foreground**, attaching it to the terminal. You can then interact with it or stop it with Ctrl+C.
- **How it works**: The shell gives the terminal to the job's process group; the job runs in the foreground until it exits or you suspend it (Ctrl+Z) or kill it (Ctrl+C).
- **Syntax**: `fg [job_spec]` — `job_spec` is often `%1`, `%2`, or `%` (current job).
- **Examples**:
  ```bash
  fg       # bring current (or only) job to foreground
  fg %1    # bring job 1 to foreground
  ```
- **Tip**: If you started a job in the background and want to stop it, use `fg %1` (or the right job number), then press Ctrl+C.

---

#### `bg` — Run Job in Background

- **What it does**: Resumes a **suspended** job and runs it in the **background**. The job continues running without owning the terminal.
- **How it works**: Sends SIGCONT to the job and marks it as running in the background; the shell continues to the next prompt.
- **Syntax**: `bg [job_spec]`
- **Examples**:
  ```bash
  bg      # resume current job in background
  bg %1   # resume job 1 in background
  ```
- **Tip**: Use after Ctrl+Z if you want the program to keep running without blocking the terminal.

---

### Redirection

Redirection is done by the **shell**, not by the command. The shell opens the files and sets up file descriptors before running the command.

#### `>` — Redirect Standard Output (Overwrite)

- **What it does**: Sends **stdout** (file descriptor 1) of the command to a **file**, replacing the file's contents. The file is created if it does not exist.
- **Syntax**: `command > file`
- **Examples**:
  ```bash
  ls -l > listing.txt
  echo "result" > result.txt
  ```
- **Tip**: The command does not "see" the redirection; it just writes to stdout and the shell redirects it. Use `>>` to append instead of overwrite.

---

#### `>>` — Redirect Standard Output (Append)

- **What it does**: Sends **stdout** to a **file**, **appending** to the end. Does not remove existing content.
- **Syntax**: `command >> file`
- **Examples**:
  ```bash
  echo "new line" >> log.txt
  date >> run.log
  ```
- **Tip**: Use `>>` for log files when you want to keep a history of runs.

---

#### `2>` — Redirect Standard Error

- **What it does**: Sends **stderr** (file descriptor 2) to a **file**. Normal stdout still goes to the terminal (or wherever you redirect it). Use this to capture error messages separately.
- **Syntax**: `command 2> file`
- **Examples**:
  ```bash
  ls /tmp /nonexistent 2> err.log   # stdout to terminal, errors to err.log
  make 2> build.err                 # errors in build.err
  ```
- **Tip**: Order of redirections can matter in some shells; `2> err.log > out.log` and `> out.log 2> err.log` both send stdout to `out.log` and stderr to `err.log`.

---

#### `2>&1` — Send stderr to Where stdout Goes

- **What it does**: **Duplicate** stderr onto stdout (file descriptor 2 becomes a copy of 1). After this, both stdout and stderr go to the same place—useful so you can redirect or pipe "everything" together.
- **How it works**: The shell duplicates fd 1 onto fd 2. It must be done in the right order: first redirect stdout (e.g. to a file or pipe), then `2>&1` so stderr follows.
- **Syntax**: `command > file 2>&1` or `command 2>&1 | next_command`
- **Examples**:
  ```bash
  my_tool > run.log 2>&1           # all output (stdout + stderr) to run.log
  make 2>&1 | tee build.log        # terminal and file both get everything
  bad_cmd 2>&1 | grep -i error     # pipe both streams into grep
  ```
- **Tip**: Write `> file 2>&1` (stdout first, then "stderr to stdout"). In bash, **`&> file`** or **`>& file`** is a shortcut for "stdout and stderr to file".

---

#### `<` — Redirect Standard Input

- **What it does**: Reads **stdin** from a **file** instead of the terminal. The command receives the file's contents as its input.
- **Syntax**: `command < file`
- **Examples**:
  ```bash
  sort < unsorted.txt
  wc -l < data.txt
  ```
- **Tip**: Many commands accept a filename as an argument (e.g. `sort unsorted.txt`), so `< file` is not always needed, but it is useful when a program only reads from stdin.

---

### Pipes

#### `|` — Pipe (Connect stdout to stdin)

- **What it does**: Connects the **stdout** of the command on the left to the **stdin** of the command on the right. Data flows left to right; you can chain several commands. The shell runs both (or all) processes and connects the streams.
- **How it works**: The shell creates a **pipe** (a kernel buffer), runs the left command with its stdout connected to the pipe, and runs the right command with its stdin connected to the pipe. No temporary file is used.
- **Syntax**: `command1 | command2` or `command1 | command2 | command3`
- **Examples**:
  ```bash
  ls -l | less
  ps aux | grep iverilog
  cat big.log | grep ERROR | less
  dmesg | tail -n 50
  ```
- **Tip**: Only **stdout** is piped by default. To include stderr, use `command 2>&1 | next_command`. Pipes run the stages in parallel; the right-hand command can back-pressure the left if it reads slowly.

---

### Text Filtering and Processing

#### `grep` — Search for Lines Matching a Pattern

- **What it does**: Reads input (files or stdin) and prints **only lines** that match a **pattern** (regular expression by default). One of the most used tools for log analysis and filtering command output.
- **How it works**: Scans line by line; if a line matches the pattern, it is printed. Exit status: 0 if at least one match, 1 if no match, 2 on error (e.g. invalid regex or file not found).
- **Syntax**: `grep [options] pattern [file...]` or `command | grep [options] pattern`
- **Common options**:
  - **`-i`**: Ignore case (e.g. match "error", "Error", "ERROR").
  - **`-n`**: Print line numbers.
  - **`-v`**: Invert: print lines that do **not** match.
  - **`-c`**: Count matching lines (print count only).
  - **`-E`**: Extended regex (or use `egrep`).
- **Examples**:
  ```bash
  grep "ERROR" run.log
  grep -i warning build.log
  grep -n "fail" test_results.txt
  ps aux | grep sleep
  grep -v "^#" config.ini
  grep -c "PASS" results.log
  ```
- **Tip**: Put the pattern in quotes to avoid the shell expanding special characters. Use `grep -i error` when you are not sure about casing in logs.

---

#### `tee` — Read from stdin, Write to File and stdout

- **What it does**: Copies **stdin** to **stdout** and optionally to one or more **files**. Lets you save a copy of a command's output while still viewing it or piping it further.
- **How it works**: Reads from stdin and writes each chunk to both stdout and the given files. Often used in the middle of a pipeline.
- **Syntax**: `command | tee file` or `command | tee file | next_command`
- **Common options**:
  - **`-a`**: Append to the file instead of overwriting.
- **Examples**:
  ```bash
  make 2>&1 | tee build.log              # terminal + build.log
  iverilog ... 2>&1 | tee sim.log | less # view and save sim output
  echo "line" | tee -a log.txt           # append to log
  ```
- **Tip**: Use `command 2>&1 | tee run.log` to capture full output (stdout + stderr) and still see it in the terminal; then search with `grep` in `run.log` if needed.

---

### Summary: Common Redirection and Pipe Patterns

| Goal                         | Example                                      |
|-----------------------------|----------------------------------------------|
| Save stdout to file         | `command > out.log`                          |
| Append stdout to file       | `command >> out.log`                         |
| Save stderr to file         | `command 2> err.log`                         |
| Save both to one file       | `command > run.log 2>&1` or `command &> run.log` |
| Save stdout and stderr separately | `command > out.log 2> err.log`          |
| Pipe both to next command   | `command 2>&1 | grep error`                    |
| View and save combined output | `command 2>&1 | tee run.log` or `... | tee run.log | less` |
| Run in background with log  | `command > run.log 2>&1 &`                  |

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

