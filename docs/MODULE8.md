# Module 8: End-to-End Project Workflow (Unix + Git + Design Flow)

**Goal**: Combine Unix and Git skills into a complete, repeatable project workflow

---

## Navigation

[← Previous: Module 7: Advanced Git for Collaboration & IP Reuse](MODULE7.md) | [Next: N/A (Last Module) →](MODULE8.md)

[↑ Back to README](../README.md)

---

## Running Module 8

From the repo root:

- **Self-check**: `./scripts/module8.sh --check`
- **Demo commands**: `./scripts/module8.sh --demo`

See [module8/README.md](../module8/README.md) for examples and quick start. Use `module8/examples/template/sample_project` to try the template, script, and log capture flow.

---

## Overview

This final module connects all previous Unix and Git topics into a single, coherent workflow that mirrors how students will work in your digital design courses. While the exact tools (e.g., simulators) are covered in other modules, this document focuses on the Unix and Git steps needed to set up a project, run scripted flows, inspect results, and submit work via GitHub.

### What You'll Learn

- **Project Bootstrap**: Cloning a template repo and inspecting its structure
- **Scripted Workflows**: Using and extending shell scripts to run tasks
- **Log and Result Management**: Capturing, searching, and understanding outputs
- **Version Control Integration**: Making commits that correspond to meaningful milestones
- **Submission Flow**: Pushing changes and verifying that everything is reproducible

### Prerequisites

Before starting this module, students should:

- [ ] Have completed Modules 1–7 or be comfortable with their topics
- [ ] Have Git and a Unix-like shell available
- [ ] Have a working editor and basic familiarity with course-specific tools

---

## Topics Covered

### 1. Starting from a Template Repository

- **Cloning the Template**
  - `git clone <course-template-url> project_name`
  - Navigating into `project_name/` and running `ls` to inspect top-level structure
- **Inspecting Project Layout**
  - Typical layout (high-level; adjusted to match your design courses), e.g.:
    - `src/`, `tb/` or `tests/`, `docs/`, `scripts/`, `build/`
  - Identifying where to place new RTL, testbenches, and scripts
- **Initial Git Status**
  - Running `git status` to confirm a clean working tree

### 2. Using Provided Scripts

- **Script Entry Points**
  - Example scripts: `scripts/run_tests.sh`, `scripts/moduleX.sh`, or similar
  - Understanding usage messages: `./scripts/run_tests.sh --help` (if available)
- **Running Tasks via Scripts**
  - From project root: running `./scripts/<name>.sh` instead of long command sequences
  - Redirecting outputs when needed:
    - `./scripts/run_tests.sh > logs/tests.log 2>&1`
- **Customizing Scripts (Lightly)**
  - Editing variables (e.g., paths, flags) near the top of scripts
  - Keeping custom changes minimal and well-documented

### 3. Inspecting Logs and Outputs

- **Log Directories**
  - Common patterns: `logs/`, `build/`, `out/`
  - Using `tree` or `ls -R` (cautiously) to understand where outputs go
- **Analyzing Logs**
  - Using `tail`, `less`, and `grep` for errors and warnings
  - Filtering by severity keywords (`ERROR`, `WARN`, etc.)
- **Cleaning Outputs**
  - Using scripts (e.g., `scripts/clean.sh`) or manual commands to remove generated files
  - Understanding which outputs are safe to delete vs hand-written source

### 4. Iterative Development with Git

- **Small, Focused Commits**
  - Grouping changes logically (e.g., “add testbench for X”, “fix bug in Y”)
  - Avoiding huge “everything changed” commits
- **Typical Loop**
  - Edit files in `src/` and `tb/`
  - Run scripts to build/test
  - Inspect logs and fix issues
  - Stage changes and commit with a clear message
- **Branching for Larger Tasks**
  - Creating a branch for a bigger feature or lab
  - Merging back into `main` after verifying tests pass

### 5. Preparing and Submitting Work

- **Pre-Submission Checks**
  - Ensure `git status` is clean (no untracked or unstaged changes you care about)
  - Confirm scripts run successfully from a clean checkout:
    - Optionally run `git clean -fdx` in a throwaway copy to simulate a fresh clone
  - Verify that logs and build outputs are excluded by `.gitignore`
