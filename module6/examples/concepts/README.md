# Git concepts example

Understand the **mental model**: repository, working tree, staging area, and commit.

## Layout

This folder has no runnable repo — read the concepts and try commands in a repo you create (e.g. with `./scripts/module6.sh --scaffold`) or in this course repo.

## Key concepts

**1. Repository**

- A **repository** (repo) is a project tracked by Git.
- Created with `git init` (new project) or `git clone <url>` (copy from remote).
- The repo lives in a hidden `.git/` directory at the project root.

**2. Working tree**

- The **working tree** is the current set of files on disk — what you see when you `ls`.
- You edit files in the working tree. Git compares this to the last commit and the staging area.

**3. Staging area (index)**

- The **staging area** is where you prepare changes for the next commit.
- `git add file` copies changes from the working tree into the staging area.
- Only staged changes are included when you run `git commit`.

**4. Commit**

- A **commit** is a snapshot of the staged files plus a message and metadata (author, date).
- `git commit -m "message"` creates a new commit from whatever is currently staged.
- Each commit has a unique hash (e.g. `a1b2c3d`) and forms a history chain.

## Flow

```
Working tree  →  git add  →  Staging area  →  git commit  →  Repository (history)
   (edit)                        (review)                    (snapshot)
```

Use `git status` to see what is modified (working tree), staged (staging area), or untracked.

## Check Git version

```bash
git --version
```

Use this to confirm Git is installed before running any Git commands.
