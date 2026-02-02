# Module 6: Git Basics for Course Work

**Goal**: Use Git to track changes, work with course repositories, and submit homework

---

## Navigation

[← Previous: Module 5: Editors, Projects & Archives](MODULE5.md) | [Next: Module 7: Advanced Git for Collaboration & IP Reuse →](MODULE7.md)

[↑ Back to README](../README.md)

---

## Running Module 6

From the repo root:

- **Self-check**: `./scripts/module6.sh --check`
- **Demo commands**: `./scripts/module6.sh --demo`
- **Exercise scaffold**: `./scripts/module6.sh --scaffold` (creates `~/unix_practice/git_demo/` with `git init` and `notes.md`, plus an initial commit)

See [module6/README.md](../module6/README.md) for examples and quick start.

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

## Command Reference (Detailed)

This section describes the Git commands and concepts introduced in Module 6: repository basics, tracking changes, remotes, and safe undo for course work.

---

### Git Mental Model (Concepts)

- **Repository**: A **project tracked by Git**. Stored in a hidden **`.git/`** directory at the project root. Contains all history, branches, and configuration for that project.
- **Working tree**: The **current files on disk** (the directories and files you see and edit). Changes here are “unstaged” until you run `git add`.
- **Staging area (index)**: A **snapshot of what will go into the next commit**. You add changes with `git add`; the commit only includes what is staged. Lets you choose exactly which changes to include in each commit.
- **Commit**: A **snapshot** of the staged state with a **message** and **author**. Each commit has a unique hash (e.g. `a1b2c3d`). History is a chain of commits.
- **Branch**: A **named pointer** to a commit (e.g. `main` or `master`). The default branch is where new commits are added when you run `git commit`. You can create other branches for experiments or features (covered more in Module 7).
- **Tip**: Think “working tree → stage with `add` → commit with `commit`.” Remotes (e.g. GitHub) are a copy of the repo you sync with `pull` and `push`.

---

### Checking Git and Version

#### `git --version`

- **What it does**: Prints the **Git version** installed (e.g. `git version 2.34.1`). Use to confirm Git is installed and on your `PATH`.
- **How it works**: Git is a single executable; `--version` prints its version string and exits.
- **Syntax**: `git --version`
- **Tip**: If the command is not found, install Git (e.g. from git-scm.com or your package manager) and ensure it is on your `PATH`.

---

### Creating and Cloning Repositories

#### `git init` — Initialize a New Repository

- **What it does**: Creates a **new Git repository** in the current directory by creating a **`.git/`** directory. The project is then tracked; you can start adding and committing files.
- **How it works**: Writes the minimal Git metadata (config, refs, object store) into `.git/`. No commits exist yet until you make the first commit.
- **Syntax**: `git init [directory]` — with no argument, initializes the current directory.
- **Examples**:
  ```bash
  git init                    # init in current directory
  git init my_project         # create my_project/ and init there
  ```
- **Tip**: Run `git init` only once per project, usually at the project root. If the directory already has files, they remain **untracked** until you `git add` and `git commit` them.

---

#### `git clone` — Clone an Existing Repository

- **What it does**: **Copies** an existing repository from a URL (e.g. GitHub) into a **new directory** and sets up the **remote** (default name `origin`) so you can pull and push. Standard way to get a course starter repo or any Git repo.
- **How it works**: Fetches all commits and branches from the remote, creates a new directory (named from the repo or as you specify), and checks out the default branch (e.g. `main`).
- **Syntax**: `git clone <url> [directory]`
- **Examples**:
  ```bash
  git clone https://github.com/user/course-starter.git
  git clone https://github.com/user/repo.git my_folder
  git clone git@github.com:user/repo.git    # SSH URL
  ```
- **Tip**: Use **HTTPS** if you are unsure (GitHub will prompt for credentials); use **SSH** (`git@github.com:...`) if you have SSH keys set up. After cloning, `cd` into the new directory; that is your working tree.

---

### Tracking Changes Locally

#### `git status` — Show Working Tree and Staging State

