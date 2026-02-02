# Module 7 Examples

Hands-on examples for **Advanced Git for Collaboration & IP Reuse**: branching, merging, conflicts, submodules, blame/bisect, and team workflow.

---

## 1. Branching (`branching/`)

Practice **creating** and **switching** branches with `git branch` and `git checkout -b`.

**Layout**: `commands_to_try.txt`.

**Try these** (in a Git repo — e.g. ~/unix_practice/git_demo):

```bash
git branch
git checkout -b feature/readme-update
echo "Update from feature" >> notes.md
git add notes.md && git commit -m "Update notes on feature branch"
git checkout main
git log --oneline --all
```

See `branching/README.md` for why branches and course use.

---

## 2. Merging (`merging/`)

Practice **merging** a feature branch into `main` and viewing history with `--graph`.

**Layout**: `commands_to_try.txt`.

**Try these** (after creating a feature branch and committing on it):

```bash
git checkout main
git merge feature/readme-update
git log --oneline --graph --all
git branch -d feature/readme-update
```

See `merging/README.md` for fast-forward vs merge commit and keeping branches up to date.

---

## 3. Merge conflicts (`conflicts/`)

Practice **recognizing** conflict markers and **resolving** conflicts.

**Layout**: `sample_conflict.txt` (shows marker format), README with steps to create and resolve a conflict.

**Try these** (in a practice repo): Create two branches that change the same line, then merge and resolve. See `conflicts/README.md` for the exact commands and for `<<<<<<<`, `=======`, `>>>>>>>`.

---

## 4. Submodules (`submodules/`)

Practice **adding** and **updating** submodules for shared IP or libraries.

**Layout**: README, `commands_to_try.txt`, and **demo submodule** `demo_repo/` (GitHub octocat/Hello-World). This repo has a real submodule so you can practice init/update after clone.

**Try these** (after cloning learn_unix_git): run `git submodule update --init --recursive` or `./scripts/git-submodule-init.sh` to populate `demo_repo/`; then `ls demo_repo`, `cat demo_repo/README`. See `submodules/README.md` for adding your own submodule and pitfalls.

---

## 5. Blame and bisect (`blame_bisect/`)

Practice **inspecting** line history with `git blame` and **finding** the first bad commit with `git bisect`.

**Layout**: `commands_to_try.txt`.

**Try these** (in a repo with some history):

```bash
git blame notes.md
git blame -L 1,10 notes.md
git show <hash>
```

For bisect: read `blame_bisect/README.md` for the workflow (start, bad, good, test, good/bad, reset). See `commands_to_try.txt` for a compact list.

---

## 6. Team workflow (`team_workflow/`)

Practice **branch naming**, **pull request** flow, and **review** habits.

**Layout**: README only (conceptual).

**Try these**: When working with GitHub, create a branch with a clear name (e.g. `feature/counter-fix`), push it, open a PR, address review, merge. See `team_workflow/README.md` for naming conventions and PR flow.

---

## 7. Rebase (`rebase/`)

Practice **replaying commits** on top of another branch with `git rebase` (linear history).

**Layout**: `commands_to_try.txt`.

**Try these** (in a repo with a feature branch):

```bash
git checkout feature/readme-update
git rebase main
git log --oneline --graph --all
git rebase -i main
```

See `rebase/README.md` for interactive rebase and when to use force-with-lease.

---

## 8. Cherry-pick (`cherry_pick/`)

Practice **applying a single commit** from another branch with `git cherry-pick`.

**Layout**: `commands_to_try.txt`.

**Try these** (in a repo with commits on a feature branch):

```bash
git log --oneline feature/readme-update
git checkout main
git cherry-pick <commit-hash>
```

See `cherry_pick/README.md` for conflicts and cherry-pick -n (no commit).

---

## 9. Reflog (`reflog/`)

Practice **inspecting and recovering** recent history with `git reflog`.

**Layout**: `commands_to_try.txt`.

**Try these** (in a repo after checkouts, commits, or resets):

```bash
git reflog
git reflog -10
git reset --hard HEAD~1
git reflog
git reset --hard HEAD@{1}
```

See `reflog/README.md` for recovery after a bad reset.

---

## 10. Remote branches (`remote_branch/`)

Practice **listing** remote branches, **tracking**, and **pruning** stale refs.

**Layout**: `commands_to_try.txt`.

**Try these** (in a cloned repo):

```bash
git branch -a
git branch -r
git branch -vv
git fetch origin
git remote prune origin
```

See `remote_branch/README.md` for upstream and tracking.
