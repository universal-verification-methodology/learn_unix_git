# Module 7: Advanced Git for Collaboration & IP Reuse

**Goal**: Use Git effectively in collaborative projects, including branching, merging, and submodules

---

## Navigation

[← Previous: Module 6: Git Basics for Course Work](MODULE6.md) | [Next: Module 8: End-to-End Project Workflow (Unix + Git + Design Flow) →](MODULE8.md)

[↑ Back to README](../README.md)

---

## Running Module 7

From the repo root:

- **Self-check**: `./scripts/module7.sh --check`
- **Demo commands**: `./scripts/module7.sh --demo`

Use a practice repo (e.g. `~/unix_practice/git_demo` from Module 6 scaffold) to try branching, merging, and conflicts. See [module7/README.md](../module7/README.md) for examples and quick start.

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

## Command Reference (Detailed)

This section describes the Git commands and concepts introduced in Module 7: branching, merging, conflict resolution, submodules, history inspection, and team workflows.

---

### Branching

#### `git branch` — List or Create Branches

- **What it does**: **Lists** local branches (with an asterisk next to the current one) or **creates** a new branch without switching to it. Branches are lightweight pointers to commits; creating a branch does not change your working tree.
- **How it works**: Branch names are stored in `.git/refs/heads/`. Listing reads them; creating writes a new ref pointing at the current commit (HEAD).
- **Syntax**: `git branch` (list), `git branch <name>` (create), `git branch -d <name>` (delete merged branch), `git branch -a` (list all including remotes).
- **Common options**:
  - **`-a`**: List **all** branches (local and remote-tracking).
  - **`-d name`**: **Delete** a branch that has been merged (safe delete).
  - **`-D name`**: Force-delete a branch (use with care).
- **Examples**:
  ```bash
  git branch                    # list local branches
  git branch feature/counter    # create branch (stay on current)
  git branch -a                 # list all (local + remotes)
  git branch -d feature/done    # delete merged branch
  ```
- **Tip**: Creating with **`git branch name`** does **not** switch you to that branch; use **`git checkout name`** or **`git switch name`** to switch. Use **`git checkout -b name`** or **`git switch -c name`** to create and switch in one step.

---

#### `git checkout` — Switch Branches or Create and Switch

- **What it does**: **Switches** the working tree to a different branch (or commit). With **`-b name`**, **creates** a new branch and switches to it in one step. Also used for restoring files (see Module 6); here we focus on branch switching.
- **How it works**: Updates HEAD to point at the chosen branch, then updates the working tree and index to match that commit. Uncommitted changes may block the switch if they would be overwritten; Git will ask you to commit or stash.
- **Syntax**: `git checkout <branch>` (switch), `git checkout -b <new-branch>` (create and switch), `git checkout -b <new-branch> <start-point>` (create from another branch or commit).
- **Examples**:
  ```bash
  git checkout main             # switch to main
  git checkout feature/x        # switch to feature/x
  git checkout -b feature/readme # create feature/readme and switch to it
  git checkout -b hotfix main    # create hotfix from main and switch
  ```
- **Tip**: Use **`git checkout -b feature/name`** when starting a new feature so you are on the new branch immediately. Ensure you are on the right base (e.g. `main`) before creating the branch so it branches from the intended commit.

---

#### `git switch` — Switch Branches (Modern Alternative)

- **What it does**: **Switches** to an existing branch, or with **`-c name`** **creates** a new branch and switches to it. Same idea as `git checkout` for branch operations but with a clearer, branch-only command (Git 2.23+).
- **How it works**: Same as `git checkout <branch>`: updates HEAD and the working tree to the target branch.
- **Syntax**: `git switch <branch>` (switch), `git switch -c <new-branch>` (create and switch).
- **Examples**:
  ```bash
  git switch main               # switch to main
  git switch -c feature/readme  # create and switch to feature/readme
  ```
- **Tip**: Prefer **`git switch`** and **`git switch -c`** for branch operations when your Git supports it; use **`git checkout`** for restoring files (or **`git restore`** as in Module 6).

---

### Merging

#### `git merge` — Merge Another Branch into the Current Branch

- **What it does**: **Integrates** commits from another branch into the **current** branch. Creates either a **fast-forward** (just moving the branch pointer) or a **merge commit** (a new commit that has two parents). Use after you finish work on a feature branch and want to bring it into `main`.
- **How it works**: Git finds the common ancestor of the current branch and the branch you are merging. If the current branch has not moved since that ancestor, it **fast-forwards** (pointer moves to the tip of the merged branch). Otherwise it creates a **merge commit** that combines both histories. If the same lines were changed in both branches, a **merge conflict** occurs and you must resolve it.
- **Syntax**: `git merge <branch>` — merge `<branch>` into the branch you are currently on.
- **Common options**:
  - **`--no-ff`**: Always create a **merge commit** even when a fast-forward is possible (useful for keeping an explicit “merge feature X” in history).
  - **`-m "message"`**: Use this message for the merge commit (otherwise a default is generated).