- **What it does**: Shows **which files are modified, staged, or untracked** and the current branch. Your main way to see “what changed” before you add or commit.
- **How it works**: Compares the working tree and the staging area to the last commit; reports differences and lists untracked files (respecting `.gitignore`).
- **Syntax**: `git status [options]`
- **Common options**:
  - **`-s`** or **`--short`**: Short format (one or two letters per file: M modified, A added, ?? untracked, etc.).
- **Examples**:
  ```bash
  git status              # full summary
  git status -s           # compact list
  ```
- **Tip**: Run **`git status`** often. “Changes not staged” = modified on disk but not yet `git add`ed; “Changes to be committed” = staged; “Untracked” = never added. Files listed in `.gitignore` do not appear as untracked.

---

#### `git add` — Stage Changes for the Next Commit

- **What it does**: **Stages** file changes (new, modified, or deleted) into the **staging area**. The next `git commit` will include only what is staged. You can stage all changes, specific files, or directories.
- **How it works**: Updates the index (staging area) with the current content of the specified paths. New files become tracked; modified files are marked as staged; removed files are staged as deleted if you `git add` the removal.
- **Syntax**: `git add <path>...` or `git add .`
- **Examples**:
  ```bash
  git add notes.md            # stage one file
  git add src/ docs/          # stage directories
  git add .                   # stage all changes in current dir and below
  git add -u                  # stage only modified/deleted tracked files (no new files)
  ```
- **Tip**: Use **`git add file`** to stage specific files, or **`git add .`** to stage everything in the current directory tree. Review with **`git status`** and **`git diff --staged`** before committing. Do not blindly `git add .` if you have files you do not want to commit (use `.gitignore` for those).

---

#### `git commit` — Create a Commit from Staged Changes

- **What it does**: **Creates a new commit** from whatever is currently **staged**. The commit has a message (required), author, timestamp, and a unique hash. History grows by one commit on the current branch.
- **How it works**: Writes the staged snapshot into the object store, creates a commit object pointing to it and to the previous commit, and updates the current branch to point to this new commit.
- **Syntax**: `git commit -m "message"` or `git commit` (opens editor for message).
- **Common options**:
  - **`-m "message"`**: Use the given string as the **commit message** (one line). Avoid committing without a message.
  - **`-a`**: Stage all **modified tracked** files and commit (skips untracked files). Same as `git add -u` then `git commit`.
- **Examples**:
  ```bash
  git commit -m "Add notes and initial structure"
  git commit -m "Fix typo in README"
  git commit                  # open editor to write message
  git commit -am "Update script"   # stage modified tracked files and commit
  ```
- **Tip**: Write **meaningful messages**: what changed and why (e.g. “Add counter module and testbench” rather than “updates”). Good messages help you and others understand history later.

---

#### `git log` — View Commit History

- **What it does**: **Lists commits** on the current branch (newest first). Shows hash, author, date, and message. Use to see what was committed and when.
- **How it works**: Walks the commit chain from the current branch tip backward; prints each commit. Output is paged (e.g. with `less`) when long.
- **Syntax**: `git log [options] [path...]`
- **Common options**:
  - **`--oneline`**: One line per commit (short hash + message). Good for a quick overview.
  - **`-n N`** or **`-N`**: Show only the last **N** commits (e.g. `-5`).
  - **`--graph`**: Draw a text graph of branches/merges (useful with multiple branches).
- **Examples**:
  ```bash
  git log                     # full history (q to quit pager)
  git log --oneline           # short form
  git log --oneline -10       # last 10 commits
  git log --oneline --graph   # with branch graph
  ```
- **Tip**: Use **`git log --oneline`** for a quick scan; use **`git log --oneline | head`** to see only the first few commits. Press **q** to exit the pager.

---

#### `git diff` — Show Unstaged or Staged Changes

- **What it does**: Shows **line-by-line differences** between two states. Without options: **working tree vs staging area** (unstaged changes). With **`--staged`**: **staging area vs last commit** (what will go into the next commit).
- **How it works**: Compares files between the two states and prints unified diffs (additions/removals). Does not show untracked files (only modifications to tracked files).
- **Syntax**: `git diff [options] [path...]` or `git diff --staged [path...]`
- **Common options**:
  - **`--staged`** (or **`--cached`**): Compare **staging area** to last commit (what you have staged).
  - **`path`**: Limit diff to that file or directory.
