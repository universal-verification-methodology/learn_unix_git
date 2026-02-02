# Branch rename and delete example

Practice **renaming** and **deleting** branches with `git branch -m` and `git branch -d` / `-D`.

## Layout

```
branch_rename/
├── README.md           # this file
└── commands_to_try.txt
```

## Try these (in a Git repo with a branch — e.g. create one with git checkout -b feature/old-name)

```bash
git branch
git branch -m feature/old-name feature/new-name
git branch
git checkout main
git branch -d feature/new-name
git branch -D feature/new-name
```

See `commands_to_try.txt` for a compact list.

## 1. Rename current branch

- **`git branch -m new-name`** — rename **current** branch to `new-name`.
- **`git branch -m old-name new-name`** — rename branch `old-name` to `new-name` (any branch).

Use when you want a clearer name (e.g. typo fix or convention) before pushing.

## 2. Delete branch

- **`git branch -d branch-name`** — delete branch only if it has been merged (safe).
- **`git branch -D branch-name`** — force delete (even if not merged). Use when you’re sure you don’t need that branch.

You must **not** be on the branch you’re deleting (e.g. switch to `main` first).

## 3. After rename: push

If the old branch was already pushed, push the new name and optionally delete the old one on the remote:

```bash
git push origin feature/new-name
git push origin --delete feature/old-name
```

## 4. When to use

- **Rename**: Fix branch name before first push or to match team convention.
- **Delete**: Remove merged feature branches locally; use `-d`. Use `-D` only when discarding a branch on purpose.

Use these to keep branch names consistent and clean up after merging.