- **Examples**:
  ```bash
  git checkout main             # switch to main
  git merge feature/readme      # merge feature/readme into main
  git merge feature/x -m "Merge feature X"
  git merge --no-ff feature/y   # force a merge commit
  ```
- **Tip**: **Always merge from the branch you want to update.** To get feature work into `main`, switch to **`main`** and run **`git merge feature/name`**. To bring latest `main` into your feature branch, switch to the feature branch and run **`git merge main`** (or pull main first, then merge).

---

#### Fast-Forward vs Merge Commit (Concepts)

- **Fast-forward**: When the current branch has no new commits since it diverged from the branch you are merging, Git simply **moves the branch pointer** forward to the tip of the merged branch. No new commit is created; history stays linear.
- **Merge commit**: When both branches have new commits, Git creates a **new commit** with two parents (the previous tip of the current branch and the tip of the merged branch). History shows a “merge” and preserves both lines of development.
- **Tip**: Use **`git log --oneline --graph --all`** to visualize branches and merges. Use **`--no-ff`** if you want every merge to appear as an explicit merge commit (e.g. for audit trails).

---

#### Keeping Branches Up to Date

- **Pattern**: Before merging your feature branch into `main`, pull the latest **`main`** and merge it into **your feature branch**. That way your feature branch includes recent changes (e.g. from teammates) and the final merge into `main` is simpler.
- **Steps**:
  1. On your feature branch: **`git fetch origin`** (optional but good), then **`git merge main`** (or **`git pull origin main`** to fetch and merge in one step).
  2. Resolve any conflicts, commit the merge.
  3. Switch to **`main`** and **`git merge feature/your-branch`**.
- **Tip**: Doing **`git pull origin main`** while on your feature branch keeps the feature branch in sync with `main` and reduces surprise conflicts when you open a PR or merge.

---

### Merge Conflicts

#### Understanding Conflict Markers

- **What they are**: When Git cannot automatically combine two versions of the same file (because both branches changed the same lines), it inserts **conflict markers** into the file and stops the merge. You must edit the file to choose the final content and remove the markers.
- **Markers**:
  - **`<<<<<<< HEAD`**: Start of **your** (current branch) version.
  - **`=======`**: Separator between the two versions.
  - **`>>>>>>> branch-name`**: End of the **incoming** (merged branch) version.
- **How to resolve**: Open the file, decide which lines to keep (yours, theirs, or a combination), delete the conflict markers and any unwanted block, save, then **`git add <file>`** and **`git commit`** (no `-m` needed; Git uses a default merge message).
- **Tip**: Search for **`<<<<<<<`** in the file to find all conflict blocks. After resolving, run **`git status`** to see that the file is staged; then **`git commit`** completes the merge.

---

#### Aborting a Merge

- **What it does**: If you want to cancel an in-progress merge (e.g. conflicts are too messy and you want to start over), **`git merge --abort`** restores the state before the merge and leaves you on the branch you were on.
- **Syntax**: `git merge --abort`
- **Tip**: Use **`git merge --abort`** when you are in the middle of a conflicted merge and want to back out. After resolving conflicts, do **not** abort—finish with **`git add`** and **`git commit`**.

---

### Submodules

#### What Submodules Are

- **Concept**: A **submodule** is a **separate Git repository** that is recorded inside your project at a specific path. The parent repo stores only the **commit** the submodule is pinned to (a pointer), not the submodule’s full history. Typical uses: shared IP blocks, verification libraries, or tool trees that are maintained in their own repos.
- **Important**: Cloning the parent repo does **not** automatically fill the submodule directory with files. You must run **`git submodule update --init`** (or clone with **`--recurse-submodules`**) to fetch and check out the submodule at the recorded commit.

---

#### `git submodule add` — Add a Submodule

- **What it does**: **Adds** another Git repository as a **submodule** at a given path. Clones the repo into that path and records the current commit in the parent repo. Creates or updates **`.gitmodules`** and the submodule entry in the index.
- **How it works**: Clones the submodule repo into the specified directory and writes its URL and path into `.gitmodules`. The parent repo’s index stores the **commit hash** of the submodule (the “pointer”); that is what gets committed.
- **Syntax**: `git submodule add <url> [path]`
- **Examples**:
  ```bash
  git submodule add https://github.com/org/ip-lib.git external/ip-lib
  git submodule add git@github.com:org/verif-lib.git libs/verif
  ```
