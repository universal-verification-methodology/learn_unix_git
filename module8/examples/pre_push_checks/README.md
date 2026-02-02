# Pre-push checks example

Practice **running local checks** before pushing: status, log, and a simple script that simulates “is my repo ready to push?”.

## Layout

```
pre_push_checks/
├── README.md       # this file
├── commands_to_try.txt
└── check_ready.sh  # script that checks status and recent log (chmod u+x)
```

## Try these (from repo root)

```bash
cd module8/examples/pre_push_checks
chmod u+x check_ready.sh
./check_ready.sh
```

Run `check_ready.sh` from **inside a Git repo** (e.g. clone of this course repo or ~/unix_practice/git_demo). It prints status and recent log; you can extend it to run tests or lint.

## 1. Manual pre-push checklist

- **`git status`** — no uncommitted changes? Commit or stash before pushing.
- **`git log --oneline -5`** — confirm your last commits are what you expect.
- **`git pull`** — get latest from remote so push won’t be rejected.
- **`git push`** — push when clean and up to date.

## 2. Script pattern

A simple “ready to push?” script can:

1. Run `git status` and exit non-zero if there are uncommitted changes.
2. Run `git log --oneline -3` so you see what will be pushed.
3. Optionally run tests or lint (e.g. `make test`, `./scripts/lint.sh`).

See `check_ready.sh` for a minimal example. Use it before `git push` or add it as a Git **pre-push hook** (advanced).

## 3. Git hooks (optional)

To run checks **automatically** before every push:

```bash
# In your repo:
cat .git/hooks/pre-push.sample  # template
# Copy to .git/hooks/pre-push and make executable; add your checks.
```

Hooks are local only (not committed). Document in README so teammates know how to set them up.

See `commands_to_try.txt` for a compact checklist.
