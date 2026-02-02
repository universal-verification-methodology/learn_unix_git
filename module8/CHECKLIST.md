# Module 8 Exercises

Work through these exercises to reinforce **End-to-End Project Workflow**. Do them in your terminal; check off each when done.

Full exercise list: [docs/MODULE8.md#exercises](../docs/MODULE8.md#exercises).

---

## Exercise 1: Template Clone and Inspection

- [ ] Clone a course template or example repository (or use `module8/examples/template/sample_project`).
- [ ] Run `ls` and (optionally) `tree` to map out `src/`, `tb/` or `tests/`, `scripts/`, `docs/`, and `build/`.
- [ ] Sketch or document the project layout for your own reference.

  ```bash
  cd module8/examples/template/sample_project
  ls -la
  ls src tb docs scripts build logs
  find . -type f
  tree .
  ```

---

## Exercise 2: Scripted Run + Log Capture

- [ ] Run a provided script (or the sample `scripts/run_demo.sh`) from the project root.
- [ ] Redirect its output to `logs/run.log` using `> logs/run.log 2>&1`.
- [ ] Use `grep` to find any lines containing `error` or `fail` (case-insensitive).

  ```bash
  cd module8/examples/template/sample_project
  chmod +x scripts/run_demo.sh
  ./scripts/run_demo.sh > logs/run.log 2>&1
  grep -i error logs/run.log
  grep -i fail logs/run.log
  ```

---

## Exercise 3: End-to-End Change Cycle

- [ ] Make a small, intentional change to a source or configuration file.
- [ ] Run the relevant script to verify behavior (even if the script is a placeholder).
- [ ] Inspect logs, adjust the change if needed, and rerun.
- [ ] Stage and commit the final version with a clear message.

  Use ~/unix_practice/git_demo or the sample project. Edit a file, run a script (or touch a file), inspect, then `git add` and `git commit -m "..."`.

---

## Exercise 4: Clean Build Simulation

- [ ] If safe in your environment, create a *copy* of the repository.
- [ ] In the copy, remove generated files (manually or via a `clean` script).
- [ ] Run the main script(s) again to confirm the project can build and run from a clean state.

  See `module8/examples/submission/README.md` for optional `git clean -fdx` in a copy.

---

## Exercise 5: Submission Dry Run

- [ ] Run `git status` and ensure there are no unexpected untracked or modified files.
- [ ] Push your work to a test or personal GitHub repository.
- [ ] View the repository on GitHub and verify that only the expected files (no large logs or build artifacts) are present.

  See `module8/examples/submission/README.md` for pre-submission checks.

---

## Optional: Use the examples

All exercises can be done with `module8/examples/template/sample_project` and ~/unix_practice/git_demo. See `module8/examples/README.md` for template, scripts, logs, iterative, submission, and end_to_end.

```bash
./scripts/module8.sh --check   # self-check
./scripts/module8.sh --demo    # print demo commands
```