- **Tip**: Choose a path that fits your project layout (e.g. **`external/`** or **`libs/`**). After adding, **commit** the new `.gitmodules` file and the submodule path in the parent repo so others get the submodule when they clone.

---

#### `git submodule update --init --recursive` — Initialize and Update Submodules

- **What it does**: **Initializes** submodules (reads `.gitmodules` and sets up the submodule config) and **checks out** the commit recorded in the parent repo. With **`--recursive`**, does the same for any nested submodules. Run this after **cloning** a repo that has submodules, or when the parent repo’s submodule pointer has changed.
- **How it works**: For each submodule listed in `.gitmodules`, clones the submodule repo (if not already present) and checks out the commit stored in the parent’s index. Does not pull the latest from the submodule’s remote—only restores the pinned commit.
- **Syntax**: `git submodule update --init [--recursive]`
- **Examples**:
  ```bash
  git submodule update --init --recursive   # after clone
  git submodule update --init              # init and update (no nested)
  git submodule update                     # after parent pull, sync submodule to new pointer
  ```
- **Tip**: After **`git clone <repo>`**, if the repo has submodules, run **`git submodule update --init --recursive`** (or clone with **`git clone --recurse-submodules <repo>`**) so submodule directories are populated. Otherwise you will see empty or missing submodule paths.

---

#### `git submodule status` — Show Submodule Commit Status

- **What it does**: **Lists** each submodule and the commit it is currently checked out at. A leading **`-`** means the submodule is not initialized; **`+`** means the submodule is at a different commit than the one recorded in the parent (e.g. you advanced it and did not update the parent).
- **Syntax**: `git submodule status`
- **Tip**: Run **`git submodule status`** to see if submodules are initialized and whether they match the parent’s recorded commits. If you update a submodule (e.g. `cd submodule && git pull`), commit the updated pointer in the **parent** repo so the team gets the same submodule commit.

---

#### Updating a Submodule to a Newer Version

- **Steps**:
  1. **`cd path/to/submodule`**
  2. **`git fetch`** (optional), then **`git checkout main`** (or the branch you use) and **`git pull`** (or **`git checkout <commit>`** to pin to a specific commit).
  3. **`cd`** back to the parent repo root.
  4. **`git add path/to/submodule`** (or **`git add .`**) and **`git commit -m "Update submodule to ..."`** so the parent records the new commit.
- **Tip**: If you only run **`git pull`** inside the submodule and do **not** commit the parent repo, others will still get the old submodule commit when they run **`git submodule update`**. Always **commit the parent** after updating a submodule pointer.

---

### Inspecting and Debugging History

#### `git blame` — Show Who Last Modified Each Line

- **What it does**: **Annotates** each line of a file with the **commit hash**, **author**, and **date** of the last change to that line. Use to see “who changed this” and “when,” and to open the commit with **`git show`** for full context.
- **How it works**: Walks the history of the file and, for each line, finds the commit that last introduced or changed it.
- **Syntax**: `git blame [options] <file>`
- **Common options**:
  - **`-L start,end`**: Only blame **lines** `start` through `end`.
  - **`-w`**: Ignore **whitespace** changes when attributing lines.
- **Examples**:
  ```bash
  git blame src/counter.v       # full file
  git blame -L 10,30 src/counter.v   # lines 10–30
  git blame -w README.md        # ignore whitespace
  ```
- **Tip**: Use **`git blame file`** to find the commit that introduced a buggy or surprising line; then **`git show <hash>`** to see the full commit and message. In digital design, this helps trace when a signal or block was added or changed.

---

#### `git show` — Show a Commit or Object

- **What it does**: **Displays** a single commit: message, author, date, and **diff** of changes. Use after **`git blame`** or **`git log`** to inspect a specific commit.
- **How it works**: Looks up the commit (by hash or ref) and prints its metadata and patch.
- **Syntax**: `git show [commit]`
- **Examples**:
  ```bash
  git show a1b2c3d              # show commit a1b2c3d
  git show HEAD                 # show latest commit
  git show a1b2c3d -- path/to/file   # show only changes to that file in that commit
  ```
- **Tip**: **`git show <hash>`** is your friend after **`git blame`** or **`git log -p`** when you need the full context of a change.

---

#### `git bisect` — Find the Commit That Introduced a Bug

