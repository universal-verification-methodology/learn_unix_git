# Add, commit, and log example

Practice **staging** changes with `git add`, **committing** with `git commit`, and **viewing history** with `git log`.

## Layout

```
add_commit_log/
├── README.md           # this file
└── commands_to_try.txt # copy-paste commands
```

## Try these (in a Git repo — e.g. ~/unix_practice/git_demo)

**1. Stage files**

```bash
git add notes.md
git add file1.txt file2.txt
git add .
```

- `git add file` — stage one file.
- `git add .` — stage all changes in the current directory (and below). Use with care so you don’t stage unwanted files.

**2. Commit with a message**

```bash
git commit -m "Add notes"
git commit -m "Fix typo in README"
```

Write **meaningful messages**: what you changed and why. Future you (and others) will use this history.

**3. View history**

```bash
git log
git log --oneline
git log --oneline -5
```

- `git log` — full history (author, date, message).
- `git log --oneline` — one line per commit (short hash + message).

**4. Typical workflow**

1. Edit files.
2. `git status` — see what changed.
3. `git diff` — review changes.
4. `git add <files>` — stage what you want to commit.
5. `git commit -m "Clear message"` — create the commit.
6. Repeat.

See `commands_to_try.txt` for a compact list.
