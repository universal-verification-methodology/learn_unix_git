# Cherry-pick example

Practice **applying a single commit** from another branch with `git cherry-pick` (copy one commit’s changes onto your current branch).

## Layout

```
cherry_pick/
├── README.md           # this file
└── commands_to_try.txt # copy-paste commands
```

## Try these (in a Git repo with multiple branches and commits)

**1. Find the commit to copy**

```bash
git log --oneline feature/readme-update
# or
git log --oneline main..feature/readme-update
```

Note the **commit hash** (e.g. `a1b2c3d`).

**2. Cherry-pick that commit onto current branch**

```bash
git checkout main
git cherry-pick a1b2c3d
```

Applies the **changes** of commit `a1b2c3d` as a **new commit** on `main`. Original commit stays on the other branch.

**3. Cherry-pick without committing (stage only)**

```bash
git cherry-pick -n a1b2c3d
# or
git cherry-pick --no-commit a1b2c3d
```

**4. Resolve conflicts**

If cherry-pick hits conflicts:

```bash
# Fix conflicts in the files, then:
git add .
git cherry-pick --continue
# or give up:
git cherry-pick --abort
```

**5. Cherry-pick a range**

```bash
git cherry-pick A^..B
```

Applies commits from A (exclusive) through B (inclusive).

## When to use cherry-pick

- **One fix on main**: A commit on a feature branch is a bugfix you want on `main` now; cherry-pick it onto `main`.
- **Backport**: Apply a fix from `main` onto an older release branch.
- **Selective apply**: You want only **some** commits from another branch, not a full merge.

See `commands_to_try.txt` for a compact list.