- **What it does**: **Binary search** through commit history to find the **first commit** that introduced a given bug. You mark one commit as “good” (bug absent) and one as “bad” (bug present); Git checks out a middle commit and you say good or bad until it narrows to the single bad commit.
- **How it works**: Git repeatedly checks out a commit midway between the current good and bad range; you run your test (e.g. run simulation, run tests) and mark it good or bad. Git bisect reduces the range until only one commit remains—the first bad one.
- **Syntax**: `git bisect start` → then **`git bisect good <commit>`** and **`git bisect bad <commit>`** (or **`good`**/ **`bad`** for current commit), then repeatedly **`git bisect good`** or **`git bisect bad`** until Git reports the first bad commit. Finish with **`git bisect reset`**.
- **Workflow**:
  ```bash
  git bisect start
  git bisect bad                 # current commit is bad (e.g. HEAD)
  git bisect good abc1234         # commit abc1234 is known good
  # Git checks out a middle commit; run your test (e.g. make sim)
  git bisect good                 # or: git bisect bad
  # repeat until Git prints "first bad commit is ..."
  git bisect reset                # return to branch tip
  ```
- **Automation**: You can run a script that exits 0 (good) or non-zero (bad): **`git bisect run ./test_script.sh`**. Git will automatically mark commits and narrow down.
- **Tip**: Use **bisect** when a test or simulation **used to pass** and **now fails** and you want to know which commit broke it. Mark the **oldest known good** and **newest known bad**; bisect does the rest. Great for RTL or testbench regressions.

---

### Team and GitHub Workflows

#### Branch Naming Conventions

- **Common prefixes**: **`feature/`** (new feature), **`bugfix/`** or **`fix/`** (bug fix), **`lab1/`**, **`lab2/`** (course labs), **`experiment/`** (tryouts). Use lowercase and hyphens: **`feature/counter-module`**, **`bugfix/reset-timing`**.
- **Tip**: Agree with your team or course on a convention so branch names are predictable and easy to filter (e.g. in PR lists).

---

#### Pull Request (PR) Flow (Concept)

- **What it is**: A **pull request** (GitHub) or **merge request** (GitLab) is a **proposal** to merge a branch into another (usually into `main`). It shows the diff, allows discussion and review, and then merge (often via the web UI).
- **Typical steps**:
  1. Work on a **feature branch** locally; **commit** and **push** the branch to GitHub (**`git push -u origin feature/name`**).
  2. On GitHub, open a **Pull Request** from **`feature/name`** into **`main`** (or the target branch).
  3. Reviewers comment on the diff; you **push more commits** to the same branch to address comments (no new PR needed).
  4. When approved, **merge** the PR (via GitHub’s “Merge” button; optionally delete the branch after merge).
  5. Locally, **`git checkout main`** and **`git pull`** to get the merged result.
- **Tip**: Keep PRs **small and focused** so review is manageable. Use descriptive branch names and commit messages so the PR summary is clear.

---

#### `git fetch` — Download Objects Without Merging

- **What it does**: **Downloads** new commits and branches from the **remote** (e.g. `origin`) and updates your **remote-tracking** branches (e.g. `origin/main`). Does **not** change your working tree or current branch. Use to see what is on the remote before merging or pulling.
- **How it works**: Contacts the remote, gets new objects and refs, and updates refs like `refs/remotes/origin/main`. Your local `main` is unchanged until you merge or pull.
- **Syntax**: `git fetch [remote]` or `git fetch origin`
- **Examples**:
  ```bash
  git fetch origin              # update all remote-tracking branches for origin
  git fetch origin main          # fetch only origin/main
  ```
- **Tip**: Use **`git fetch`** then **`git log HEAD..origin/main`** to see what commits are on the remote that you do not have. Then **`git merge origin/main`** (or **`git pull`**) to integrate. **`git pull`** is effectively **fetch + merge** in one step.

---

### Summary: Branching, Merge, and Submodule Patterns

| Goal | Command or step |
|------|------------------|
| List branches | `git branch` or `git branch -a` |
| Create and switch to branch | `git checkout -b feature/name` or `git switch -c feature/name` |
| Switch branch | `git checkout name` or `git switch name` |
| Merge branch into current | `git merge feature/name` (you must be on target branch, e.g. main) |
| Resolve conflict | Edit file, remove markers, `git add <file>`, `git commit` |
| Abort merge | `git merge --abort` |
| Add submodule | `git submodule add <url> path` |
| After clone (with submodules) | `git submodule update --init --recursive` |
| Submodule status | `git submodule status` |
| Who changed a line | `git blame <file>`; then `git show <hash>` |
| Find first bad commit | `git bisect start` → `good` / `bad` → … → `git bisect reset` |

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

