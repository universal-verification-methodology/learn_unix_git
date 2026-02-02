# Module 8 Examples

Hands-on examples for **End-to-End Project Workflow**: template clone, scripts, logs, iterative development, submission, and end-to-end flow.

---

## 1. Template (`template/`)

Practice **inspecting** a project layout after clone (or in the sample project).

**Layout**: `sample_project/` with src/, tb/, docs/, scripts/, build/, logs/.

**Try these** (from repo root):

```bash
cd module8/examples/template/sample_project
ls -la
ls src tb docs scripts build logs
find . -type f
tree .
```

See `template/README.md` for typical course layout and clone commands.

---

## 2. Scripts (`scripts/`)

Practice **running** project scripts and **redirecting** output to logs.

**Layout**: `commands_to_try.txt`. Sample script lives in `template/sample_project/scripts/run_demo.sh`.

**Try these** (from repo root):

```bash
cd module8/examples/template/sample_project
chmod +x scripts/run_demo.sh
./scripts/run_demo.sh
./scripts/run_demo.sh > logs/run.log 2>&1
cat logs/run.log
```

See `scripts/README.md` for script entry points and customization.

---

## 3. Logs (`logs/`)

Practice **inspecting** log directories and **searching** logs with tail, less, grep.

**Layout**: `sample.log` (sample log), `commands_to_try.txt`.

**Try these** (from repo root):

```bash
cd module8/examples/logs
grep ERROR sample.log
grep -i warn sample.log
tail -5 sample.log
less sample.log
```

Or use `template/sample_project/logs/run.log` after running run_demo.sh. See `logs/README.md` for cleaning outputs.

---

## 4. Iterative development (`iterative/`)

Practice the **edit → run → inspect → fix → commit** loop with small commits.

**Layout**: `commands_to_try.txt`.

**Try these** (in a Git repo):

```bash
cd ~/unix_practice/git_demo
echo "Iterative note" >> notes.md
git status
git diff
git add notes.md
git commit -m "Add iterative development note"
git log --oneline -3
```

See `iterative/README.md` for typical loop and branching for larger tasks.

---

## 5. Submission (`submission/`)

Practice **pre-submission checks** and **pushing** to GitHub.

**Layout**: `commands_to_try.txt`.

**Try these** (in a repo with remote):

```bash
git status
git log --oneline -5
git push
```

See `submission/README.md` for clean-state simulation and PR optional flow.

---

## 6. End-to-end (`end_to_end/`)

**Conceptual walkthrough**: clone → branch → implement → run script → inspect logs → commit → push → PR.

**Layout**: README only (step-by-step scenario).

**Try these**: Read `end_to_end/README.md` and follow the steps in a real or practice repo. It ties together skills from Modules 1–7.

---

## 7. Makefile basics (`makefile_basics/`)

Practice a **simple Makefile** for build, run, and clean targets.

**Layout**: `sample_project/` with Makefile, src/, tb/, build/, logs/.

**Try these** (from repo root):

```bash
cd module8/examples/makefile_basics/sample_project
make
make run
make clean
make help
```

See `makefile_basics/README.md` for target syntax and .PHONY.

---

## 8. Pre-push checks (`pre_push_checks/`)

Practice **running local checks** before pushing: status, log, and a “ready to push?” script.

**Layout**: `check_ready.sh` (chmod u+x), `commands_to_try.txt`.

**Try these** (run from inside a Git repo):

```bash
cd module8/examples/pre_push_checks
chmod u+x check_ready.sh
./check_ready.sh
```

See `pre_push_checks/README.md` for manual checklist and optional pre-push hook.
