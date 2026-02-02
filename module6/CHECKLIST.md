# Module 6 Exercises

Work through these exercises to reinforce **Git Basics for Course Work**. Do them in your terminal; check off each when done.

Full exercise list: [docs/MODULE6.md#exercises](../docs/MODULE6.md#exercises).

---

## Exercise 1: Local Repository Basics

- [ ] In an existing project directory, run `git init`.
- [ ] Create a file `notes.md` and add some text.
- [ ] Run `git status`, then `git add notes.md`, then `git commit -m "Add notes"`.
- [ ] Run `git log --oneline` and identify your commit.

  Use the scaffold: `./scripts/module6.sh --scaffold` creates `~/unix_practice/git_demo` with `git init` and `notes.md`; you can add and commit there, or create a new dir and run `git init` yourself.

---

## Exercise 2: Cloning a Repository

- [ ] Clone a public repository (e.g. one of your course repos) with `git clone <url>`.
- [ ] Navigate into the cloned directory and run `git status`.
- [ ] Identify the last few commits with `git log --oneline | head`.

---

## Exercise 3: Working with .gitignore

- [ ] In your local repo, create a `build/` directory and add a dummy file `build/output.tmp`.
- [ ] Run `git status` and observe that `build/output.tmp` is untracked.
- [ ] Create `.gitignore` with:
  - `build/`
  - `*.log`
- [ ] Run `git status` again and confirm `build/output.tmp` no longer appears.

  You can copy `module6/examples/gitignore/sample.gitignore` to your repo as `.gitignore`.

---

## Exercise 4: Edit, Diff, Commit

- [ ] Modify an existing source file (e.g. a small change in a `.v` or `.md` file).
- [ ] Run `git diff` to see the change.
- [ ] Stage and commit the change with a descriptive message.

---

## Exercise 5: Push to GitHub (If Available)

- [ ] Add a remote if needed: `git remote add origin <your-repo-url>`.
- [ ] Run `git push -u origin main` (or `master`, depending on the default branch).
- [ ] Make a small change, commit it, and push again.

---

## Exercise 6: Safe Undo

- [ ] Modify a tracked file but do not stage it; then use `git restore <file>` to discard the changes.
- [ ] Stage a change with `git add`, then unstage it using `git restore --staged <file>`.

  Try in `~/unix_practice/git_demo`: edit `notes.md`, run `git restore notes.md`; then `git add notes.md`, run `git restore --staged notes.md`.

---

## Optional: Use the scaffold

To get a practice repo without creating it by hand:

```bash
./scripts/module6.sh --scaffold
cd ~/unix_practice/git_demo
git status
git log --oneline
```

Then do the exercises above in that directory.
