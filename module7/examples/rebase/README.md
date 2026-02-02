# Rebase example

Practice **replaying your commits** on top of another branch with `git rebase` to keep a linear history (e.g. before merging a feature branch).

## Layout

```
rebase/
├── README.md           # this file
└── commands_to_try.txt # copy-paste commands
```

## Try these (in a Git repo with a feature branch and some commits)

**1. Rebase feature branch onto main**

```bash
git checkout feature/readme-update
git rebase main
```

Replays your branch’s commits on top of the current `main`. Result: linear history as if you had made those commits after the latest `main`.

**2. Interactive rebase (squash, reorder, edit)**

```bash
git rebase -i main
# or rebase last N commits:
git rebase -i HEAD~3
```

Opens an editor: you can **pick**, **squash**, **reword**, **drop** commits. Use to clean up before pushing (e.g. squash "fix typo" into the previous commit).

**3. After rebase: push**

If you already pushed the branch, history changed — you need **force push** (use with care, only on your own branch):

```bash
git push --force-with-lease
```

**4. Abort rebase**

```bash
git rebase --abort
```

## When to use rebase

- **Update feature branch**: `main` moved forward; you want your branch to include the latest `main` without a merge commit. Rebase your branch onto `main`.
- **Clean history**: Interactive rebase to squash or reword commits before opening a PR.
- **Avoid**: Rebasing **shared** branches (e.g. main) or branches others are using — it rewrites history.

See `commands_to_try.txt` for a compact list.
