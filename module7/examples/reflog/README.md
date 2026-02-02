# Reflog example

Practice **inspecting and recovering** recent Git history with `git reflog` (local log of HEAD and branch moves).

## Layout

```
reflog/
├── README.md           # this file
└── commands_to_try.txt
```

## Try these (in a Git repo after some checkouts, commits, or resets)

```bash
git reflog
git reflog -10
git reflog show main
git checkout main
git reset --hard HEAD~1
git reflog
git reset --hard HEAD@{1}
```

See `commands_to_try.txt` for a compact list.

## 1. What is reflog?

**Reflog** is a local log of where **HEAD** and branch tips have been. It records checkouts, commits, resets, merges, etc. So even if you "lose" a commit (e.g. reset), you can often find it via reflog and recover it.

## 2. Commands

- **`git reflog`** — show reflog for current branch (HEAD).
- **`git reflog -n 10`** — last 10 entries.
- **`git reflog show main`** — reflog for branch `main`.
- **`HEAD@{1}`** — previous position of HEAD (e.g. before a reset). Use in `git reset --hard HEAD@{1}` to undo the reset.

## 3. Recovery

If you did **`git reset --hard HEAD~1`** and want the dropped commit back:

1. **`git reflog`** — find the hash of the commit you had before reset (e.g. `abc1234`).
2. **`git checkout -b recovered abc1234`** or **`git reset --hard abc1234`** — restore that state.

Reflog entries expire after a while (default ~90 days); use soon after a mistake.

## 4. When to use

- **Undo reset**: Restore branch tip with `git reset --hard HEAD@{1}` or the commit hash from reflog.
- **Find "lost" commit**: After a bad merge or reset, search reflog for the commit hash and checkout or cherry-pick it.

Reflog is **local only** (not pushed to remote). Use it for local recovery only.