- **Examples**:
  ```bash
  git diff                    # unstaged changes (working tree vs index)
  git diff --staged            # staged changes (index vs last commit)
  git diff src/main.v          # unstaged changes in one file
  git diff --staged README.md   # staged changes in README
  ```
- **Tip**: Run **`git diff`** before `git add` to see what will be staged; run **`git diff --staged`** before `git commit` to confirm what will be committed.

---

### Ignoring Generated Files

#### `.gitignore` — Tell Git to Ignore Files

- **What it does**: A **file** at the repo root named **`.gitignore`** lists **patterns** (one per line). Git will **not** show matching files as untracked and will not add them with `git add .`. Use it to exclude build output, logs, IDE files, and other generated or local-only files.
- **How it works**: Git reads `.gitignore` and skips any path that matches a pattern. Patterns are like globs: `*` matches any string, `**/` matches any directory depth (in many Git versions). Lines starting with `#` are comments.
- **Syntax**: One pattern per line; blank lines and `#` comments allowed.
- **Common patterns**:
  - **`build/`** or **`out/`**: Ignore entire directory.
  - **`*.log`**, **`*.vcd`**: Ignore by extension (logs, waveform dumps).
  - **`*.o`**, **`*.a`**: Object and archive files.
  - **`.DS_Store`**, **`*~`**: OS and editor temp files.
- **Examples**:
  ```
  build/
  out/
  *.log
  *.vcd
  *.o
  .DS_Store
  ```
- **Tip**: Add **`.gitignore`** early and commit it. Check with **`git status`** that ignored files no longer appear as untracked. For digital design, exclude simulation outputs, waveforms, and build artifacts so the repo stays small and clean.

---

### Connecting to GitHub (Remotes)

#### `git remote` — List or Configure Remotes

- **What it does**: **Lists** or **modifies** **remotes** (other repositories you fetch from or push to). After a clone, you usually have **`origin`** pointing to the repo you cloned. You add remotes when you need to push to a different URL (e.g. your fork or an assignment repo).
- **How it works**: Remotes are stored in `.git/config`; each has a name (e.g. `origin`) and a URL. `git fetch`, `git pull`, and `git push` use these names.
- **Syntax**: `git remote` (list), `git remote -v` (list with URLs), `git remote add name url`, `git remote remove name`
- **Common options**:
  - **`-v`**: Show **URLs** for fetch and push (so you can confirm where `origin` points).
- **Examples**:
  ```bash
  git remote -v                # list remotes with URLs
  git remote add origin https://github.com/you/your-repo.git
  git remote remove origin      # remove remote named origin
  ```
- **Tip**: After cloning, **`git remote -v`** shows `origin` pointing to the cloned URL. For course work, you may add `origin` to your fork or assignment repo if you did not clone it directly.

---

#### `git pull` — Fetch and Merge Updates from Remote

- **What it does**: **Fetches** new commits from the **remote** (usually `origin`) and **merges** them into your current branch. Use it to get updates from GitHub (e.g. starter code changes or feedback) before you keep working or push.
- **How it works**: Runs `git fetch` for the current branch’s upstream, then `git merge` (or `git rebase` if configured) to integrate those commits. If there are no conflicts, your branch is updated; if there are conflicts, Git asks you to resolve them (Module 7).
- **Syntax**: `git pull [remote] [branch]` — often just `git pull` (uses default remote and current branch).
- **Examples**:
  ```bash
  git pull                     # fetch and merge from origin/default branch
  git pull origin main          # fetch and merge origin/main into current branch
  ```
- **Tip**: Run **`git pull`** before you start work and before you **`git push`** so your local branch includes the latest remote changes. If you get merge conflicts, fix them in the reported files, then `git add` and `git commit` (or use the merge tool).

---

#### `git push` — Send Commits to Remote

