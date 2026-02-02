# Merge conflicts example

Practice **recognizing** conflict markers and **resolving** merge conflicts.

## Layout

```
conflicts/
├── README.md           # this file
└── sample_conflict.txt # example of how Git marks conflicts
```

## 1. How Git marks conflicts

When two branches change the same lines, Git can’t merge automatically. It inserts markers into the file:

```
<<<<<<< HEAD
Version from current branch (e.g. main)
=======
Version from branch being merged (e.g. feature/x)
>>>>>>> feature/x
```

- **<<<<<<< HEAD** — start of your current branch’s version
- **=======** — separator
- **>>>>>>> feature/x** — end of the incoming branch’s version

## 2. Resolving a conflict

1. **Open the conflicted file** in an editor.
2. **Decide** which lines to keep (or combine both).
3. **Remove** the conflict markers (`<<<<<<<`, `=======`, `>>>>>>>`) and any text you don’t want.
4. **Save** the file.
5. **Stage** the resolved file: `git add <file>`
6. **Complete the merge**: `git commit` (Git will suggest a merge message).

## 3. Try these (create a conflict in your practice repo)

**Setup** (in ~/unix_practice/git_demo or similar):

```bash
git checkout main
echo "Line from main" > notes.md
git add notes.md && git commit -m "Change on main"
git checkout -b feature/conflict-test
echo "Line from feature" > notes.md
git add notes.md && git commit -m "Change on feature"
git checkout main
git merge feature/conflict-test
```

Git will report a conflict in `notes.md`. Open it, fix the conflict (choose or combine), remove markers, then:

```bash
git add notes.md
git commit -m "Resolve merge conflict in notes.md"
```

## 4. Digital design context

Conflicts often happen in RTL or testbench files when two people edit the same module or the same lines. Coordinate with your team (e.g. work on different files or different parts of a file) and resolve conflicts by choosing the correct logic or merging both changes by hand.

See `sample_conflict.txt` for a file that shows the marker format (for reference only; it’s not a real Git conflict).