- **Pushing to GitHub**
  - `git push` (or `git push -u origin <branch>` for new branches)
  - Verifying on GitHub that the latest commits and files are present
- **Optional: Pull Requests**
  - Opening a PR from a feature branch to `main` (or to a course-provided upstream)
  - Briefly describing changes and linking to relevant tasks or labs

### 6. End-to-End Example Scenario

- **Example Flow (Conceptual)**
  1. Clone course lab repository.
  2. Create a new branch `lab1`.
  3. Implement or modify RTL and testbench files.
  4. Run `./scripts/lab1.sh` (or equivalent) to build and simulate.
  5. Inspect logs and waveforms; fix issues and rerun as needed.
  6. Commit changes in logical chunks.
  7. Push branch to GitHub.
  8. Open a pull request or notify the instructor according to course policy.

---

## Command Reference (Detailed)

This section consolidates the Unix and Git commands and patterns used in the end-to-end workflow. Most commands are covered in earlier modules; here they are grouped by workflow phase and supplemented with module-specific patterns (e.g. script execution, log capture, pre-submission checks).

---

### Project Bootstrap

#### Cloning and Inspecting a Template

- **Clone**: **`git clone <course-template-url> project_name`** — creates `project_name/` with the template repo. See Module 6.
- **Navigate**: **`cd project_name`** — project root is where you run scripts and Git commands.
- **Inspect layout**: **`ls`**, **`ls -la`**, or **`tree -L 2`** (if available) — confirm `src/`, `tb/` or `tests/`, `docs/`, `scripts/`, `build/` or `logs/`. See Module 5 for project structure.
- **Initial Git state**: **`git status`** — should show a clean working tree (no local changes) right after clone. See Module 6.
- **Tip**: Run **`git status`** from the project root before and after making changes so you know what will be committed.

---

#### Typical Project Layout (Recap)

| Directory   | Purpose |
|------------|---------|
| **`src/`** | RTL, source code (e.g. `.v`, `.sv`, `.cpp`). |
| **`tb/`** or **`tests/`** | Testbenches, test scripts. |
| **`docs/`** | Documentation, notes, specs. |
| **`scripts/`** | Entry-point scripts: run_tests, build, clean, module-specific (e.g. `lab1.sh`). |
| **`build/`**, **`out/`**, **`logs/`** | Generated outputs (objects, logs, waveforms). Excluded via `.gitignore`; not committed. |

- **Tip**: Put **only** source, config, and scripts under version control; keep build and logs out (Module 5, 6).

---

### Scripted Workflows

#### Running Scripts from Project Root

- **Entry point**: Scripts are usually run **from the project root** so relative paths inside the script (e.g. `src/`, `build/`) resolve correctly. Example: **`./scripts/run_tests.sh`**, **`./scripts/lab1.sh`**.
- **Execute permission**: Scripts must be executable (**`chmod +x scripts/run_tests.sh`**) or run via **`bash scripts/run_tests.sh`**. See Module 2, 4.
- **Help**: If the script supports it: **`./scripts/run_tests.sh --help`** or **`./scripts/run_tests.sh -h`** — check usage and options before running.
- **Tip**: Always run from **project root** (`pwd` should show the repo root). Do not run scripts from inside `src/` or `build/` unless the script is designed for that.

---

#### Redirecting Script Output to Logs

- **Capture stdout and stderr**: **`./scripts/run_tests.sh > logs/tests.log 2>&1`** — all output goes to `logs/tests.log`; nothing (or minimal) on the terminal. See Module 3.
- **View and save**: **`./scripts/run_tests.sh 2>&1 | tee logs/tests.log`** — output appears in the terminal and is saved to `logs/tests.log`. Use when you want to watch the run and keep a log.
- **Ensure log dir exists**: **`mkdir -p logs`** before the first run, or have the script create it.
- **Tip**: Use **`> logs/run.log 2>&1`** for batch or background runs; use **`2>&1 | tee logs/run.log`** when you need to see output in real time and still search it later with **`grep`**.

