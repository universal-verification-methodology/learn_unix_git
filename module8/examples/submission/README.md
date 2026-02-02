# Submission example

Practice **pre-submission checks** and **pushing** work to GitHub so your repo is clean and reproducible.

## Layout

```
submission/
├── README.md           # this file
└── commands_to_try.txt # copy-paste commands
```

## 1. Pre-submission checks

- **Clean working tree** — `git status` should show no untracked or unstaged changes you care about (or commit them first).
- **Scripts run from clean state** — Optionally copy the repo, run `git clean -fdx` in the copy, then run the main script(s) to confirm the project builds and runs from a fresh clone.
- **Logs and build excluded** — Ensure `build/`, `logs/`, `*.log`, etc. are in `.gitignore` so you don’t push large or generated files.

## 2. Pushing to GitHub

```bash
git push
# or for a new branch:
git push -u origin <branch>
```

Then **verify on GitHub**: open the repo in the browser and confirm the latest commits and files are present. Check that no large logs or build artifacts appear.

## 3. Optional: Pull requests

- Open a PR from your feature branch to `main` (or to the course upstream).
- Describe what changed and link to the task or lab.
- Address review comments, then merge when approved.

## 4. Try these (in a Git repo with a remote)

```bash
git status
git log --oneline -5
git push
# On GitHub: verify files and commits
```

See `commands_to_try.txt` for a compact list.
