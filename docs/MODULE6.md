# Module 6: Git Basics for Course Work

**Goal**: Use Git to track changes, work with course repositories, and submit homework

---

## Navigation

[← Previous: Module 5: Editors, Projects & Archives](MODULE5.md) | [Next: Module 7: Advanced Git for Collaboration & IP Reuse →](MODULE7.md)

[↑ Back to README](../README.md)

---

## Overview

This module introduces Git as a local version control system and shows how to use it with GitHub for typical course workflows. The focus is on skills students need to safely clone starter repositories, make changes, and submit work without fear of “breaking Git.”

### What You'll Learn

- **Git Concepts**: Repository, commit, branch, working tree, staging area
- **Local Workflow**: `status`, `add`, `commit`, `log`, `diff`
- **Remotes and GitHub**: `clone`, `pull`, `push`
- **Ignoring Generated Files**: Basics of `.gitignore` for build and sim artifacts
- **Course Workflow**: Using Git for assignments and labs

### Prerequisites

Before starting this module, students should:

- [ ] Be comfortable with navigation and basic shell usage
- [ ] Understand project structure and where their code lives
- [ ] Have Git installed (`git --version` works)
- [ ] Have or be ready to create a GitHub account (for remote examples)

---

## Topics Covered

### 1. Git Mental Model

- **Key Concepts**
  - Repository: A project tracked by Git
  - Working tree: Current files on disk
  - Staging area (index): Files prepared for the next commit
  - Commit: A snapshot of changes with a message
- **Checking Git Version**
  - `git --version`
  - Confirming Git is available in the environment

### 2. Creating and Cloning Repositories

- **Initializing a New Repo**
  - `git init` in an existing project directory
  - Basic `.git/` structure (conceptual)
- **Cloning Existing Repos**
  - `git clone <url>` into a new directory
  - Typical course pattern: cloning a starter repository

### 3. Tracking Changes Locally

- **Status and Diff**
  - `git status` to see what changed
  - `git diff` to see line-by-line modifications
- **Staging and Committing**
  - `git add file` and `git add .`
  - Writing meaningful commit messages: what and why
  - `git commit -m "message"`
- **Log and History**
  - `git log` for commit history
  - `git log --oneline` for a concise view

### 4. Ignoring Generated Files

- **.gitignore Basics**
  - Creating a `.gitignore` file at the project root
  - Examples:
    - `build/`, `out/`, `*.vcd`, `*.log`
  - Checking that ignored files no longer appear in `git status`
- **Digital Design Context**
  - Ensuring simulation outputs, waveforms, and temporary build artifacts are not committed

### 5. Connecting to GitHub

- **Remotes**
  - `git remote -v` to see configured remotes
  - `origin` as the default name for the main remote
- **Pulling and Pushing**
  - `git pull` to get updates from GitHub
  - `git push` to send local commits to GitHub
- **Course Assignment Pattern**
  - Clone starter repo
  - Create commits while working
  - Push to personal fork or assignment repo

### 6. Safe Undo for Beginners

- **Undoing Unstaged Changes**
  - `git restore <file>` (or `git checkout -- <file>` in older Git)
- **Undoing Staged Changes**
  - `git restore --staged <file>`
- **Avoiding Dangerous Commands**
  - Briefly mention that `reset --hard` and force pushes are advanced tools and should be avoided for now

---

## Learning Outcomes

By the end of this module, students should be able to:

- Initialize a Git repository or clone an existing one from GitHub
- Check the status of their working tree and understand tracked vs untracked files
- Stage and commit changes with clear, meaningful messages
- Configure and use `.gitignore` to avoid committing generated files
- Pull updates from and push commits to a GitHub remote
- Safely discard local changes they do not want to keep

---

## Exercises

1. **Local Repository Basics**
   - In an existing project directory, run `git init`.
   - Create a file `notes.md` and add some text.
   - Run `git status`, then `git add notes.md`, then `git commit -m "Add notes"`.
   - Run `git log --oneline` and identify your commit.

2. **Cloning a Repository**
   - Clone a public repository (e.g., one of your course repos) with `git clone <url>`.
   - Navigate into the cloned directory and run `git status`.
   - Identify the last few commits with `git log --oneline | head`.

3. **Working with .gitignore**
   - In your local repo, create a `build/` directory and add a dummy file `build/output.tmp`.
   - Run `git status` and observe that `build/output.tmp` is untracked.
   - Create `.gitignore` with:
     - `build/`
     - `*.log`
   - Run `git status` again and confirm `build/output.tmp` no longer appears.

4. **Edit, Diff, Commit**
   - Modify an existing source file (e.g., a small change in a `.v` or `.md` file).
   - Run `git diff` to see the change.
   - Stage and commit the change with a descriptive message.

5. **Push to GitHub (If Available)**
   - Add a remote if needed: `git remote add origin <your-repo-url>`.
   - Run `git push -u origin main` (or `master`, depending on the default branch).
   - Make a small change, commit it, and push again.

6. **Safe Undo**
   - Modify a tracked file but do not stage it; then use `git restore <file>` to discard the changes.
   - Stage a change with `git add`, then unstage it using `git restore --staged <file>`.

---

## Assessment

- [ ] Can explain core Git concepts: repo, commit, branch, staging area
- [ ] Can initialize or clone a repository and inspect its history
- [ ] Can stage and commit changes with clear commit messages
- [ ] Can configure `.gitignore` to exclude build and simulation artifacts
- [ ] Can pull from and push to a GitHub remote
- [ ] Can safely undo local changes using beginner-friendly commands

---

## Next Steps

After completing this module, proceed to **Module 7: Advanced Git for Collaboration & IP Reuse** to learn about branching strategies, merging, resolving conflicts, using submodules, and applying Git in larger, collaborative digital design projects.