---

#### Customizing Scripts (Lightly)

- **Where to edit**: Variables at the **top** of the script (paths, tool names, flags) are the usual place for course-specific tweaks. Avoid changing core logic unless you understand it.
- **Document**: Add a short comment (e.g. `# Course: changed path to local tools`) so you and reviewers know what was customized.
- **Tip**: Prefer **config files** or **environment variables** over editing scripts when the course supports it; that keeps script updates (e.g. from upstream) easier to merge.

---

### Log and Result Management

#### Where Outputs Go

- **Common dirs**: **`logs/`** (test/sim logs), **`build/`** or **`out/`** (object files, binaries, waveforms). Scripts or Makefiles usually define these; check the script or README.
- **Inspect structure**: **`ls -R build/`**, **`ls -R logs/`**, or **`tree build/`** (if `tree` is available) — see what was generated. See Module 5.
- **Tip**: Ensure **`build/`**, **`logs/`**, and artifact patterns (e.g. **`*.log`**, **`*.vcd`**) are in **`.gitignore`** so they are not committed (Module 6).

---

#### Analyzing Logs

- **Last lines**: **`tail -n 50 logs/tests.log`** — quick check of the end of the log (where failures often appear). See Module 1, 3.
- **Scroll and search**: **`less logs/tests.log`** — then **`/error`** or **`/ERROR`** to search; **`n`** for next match, **`q`** to quit. See Module 1.
- **Filter by keyword**: **`grep -i error logs/tests.log`**, **`grep -i warn logs/tests.log`**, **`grep -n fail logs/tests.log`** — find lines containing error/warn/fail (case-insensitive with **`-i`**; **`-n`** for line numbers). See Module 3.
- **Multiple files**: **`grep -R -i error logs/`** — search under **`logs/`** recursively.
- **Tip**: Use **`grep -i error logs/*.log`** or **`grep -i error logs/tests.log`** after a run to quickly see if the script reported errors; then open the log in **`less`** for context.

---

#### Cleaning Generated Outputs

- **Script-based**: Many projects provide **`./scripts/clean.sh`** or **`make clean`** — run from project root to remove build artifacts and (optionally) logs. Use this when you want to test a clean rebuild.
- **Manual**: **`rm -rf build/*`**, **`rm -rf logs/*`** — only if you are sure these dirs contain only generated files. **Never** remove **`src/`**, **`tb/`**, or **`scripts/`** contents unless you intend to.
- **Tip**: Before a **clean rebuild test**, run the project’s clean script (or remove only **`build/`** and **`logs/`**). Then run the main script again to confirm the project builds from a clean state.

---

### Version Control in the Loop

#### Iterative Commit Workflow

- **Edit**: Change files in **`src/`**, **`tb/`**, or configs as needed.
- **Run**: **`./scripts/<script>.sh`** (and redirect to logs if desired).
- **Inspect**: Use **`tail`**, **`less`**, **`grep`** on logs; fix issues and rerun until satisfied.
- **Stage**: **`git add <file>`** or **`git add src/ tb/`** — only what you want in this commit. See Module 6.
- **Commit**: **`git commit -m "Clear message: what and why"`** — small, logical chunks (e.g. “Add counter testbench”, “Fix reset in FSM”). See Module 6.
- **Repeat**: Edit → run → inspect → fix → add → commit. Use **`git status`** and **`git diff`** often.
- **Tip**: Prefer **small, focused commits** over one big “everything changed” commit. It makes history easier to understand and reverts easier if something breaks.

---

#### Branching for Larger Tasks

- **Create branch**: **`git checkout -b lab1`** or **`git switch -c lab1`** — work on **`lab1`** so **`main`** stays stable. See Module 7.
- **Work and commit**: Same edit → run → inspect → commit loop on the branch.
- **Merge back**: When the lab or feature is done and tests pass: **`git checkout main`**, **`git merge lab1`**. See Module 7.
- **Tip**: Use a branch per lab or assignment (e.g. **`lab1`**, **`lab2`**) so you can push the branch, open a PR, or hand in a specific branch as required by the course.