- **What it does**: **Sends** your local commits on the current branch to the **remote** (usually `origin`). Use it to submit work to GitHub (assignment repo or fork). Fails if the remote has new commits you do not have (you must pull first) or if you do not have permission.
- **How it works**: Uploads your commit objects and updates the remote’s branch ref. The remote branch must either not exist (then it is created) or be a direct ancestor of your branch (fast-forward); otherwise Git refuses to push to avoid overwriting remote history.
- **Syntax**: `git push [remote] [branch]` or `git push -u remote branch` (set upstream so future `git pull`/`git push` use it).
- **Common options**:
  - **`-u`** (or **`--set-upstream`**): Set the **upstream** of the current branch to `remote/branch` so later you can run just `git push` and `git pull`.
- **Examples**:
  ```bash
  git push -u origin main       # first push: set upstream and push
  git push                     # later: push to upstream (origin main)
  git push origin main          # push local main to origin/main
  ```
- **Tip**: On first push to a new remote branch, use **`git push -u origin main`** (or `master` if that is your branch name) so subsequent **`git push`** and **`git pull`** work without extra arguments. If push is rejected, run **`git pull`** (resolve conflicts if any), then push again. **Do not force-push** (`git push --force`) until you understand what it does (Module 7).

---

### Safe Undo for Beginners

#### `git restore` — Restore Working Tree or Staging Area

- **What it does**: **Restores** files to a previous state. **`git restore <file>`** discards **unstaged** changes in the working tree (file reverts to the last committed or staged version). **`git restore --staged <file>`** **unstages** the file (removes it from the staging area but keeps the changes on disk). Use when you want to “undo” local edits or unstage by mistake.
- **How it works**: For unstaged restore, Git overwrites the working tree file with the version from the index (staging area) or from the last commit. For `--staged`, Git only updates the index so the file is no longer staged; the working tree is unchanged.
- **Syntax**: `git restore <file>...` or `git restore --staged <file>...`
- **Common options**:
  - **`--staged`**: Only change the **staging area** (unstage); do not touch the working tree.
  - **`--source=commit`**: Restore from a specific commit (advanced; default is index or HEAD).
- **Examples**:
  ```bash
  git restore notes.md          # discard unstaged changes to notes.md
  git restore src/             # discard unstaged changes under src/
  git restore --staged file.v   # unstage file.v (keep changes on disk)
  ```
- **Tip**: **`git restore <file>`** is **destructive** for unstaged changes (they are lost). Use only when you are sure you want to discard. For older Git (before 2.23), use **`git checkout -- <file>`** for the same “discard unstaged” effect and **`git reset HEAD <file>`** to unstage.

---

#### Older Equivalents (If Your Git Lacks `restore`)

- **Discard unstaged changes**: **`git checkout -- <file>`** — same as `git restore <file>`. The `--` separates branch names from paths.
- **Unstage**: **`git reset HEAD <file>`** — same as `git restore --staged <file>`. Removes the file from the index; working tree unchanged.
- **Tip**: Prefer **`git restore`** when available (Git 2.23+); use the above if you are on an older version.

---

#### What to Avoid for Now

- **`git reset --hard`**: Moves the branch and **discards all uncommitted changes** (working tree and staging area). Very destructive; do not use until you understand it and have a backup or are sure you want to lose local work.
- **`git push --force`** (or **`-f`**): Overwrites the remote branch with your local branch. Can erase others’ commits or break shared history. Avoid until you know why you need it (e.g. fixing a shared branch after a mistake); never force-push to a branch others rely on.
- **Tip**: For this module, stick to **`git restore`** and **`git restore --staged`** for undoing local changes. Use **`git pull`** and normal **`git push`** for syncing with GitHub; leave **reset --hard** and **force push** for later (Module 7).

---

### Summary: Common Git Workflow

| Step | Command |
|------|--------|
| See what changed | `git status` |
| See line-level diff (unstaged) | `git diff` |
| See what is staged | `git diff --staged` |
| Stage files | `git add <file>` or `git add .` |
| Commit | `git commit -m "message"` |
| View history | `git log --oneline` |
| Get updates from GitHub | `git pull` |
| Send commits to GitHub | `git push` |
| Discard unstaged changes | `git restore <file>` |
| Unstage (keep changes) | `git restore --staged <file>` |
| Ignore build/logs | Add patterns to `.gitignore` |

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

