# Merging example

Practice **merging** a feature branch into `main` and understanding **fast-forward** vs **merge commit**.

## Layout

```
merging/
├── README.md           # this file
└── commands_to_try.txt # copy-paste commands
```

## Try these (in a Git repo with a feature branch)

**1. Merge a feature branch into main**

```bash
git checkout main
git merge feature/readme-update
```

If the feature branch is a direct descendant of `main` (no other commits on `main` since the branch was created), Git does a **fast-forward**: `main` simply moves to the tip of the feature branch. No merge commit.

**2. If main has new commits**

If you (or someone else) committed on `main` after creating the feature branch, Git creates a **merge commit** that has two parents. You may be prompted for a merge message.

**3. View history with branches**

```bash
git log --oneline --graph --all
```

Shows branch structure and merge commits.

**4. Delete the branch after merge (optional)**

```bash
git branch -d feature/readme-update
```

Removes the branch pointer; the commits remain in history.

**5. Keeping your branch up to date**

Before merging your feature back, pull latest `main` and merge it into your branch to reduce conflicts:

```bash
git checkout feature/readme-update
git pull origin main
# resolve any conflicts, then:
git checkout main
git merge feature/readme-update
```

See `commands_to_try.txt` for a compact list.
