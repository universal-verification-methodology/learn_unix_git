# Stash example

Practice **temporarily saving** uncommitted changes with `git stash` so you can switch branches or pull without committing.

## Layout

```
stash/
├── README.md           # this file
└── commands_to_try.txt # copy-paste commands
```

## Try these (in a Git repo with some changes — e.g. ~/unix_practice/git_demo)

**1. Stash working changes**

```bash
git status
git stash
git stash push -m "WIP: notes draft"
```

Stashes **staged and unstaged** changes; working tree becomes clean. Use `-m "message"` to label the stash.

**2. List stashes**

```bash
git stash list
```

**3. Apply a stash (keep it in list)**

```bash
git stash apply
git stash apply stash@{1}
```

**4. Pop a stash (apply and remove from list)**

```bash
git stash pop
```

**5. Drop or clear stashes**

```bash
git stash drop stash@{0}
git stash clear
```

## When to use stash

- **Switch branch**: You have local changes but need to checkout another branch. Stash → checkout → work → checkout back → stash pop.
- **Pull**: You have local changes and want to pull. Stash → pull → stash pop.
- **Quick experiment**: Stash, try something, then stash pop to restore.

**Note:** Stash does **not** include untracked files by default. Use `git stash -u` to include untracked files.

See `commands_to_try.txt` for a compact list.
