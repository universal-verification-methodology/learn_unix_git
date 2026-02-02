# Module 8: End-to-End Project Workflow (Unix + Git + Design Flow)

**Goal**: Combine Unix and Git skills into a complete, repeatable project workflow

---

## Navigation

[← Previous: Module 7: Advanced Git for Collaboration & IP Reuse](MODULE7.md) | [Next: N/A (Last Module) →](MODULE8.md)

[↑ Back to README](../README.md)

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

