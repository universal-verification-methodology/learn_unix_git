# Module 6 Examples

Hands-on examples for **Git Basics for Course Work**: concepts, init/clone, status/diff, add/commit/log, .gitignore, and remote/undo.

---

## 1. Git concepts (`concepts/`)

Understand the **mental model**: repository, working tree, staging area, commit.

**Layout**: README only (no runnable repo — read and try in a repo you create or this repo).

**Try these**: Run `git --version`. Read `concepts/README.md` for repo, working tree, staging area, and commit. Use `./scripts/module6.sh --scaffold` to create a practice repo, then run `git status` there.

See `concepts/README.md` for the full flow diagram.

---

## 2. Init and clone (`init_clone/`)

Practice **creating** a repo with `git init` and **cloning** with `git clone`.

**Layout**: `commands_to_try.txt` (copy-paste commands).

**Try these** (in a new directory, not inside another repo):

```bash
./scripts/module6.sh --scaffold
cd ~/unix_practice/git_demo
git status
git log --oneline
```

Or create your own: `mkdir my_repo && cd my_repo && git init`. See `init_clone/README.md` and `commands_to_try.txt` for clone commands.

---

## 3. Status and diff (`status_diff/`)

Practice **inspecting** changes with `git status` and **viewing diffs** with `git diff`.

**Layout**: `commands_to_try.txt`.

**Try these** (in ~/unix_practice/git_demo or this repo):

```bash
cd ~/unix_practice/git_demo
git status
echo "new line" >> notes.md
git diff
git add notes.md
git diff --staged
```

See `status_diff/README.md` for status vs diff vs diff --staged.

---

## 4. Add, commit, and log (`add_commit_log/`)

Practice **staging** with `git add`, **committing** with `git commit -m`, and **history** with `git log`.

**Layout**: `commands_to_try.txt`.

**Try these** (in a Git repo):

```bash
cd ~/unix_practice/git_demo
git add notes.md
git commit -m "Add notes"
git log --oneline
```

See `add_commit_log/README.md` for workflow and message tips.

---

## 5. .gitignore (`gitignore/`)

Practice **excluding** build and generated files with `.gitignore`.

**Layout**: `sample.gitignore` (copy to repo root as `.gitignore`), `build/output.tmp` (sample ignored content).

**Try these** (in a Git repo):

```bash
cp module6/examples/gitignore/sample.gitignore /path/to/repo/.gitignore
mkdir -p build && touch build/output.tmp
git status
```

See `gitignore/README.md` for common patterns (build/, *.log, *.vcd).

---

## 6. Remote and safe undo (`remote_undo/`)

Practice **remotes** (`git remote -v`, `pull`, `push`) and **safe undo** (`git restore`, `git restore --staged`).

**Layout**: `commands_to_try.txt`.

**Try these** (in a cloned repo for remote; any repo for undo):

```bash
git remote -v
git pull
git push -u origin main
# Undo: modify a file, then:
git restore notes.md
git add notes.md && git restore --staged notes.md
```

See `remote_undo/README.md` for course workflow and what to avoid (reset --hard, force push).

---

## 7. Tags (`tags/`)

Practice **creating and listing tags** with `git tag` for releases or milestones.

**Layout**: `commands_to_try.txt`.

**Try these** (in a Git repo with at least one commit):

```bash
cd ~/unix_practice/git_demo
git tag v1.0
git tag -a v1.0 -m "Release 1.0"
git tag
git show v1.0
git push origin v1.0
```

See `tags/README.md` for lightweight vs annotated tags and when to use them.

---

## 8. Stash (`stash/`)

Practice **temporarily saving** uncommitted changes with `git stash` (switch branch or pull without committing).

**Layout**: `commands_to_try.txt`.

**Try these** (in a repo with some uncommitted changes):

```bash
cd ~/unix_practice/git_demo
echo "draft" >> notes.md
git stash
git stash list
git stash pop
```

See `stash/README.md` for stash apply vs pop and stash -u (untracked).

---

## 9. log options (`log_options/`)

Practice **viewing history** with `git log --oneline`, `--graph`, `-p`, `--name-only`, and filtering.

**Layout**: `commands_to_try.txt`.

**Try these** (in a Git repo):

```bash
git log --oneline -5
git log --oneline --graph --all
git log -p -1
git log --name-only -3
git log --oneline -- notes.md
```

See `log_options/README.md` for --since, --author, and path filter.

---

## 10. Branch rename and delete (`branch_rename/`)

Practice **renaming** branches with `git branch -m` and **deleting** with `-d` / `-D`.

**Layout**: `commands_to_try.txt`.

**Try these** (in a repo with a branch):

```bash
git branch -m feature/old-name feature/new-name
git checkout main
git branch -d feature/new-name
```

See `branch_rename/README.md` for push after rename and remote delete.