---

### Pre-Submission Checks

#### Ensure a Clean, Reproducible State

- **Working tree**: **`git status`** — no unintended **modified** or **untracked** files. Commit or discard (e.g. **`git restore`**) as needed. See Module 6.
- **What gets pushed**: Only **tracked, committed** files are pushed. Confirm that **build/**, **logs/**, and large or generated files are **not** staged (they should be in **`.gitignore`**).
- **Clean rebuild (optional)**: In a **copy** of the repo (to avoid losing work), run **`git clean -fdx`** to remove all untracked and ignored files, then run the main script(s) to verify the project builds and runs from a clean checkout. See **`git clean`** below.
- **Tip**: Before pushing, run **`git status`** and **`git log --oneline -3`** to confirm the latest commits are what you want to submit.

---

#### `git clean` — Remove Untracked and Ignored Files

- **What it does**: Removes **untracked** files and directories from the working tree. With **`-fdx`**, also removes **ignored** files (e.g. **`build/`**, **`*.log`**). Use to simulate a **fresh clone** in a copy of the repo (e.g. to test that the project builds from a clean state).
- **How it works**: **`-f`** = force (required); **`-d`** = remove untracked directories; **`-x`** = remove ignored files too. **`-n`** (dry run) shows what would be removed without deleting.
- **Syntax**: `git clean -fd` (untracked only), `git clean -fdx` (untracked + ignored), `git clean -n -fdx` (dry run).
- **Examples**:
  ```bash
  git clean -n -fdx              # show what would be removed (dry run)
  git clean -fdx                # remove untracked and ignored (destructive)
  git clean -fd                  # remove only untracked (keeps ignored)
  ```
- **Warning**: **`git clean -fdx`** is **destructive** and cannot be undone. Use only in a **throwaway copy** of the repo (e.g. a second clone or a copy of the directory), not in your main working copy unless you are sure you do not need any untracked or ignored files.
- **Tip**: Use **`git clean -n -fdx`** first to see the list of files that would be deleted; then run **`git clean -fdx`** only in a copy if you want to test a clean rebuild.

---

### Pushing and Verifying Submission

#### Push to GitHub

- **Push current branch**: **`git push`** — if upstream is set (e.g. after an earlier **`git push -u origin main`**). See Module 6.
- **Push new branch**: **`git push -u origin lab1`** — push **`lab1`** and set **`origin/lab1`** as upstream so future **`git push`** works from this branch.
- **Verify on GitHub**: Open the repo in the browser; confirm the **latest commits** and **branch** are present; confirm **no** build artifacts or large logs appear in the file list (they should be ignored and not committed).
- **Tip**: After pushing, refresh the repo page on GitHub and open a few files or commits to confirm what the instructor or TA will see.

---

#### Optional: Pull Request

- **When**: Course may ask for a **pull request** from your branch (e.g. **`lab1`**) into **`main`** or into a course upstream repo. See Module 7.
- **Steps**: Push your branch (**`git push -u origin lab1`**), then on GitHub open **New Pull Request**, choose **base** (e.g. **`main`**) and **compare** (e.g. **`lab1`**), add a short description, and submit. Address review comments by pushing more commits to the same branch.
- **Tip**: In the PR description, mention the lab or task number and what you changed (e.g. “Lab 1: added counter module and testbench”) so grading is straightforward.

---

### End-to-End Workflow Summary

| Phase | Actions |
|-------|--------|
| **Bootstrap** | **`git clone <url> project_name`** → **`cd project_name`** → **`ls`** / **`tree`** → **`git status`** |
| **Run** | **`./scripts/run_tests.sh`** or **`./scripts/lab1.sh`**; optionally **`> logs/run.log 2>&1`** or **`2>&1 \| tee logs/run.log`** |
| **Inspect** | **`tail logs/run.log`**, **`less logs/run.log`**, **`grep -i error logs/run.log`** |
| **Iterate** | Edit **src/** or **tb/** → run script → inspect logs → **`git add`** → **`git commit -m "..."`** |
| **Branch (optional)** | **`git checkout -b lab1`** → work and commit on **lab1** → **`git checkout main`** → **`git merge lab1`** |
| **Pre-submit** | **`git status`** (clean?) → confirm **.gitignore** excludes build/logs → optional: **`git clean -n -fdx`** in a copy |
| **Submit** | **`git push`** or **`git push -u origin <branch>`** → verify on GitHub; optionally open PR |

---

### Quick Reference: Commands by Module

- **Navigation & files (Module 1)**: **`pwd`**, **`ls`**, **`cd`**, **`mkdir`**, **`cp`**, **`mv`**, **`rm`**, **`cat`**, **`head`**, **`tail`**, **`less`**
- **Permissions & env (Module 2)**: **`chmod +x`**, **`echo $VAR`**, **`which`**, **`PATH`**
- **Processes & redirection (Module 3)**: **`> file 2>&1`**, **`|`**, **`grep`**, **`tee`**, **`tail -f`**
- **Scripting (Module 4)**: **`#!/usr/bin/env bash`**, **`set -e`**, variables, **`"$1"`**, **`if`**, **`for`**
- **Projects & archives (Module 5)**: **`find`**, **`grep -R`**, **`tree`**, **`tar`**, **`zip`**
- **Git basics (Module 6)**: **`git status`**, **`git add`**, **`git commit`**, **`git log`**, **`git diff`**, **`git push`**, **`git pull`**, **`.gitignore`**, **`git restore`**
- **Git advanced (Module 7)**: **`git branch`**, **`git checkout -b`**, **`git merge`**, conflict resolution, **`git submodule`**, **`git blame`**, **`git bisect`**, PR flow
- **This module (Module 8)**: Run scripts from root, redirect to **logs/**, inspect with **tail/less/grep**, **git clean -fdx** (in a copy), pre-submission checklist, push and verify on GitHub.

---

## Learning Outcomes

By the end of this module, students should be able to:

- Clone a template repository and understand its directory structure
- Use provided shell scripts to run builds, tests, or simulations
- Capture and inspect logs using Unix tools
- Develop iteratively, making small, meaningful Git commits
- Prepare a clean, reproducible repository state for submission
- Push work to GitHub (and optionally open a pull request) as part of an assignment workflow

---

## Exercises

1. **Template Clone and Inspection**
   - Clone a course template or example repository.
   - Run `ls` and (optionally) `tree` to map out `src/`, `tb/tests/`, `scripts/`, `docs/`, and `build/`.
   - Sketch or document the project layout for your own reference.

2. **Scripted Run + Log Capture**
   - Run a provided script (or a simple placeholder script you create) from the project root.
   - Redirect its output to `logs/run.log` using `> logs/run.log 2>&1`.
   - Use `grep` to find any lines containing `error` or `fail` (case-insensitive).

3. **End-to-End Change Cycle**
   - Make a small, intentional change to a source or configuration file.
   - Run the relevant script to verify behavior (even if the script is a placeholder).
   - Inspect logs, adjust the change if needed, and rerun.
   - Stage and commit the final version with a clear message.

4. **Clean Build Simulation**
   - If safe in your environment, create a *copy* of the repository.
   - In the copy, remove generated files (manually or via a `clean` script).
   - Run the main script(s) again to confirm the project can build and run from a clean state.

5. **Submission Dry Run**
   - Run `git status` and ensure there are no unexpected untracked or modified files.
   - Push your work to a test or personal GitHub repository.
   - View the repository on GitHub and verify that only the expected files (no large logs or build artifacts) are present.

---

## Assessment

- [ ] Can clone and navigate a structured project repository
- [ ] Can run project scripts and capture their output in logs
- [ ] Can iterate using an edit → run → inspect → fix → commit loop
- [ ] Can confirm a project is in a clean, reproducible state before submission
- [ ] Can push changes to GitHub and verify the remote state
- [ ] Understands how this Unix + Git workflow aligns with digital design course workflows

---

## Next Steps

After completing this module, students are ready to fully participate in your digital design and verification courses, applying Unix and Git skills alongside your Verilog, simulator, and tooling modules.

