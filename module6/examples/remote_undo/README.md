# Remote and safe undo example

Practice **viewing remotes** (`git remote -v`), **pull** and **push**, and **safely undoing** local changes with `git restore`.

## Layout

```
remote_undo/
├── README.md           # this file
└── commands_to_try.txt # copy-paste commands
```

## 1. Remotes (remote -v, pull, push)

**View remotes**

```bash
git remote -v
```

Shows the remote names and URLs (e.g. `origin` → GitHub repo).

**Pull updates**

```bash
git pull
```

Fetches and merges changes from the default remote (e.g. `origin`) into your current branch. Run this before you start work if others push to the same repo.

**Push your commits**

```bash
git push
git push -u origin main
```

Sends your local commits to the remote. Use `-u origin main` once to set the upstream so later you can just `git push`.

**Course assignment pattern**

1. Clone starter repo (or your fork).
2. Edit, add, commit locally.
3. Push to your fork or assignment repo when ready.

## 2. Safe undo (restore)

**Discard unstaged changes in a file**

```bash
git restore notes.md
```

Reverts `notes.md` to the last committed version. **Unstaged** changes are lost. Use when you want to throw away local edits in that file.

**Unstage a file (keep changes in working tree)**

```bash
git add notes.md
git restore --staged notes.md
```

Removes `notes.md` from the staging area; your edits remain in the file. Use when you staged the wrong file or want to edit more before committing.

**Avoid for now**

- `git reset --hard` — discards all local changes; easy to lose work.
- Force push (`git push --force`) — can overwrite remote history; use only when you know what you’re doing.

See `commands_to_try.txt` for a compact list.
