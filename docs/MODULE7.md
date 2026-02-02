# Module 7: Advanced Git for Collaboration & IP Reuse

**Goal**: Use Git effectively in collaborative projects, including branching, merging, and submodules

---

## Navigation

[← Previous: Module 6: Git Basics for Course Work](MODULE6.md) | [Next: Module 8: End-to-End Project Workflow (Unix + Git + Design Flow) →](MODULE8.md)

[↑ Back to README](../README.md)

---

## Overview

This module builds on Git basics to cover the workflows used in real digital design projects: working on branches, merging and resolving conflicts, using submodules for shared IP, and inspecting history to debug issues. The focus is on practical patterns that students can apply to course projects and small teams.

### What You'll Learn

- **Branching and Merging**: Creating feature branches and integrating changes
- **Merge Conflicts**: Understanding, resolving, and avoiding common pitfalls
- **Submodules**: Using Git submodules to manage shared IP or verification libraries
- **History Inspection**: Using `blame` and `bisect` to track down bugs
- **Team Workflows**: Branch naming, code review, and pull request basics

### Prerequisites

Before starting this module, students should:

- [ ] Be comfortable with the basic Git workflow (`status`, `add`, `commit`, `log`, `diff`)
- [ ] Have completed at least a few commits in a repository
- [ ] Understand `.gitignore` and basic remote usage (`clone`, `pull`, `push`)

---

## Topics Covered

### 1. Branching Strategies

- **Why Branches?**
  - Isolating work on features or experiments
  - Keeping `main` (or `master`) stable
- **Basic Branch Commands**
  - Creating a branch: `git branch feature/x` or `git checkout -b feature/x`
  - Switching branches: `git checkout feature/x`
  - Listing branches: `git branch`
- **Course Context**
  - Using branches per lab, assignment, or experiment

### 2. Merging and Fast-Forwards

- **Merging Branches**
  - `git merge feature/x` into `main`
  - Understanding fast-forward vs merge commits (conceptual)
- **Keeping Branches Up to Date**
  - Pulling latest `main` and merging into your feature branch
  - Simple workflows to stay in sync with upstream changes

### 3. Resolving Merge Conflicts

- **Understanding Conflicts**
  - How Git marks conflicts in files (`<<<<<<<`, `=======`, `>>>>>>>`)
  - Why they happen (overlapping changes)
- **Resolving a Conflict**
  - Open the conflicted file in an editor
  - Decide which lines to keep and clean up markers
  - Mark conflict as resolved: `git add <file>` followed by `git commit`
- **Digital Design Context**
  - Conflicts on RTL or testbench files and how to coordinate within a team

### 4. Submodules for Shared IP and Libraries

- **What Are Submodules?**
  - A way to include another Git repository inside your project
  - Common use: shared IP blocks, verification libraries, or tool trees
- **Basic Submodule Commands**
  - Adding: `git submodule add <url> path/to/submodule`
  - Initializing and updating: `git submodule update --init --recursive`
  - Updating to a newer commit: `cd submodule && git pull`, then commit parent repo
- **Common Pitfalls**
  - Forgetting to run `git submodule update --init`
  - Committing changes in the submodule without updating the parent repo pointer

### 5. Inspecting and Debugging History

- **Blame**
  - `git blame file` to see who last modified each line
  - Use cases: understanding why a change was made
- **Bisect**
  - `git bisect` to find which commit introduced a bug
  - Conceptual workflow:
    - Mark a good commit
    - Mark a bad commit
    - Test revisions until Git finds the first bad commit
- **Digital Design Use Cases**
  - Finding when a regression entered RTL or a testbench
  - Identifying which change broke a once-passing simulation

### 6. Team and GitHub Workflows

- **Branch Naming and Conventions**
  - Examples: `feature/`, `bugfix/`, `labX/`, `experiment/`
- **Pull Requests (PRs)**
  - Concept: propose changes from a branch for review
  - Typical flow:
    - Push branch to GitHub
    - Open PR
    - Address review comments
    - Merge when approved
- **Review Culture**
  - Reviewing diffs for clarity and correctness
  - Keeping commits small and messages descriptive

---

## Learning Outcomes

By the end of this module, students should be able to:

- Create and work on feature branches safely
- Merge branches back into `main` and handle simple conflicts
- Use Git submodules to include and update external IP or libraries
- Use `git blame` to understand the history of a file line-by-line
- Understand the basic `git bisect` workflow for locating regressions
- Follow a simple branch-and-PR workflow when collaborating via GitHub

---

## Exercises

1. **Branch Creation and Merge**
   - From a clean `main` branch, create a new branch `feature/readme-update`.
   - Make a small change to `README.md` and commit it on the feature branch.
   - Switch back to `main`, then merge the feature branch into `main`.
   - Verify history with `git log --oneline --graph --all`.

2. **Intentional Merge Conflict**
   - In `main`, change the same line in a file (e.g., `notes.md`) and commit.
   - In a new branch `feature/conflict-test`, change that same line differently and commit.
   - Attempt to merge `feature/conflict-test` into `main` and observe the conflict.
   - Resolve the conflict manually, add the file, and complete the merge.

3. **Submodule Basics (If Allowed in Your Environment)**
   - Create or use a simple Git repository to add as a submodule (e.g., a small example repo).
   - Run `git submodule add <url> external/example`.
   - Commit the updated `.gitmodules` file and submodule pointer.
   - Clone the parent repo elsewhere and run `git submodule update --init --recursive` to verify setup.

4. **Using git blame**
   - Pick a file with several commits of history.
   - Run `git blame <file>` and identify:
     - Who last changed a specific line.
     - The commit hash associated with that change.
   - Use `git show <hash>` to inspect the full commit.

5. **git bisect (Conceptual or Practical)**
   - Choose a repository where you can simulate a regression (or simply follow the `git bisect` commands on a simple condition).
   - Mark a known good commit and a known bad commit.
   - Use `git bisect` to step through revisions and mark each as good or bad.
   - End the bisect and note the commit Git reports as the first bad commit.

---

## Assessment

- [ ] Can create, switch, and list branches
- [ ] Can merge a feature branch into `main` and resolve basic conflicts
- [ ] Can add, initialize, and update a submodule (or explain the process clearly)
- [ ] Can use `git blame` to identify when and where a line changed
- [ ] Understands the purpose and basic flow of `git bisect`
- [ ] Can describe and follow a simple branch + PR workflow for collaboration

---

## Next Steps

After completing this module, proceed to **Module 8: End-to-End Project Workflow (Unix + Git + Design Flow)** to bring all Unix and Git skills together in a realistic, scripted workflow that mirrors your digital design and verification courses.

