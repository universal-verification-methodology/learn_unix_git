# Branching example

Practice **creating** and **switching** branches with `git branch` and `git checkout -b`.

## Layout

```
branching/
├── README.md           # this file
└── commands_to_try.txt # copy-paste commands
```

## Try these (in a Git repo — e.g. ~/unix_practice/git_demo)

**1. List branches**

```bash
git branch
```

The current branch has a `*`. Usually you start on `main` or `master`.

**2. Create and switch to a new branch**

```bash
git checkout -b feature/readme-update
```

Creates branch `feature/readme-update` and switches to it. Equivalent to `git branch feature/readme-update` then `git checkout feature/readme-update`.

**3. Make a change and commit on the branch**

```bash
echo "Updated by feature branch" >> notes.md
git add notes.md
git commit -m "Update notes on feature branch"
```

**4. Switch back to main**

```bash
git checkout main
```

Your working tree updates to the last commit on `main`. The change you made is only on `feature/readme-update` until you merge.

**5. Why branches?**

- **Isolate work** — experiments or features don’t touch `main` until they’re ready.
- **Keep main stable** — only merge when changes are tested or reviewed.
- **Course use** — one branch per lab or assignment (e.g. `lab2`, `feature/counter`).

See `commands_to_try.txt` for a compact list.
