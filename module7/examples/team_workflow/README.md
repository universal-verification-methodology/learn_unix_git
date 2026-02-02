# Team workflow example

Practice **branch naming**, **pull requests**, and **review** habits for collaboration.

## Layout

This folder has no runnable repo — read the workflow and apply it when working with GitHub (or similar).

## 1. Branch naming

Use clear, consistent names so everyone knows what a branch is for:

| Prefix     | Use                     | Example              |
|------------|-------------------------|----------------------|
| feature/   | New feature             | feature/counter-fix  |
| bugfix/    | Bug fix                 | bugfix/parse-error   |
| lab/       | Course lab              | lab/lab2             |
| experiment/| Experiment or spike     | experiment/new-tb   |

Create branches from an up-to-date `main`: `git checkout main && git pull && git checkout -b feature/my-work`.

## 2. Pull request (PR) flow

A **pull request** proposes merging a branch into another (e.g. `feature/x` → `main`) and triggers review.

**Typical flow:**

1. **Push your branch:** `git push -u origin feature/readme-update`
2. **Open a PR** on GitHub (or GitLab, etc.): “Compare & pull request” from your branch to `main`.
3. **Describe** what changed and why. Link any issues or tasks.
4. **Address review** — others (or you) comment on the diff; you push more commits to the same branch.
5. **Merge** when approved (merge button on the PR). Optionally delete the branch after merge.

**Local equivalent of “merge after PR”:** Someone (or you) runs `git checkout main && git pull && git merge feature/readme-update` and pushes `main`. PRs add review and visibility on top of that.

## 3. Review culture

- **Review diffs** for clarity and correctness before merging.
- **Keep commits small** and messages descriptive so history and blame are useful.
- **Run tests or simulations** before pushing so the branch is in a good state for reviewers.

## 4. Course context

For assignments: clone the starter repo, create a branch per lab or assignment, commit your work, push the branch, and open a PR (if the course uses that) or push to a designated repo. Follow any course-specific branch or PR instructions.
