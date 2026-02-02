# Module 7 Exercises

Work through these exercises to reinforce **Advanced Git for Collaboration & IP Reuse**. Do them in your terminal; check off each when done.

Full exercise list: [docs/MODULE7.md#exercises](../docs/MODULE7.md#exercises).

---

## Exercise 1: Branch Creation and Merge

- [ ] From a clean `main` branch, create a new branch `feature/readme-update`.
- [ ] Make a small change to `README.md` (or `notes.md`) and commit it on the feature branch.
- [ ] Switch back to `main`, then merge the feature branch into `main`.
- [ ] Verify history with `git log --oneline --graph --all`.

  Use ~/unix_practice/git_demo (from Module 6 scaffold) or your own repo.

---

## Exercise 2: Intentional Merge Conflict

- [ ] In `main`, change the same line in a file (e.g. `notes.md`) and commit.
- [ ] In a new branch `feature/conflict-test`, change that same line differently and commit.
- [ ] Attempt to merge `feature/conflict-test` into `main` and observe the conflict.
- [ ] Resolve the conflict manually (edit file, remove markers), add the file, and complete the merge.

  See `module7/examples/conflicts/README.md` for conflict markers and steps.

---

## Exercise 3: Submodule Basics (If Allowed)

- [ ] Create or use a simple Git repository to add as a submodule (e.g. a small public repo).
- [ ] Run `git submodule add <url> external/example`.
- [ ] Commit the updated `.gitmodules` file and submodule pointer.
- [ ] Clone the parent repo elsewhere and run `git submodule update --init --recursive` to verify setup.

  See `module7/examples/submodules/README.md` for commands and pitfalls.

---

## Exercise 4: Using git blame

- [ ] Pick a file with several commits of history (e.g. `notes.md` in git_demo after a few commits).
- [ ] Run `git blame <file>` and identify:
  - Who last changed a specific line.
  - The commit hash associated with that change.
- [ ] Use `git show <hash>` to inspect the full commit.

---

## Exercise 5: git bisect (Conceptual or Practical)

- [ ] Choose a repository where you can simulate a regression (or follow the bisect commands on a simple condition).
- [ ] Mark a known good commit and a known bad commit.
- [ ] Use `git bisect` to step through revisions and mark each as good or bad.
- [ ] End the bisect and note the commit Git reports as the first bad commit.

  See `module7/examples/blame_bisect/README.md` for the workflow.

---

## Optional: Use the examples

All exercises can be done in ~/unix_practice/git_demo (from Module 6 scaffold) or in a repo you create. See `module7/examples/README.md` for branching, merging, conflicts, submodules, blame/bisect, and team workflow.

```bash
./scripts/module7.sh --check   # self-check
./scripts/module7.sh --demo    # print demo commands
```
