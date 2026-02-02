# Status and diff example

Practice **inspecting** your working tree with `git status` and **viewing changes** with `git diff`.

## Layout

```
status_diff/
├── README.md           # this file
└── commands_to_try.txt # copy-paste commands
```

## Try these (in a Git repo — e.g. ~/unix_practice/git_demo or this repo)

**1. Check status**

```bash
cd ~/unix_practice/git_demo   # or cd /path/to/learn_unix_git
git status
```

You’ll see:
- **Untracked** — files Git doesn’t track yet
- **Modified** — tracked files you changed
- **Staged** — changes added with `git add` and ready to commit

**2. View line-by-line changes (working tree vs last commit)**

```bash
# After editing a file (e.g. notes.md):
git diff
```

Shows what you changed but haven’t staged. After `git add`, those changes no longer appear in `git diff` (they’re staged).

**3. View staged changes**

```bash
git add notes.md
git diff --staged
```

Shows what is staged for the next commit.

**4. Summary**

| Command              | What it shows                          |
|----------------------|----------------------------------------|
| `git status`         | Short summary: untracked, modified, staged |
| `git diff`           | Unstaged changes (working tree vs index)   |
| `git diff --staged`  | Staged changes (index vs last commit)      |

See `commands_to_try.txt` for a compact list.
