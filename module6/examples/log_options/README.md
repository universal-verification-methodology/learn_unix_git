# git log options example

Practice **viewing history** with different `git log` options: oneline, graph, patch, name-only, and filtering.

## Layout

```
log_options/
├── README.md           # this file
└── commands_to_try.txt
```

## Try these (in a Git repo with some commits — e.g. ~/unix_practice/git_demo or this repo)

```bash
git log
git log --oneline
git log --oneline -5
git log --oneline --graph --all
git log -p -1
git log --name-only -3
git log --oneline --since="1 week ago"
git log --oneline -- notes.md
```

See `commands_to_try.txt` for a compact list.

## 1. Common options

- **`git log --oneline`** — one line per commit (short hash + message).
- **`git log -n 5`** / **`git log -5`** — limit to last 5 commits.
- **`git log --graph --all`** — show branch structure (with --oneline for compact).
- **`git log -p`** / **`git log -p -1`** — show patch (diff) for each commit; -1 = last commit only.
- **`git log --name-only`** — list only changed file names per commit.

## 2. Filtering

- **`git log --since="1 week ago"`** — commits in last week.
- **`git log -- path`** — commits that touched `path` (e.g. `git log -- notes.md`).
- **`git log --author="Name"`** — commits by author.

## 3. When to use

- **Quick history**: `git log --oneline -10`.
- **Branch view**: `git log --oneline --graph --all`.
- **What changed in last commit**: `git log -p -1` or `git show`.
- **History of one file**: `git log --oneline -- path`.

Use these to inspect project history before merging, reviewing, or debugging.
