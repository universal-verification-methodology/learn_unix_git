# Remote branches example

Practice **listing** remote branches, **tracking** them, and **cleaning** stale remote-tracking refs.

## Layout

```
remote_branch/
├── README.md           # this file
└── commands_to_try.txt
```

## Try these (in a cloned repo with a remote, e.g. this course repo or your fork)

```bash
git branch -a
git branch -r
git remote show origin
git checkout -b local-feature origin/feature
git branch -u origin/main
git fetch origin
git branch -vv
git remote prune origin
```

See `commands_to_try.txt` for a compact list.

## 1. List branches

- **`git branch`** — local branches.
- **`git branch -r`** — remote-tracking branches (e.g. `origin/main`).
- **`git branch -a`** — local and remote.
- **`git remote show origin`** — remote URLs and branch info.

## 2. Tracking (upstream)

- **`git checkout -b local-name origin/remote-branch`** — create local branch that **tracks** the remote branch. Then `git pull` and `git push` use that remote branch by default.
- **`git branch -u origin/main`** — set current branch’s upstream to `origin/main` (so `git status` shows "ahead/behind" and push/pull know where to go).
- **`git branch -vv`** — show each branch and its upstream (tracking) branch.

## 3. Fetch and prune

- **`git fetch origin`** — update remote-tracking refs (e.g. `origin/main`) without merging. Safe; use to see what’s on the remote.
- **`git remote prune origin`** — remove remote-tracking refs for branches that no longer exist on the remote (after someone deleted them). Keeps `git branch -r` accurate.

## 4. When to use

- **See all branches**: `git branch -a` before merging or switching.
- **Track remote**: `git checkout -b feature origin/feature` when starting from a remote branch.
- **Clean refs**: `git fetch origin && git remote prune origin` to drop stale remote refs.

Use these to stay in sync with the remote and avoid pushing to the wrong branch.
