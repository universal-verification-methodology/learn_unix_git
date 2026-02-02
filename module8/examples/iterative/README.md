# Iterative development example

Practice the **edit → run → inspect → fix → commit** loop with **small, focused** Git commits.

## Layout

```
iterative/
├── README.md           # this file
└── commands_to_try.txt # copy-paste commands
```

## 1. Small, focused commits

- **Group changes logically** — e.g. “add testbench for X”, “fix bug in Y”.
- **Avoid** one huge “everything changed” commit; it makes history and blame harder to use.

## 2. Typical loop

1. **Edit** files in `src/` and `tb/` (or config).
2. **Run** the project script: `./scripts/run_tests.sh` or equivalent.
3. **Inspect** logs: `grep -i error logs/*.log`, `tail -50 logs/run.log`.
4. **Fix** issues and rerun until behavior is correct.
5. **Stage and commit** with a clear message: `git add src/top.v && git commit -m "Fix counter reset in top"`.

Repeat for the next change.

## 3. Branching for larger tasks

- Create a branch for a bigger feature or lab: `git checkout -b lab2`.
- Implement and commit on the branch.
- Run scripts and inspect logs on the branch.
- When done, merge into `main`: `git checkout main && git merge lab2`.

## 4. Try these (in a Git repo)

Use ~/unix_practice/git_demo or the sample project. Make a small change, run a script (or touch a file), inspect, then commit:

```bash
cd ~/unix_practice/git_demo
echo "Iterative edit" >> notes.md
git status
git diff
git add notes.md
git commit -m "Add iterative development note"
git log --oneline -3
```

See `commands_to_try.txt` for a compact list.
