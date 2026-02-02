# End-to-end example scenario

A **conceptual walkthrough** that ties together clone, branch, implement, run, inspect, commit, push, and (optionally) PR.

## Layout

This folder has no runnable repo — follow the steps in a real or practice repo.

## Example flow (conceptual)

**1. Clone course lab repository**

```bash
git clone <course-lab-url> lab1
cd lab1
```

**2. Create a new branch**

```bash
git checkout -b lab1
```

**3. Implement or modify RTL and testbench**

- Edit files in `src/` and `tb/` (or `tests/`).
- Save and keep changes logical (one feature or fix per commit when possible).

**4. Run the lab script**

```bash
./scripts/lab1.sh
# or: ./scripts/run_tests.sh > logs/tests.log 2>&1
```

**5. Inspect logs and waveforms; fix and rerun**

```bash
grep -i error logs/*.log
tail -100 logs/tests.log
# Fix issues, then rerun the script until tests pass or behavior is correct.
```

**6. Commit in logical chunks**

```bash
git add src/counter.v
git commit -m "Add counter module"
git add tb/tb_counter.v
git commit -m "Add counter testbench"
git add scripts/lab1.sh
git commit -m "Update lab1 script"
```

**7. Push branch to GitHub**

```bash
git push -u origin lab1
```

**8. Open a pull request or notify instructor**

- On GitHub: “Compare & pull request” from `lab1` to `main` (or course upstream).
- Or submit the repo link / branch name per course policy.

---

## How this uses Modules 1–7

| Step        | Skills used                                      |
|-------------|---------------------------------------------------|
| Clone       | Git (Module 6), paths (Module 1)                  |
| Branch      | Git branching (Module 7)                         |
| Edit        | Editor, project structure (Modules 5, 4)          |
| Run script  | Shell, redirection (Modules 3, 4)                 |
| Inspect logs| tail, grep, less (Modules 1, 3)                  |
| Commit      | Git add/commit, .gitignore (Module 6)             |
| Push / PR   | Git remote, team workflow (Modules 6, 7)          |

Use this flow as a template for assignments and labs in your digital design and verification courses.
