# Module 2 Exercises

Work through these exercises to reinforce **Filesystem, Permissions & Environment**. Do them in your terminal; check off each when done.

Full exercise list: [docs/MODULE2.md#exercises](../docs/MODULE2.md#exercises).

---

## Exercise 1: Inspecting File Types

- [ ] In your home directory, run `ls -l` and identify:
  - At least one **regular file** (first column starts with `-`)
  - At least one **directory** (first column starts with `d`)
  - Any **symbolic links** (first column starts with `l`), if present

  ```bash
  cd ~
  ls -l
  ```

  You can also use the example: `cd module2/examples/file_types && ls -l`.

---

## Exercise 2: Permission Practice

- [ ] Create a script `hello.sh` that prints a message (or use the one in `module2/examples/permissions/`).
- [ ] Use `ls -l hello.sh` to confirm it is **not** executable (no `x` in the user column).
- [ ] Run `chmod u+x hello.sh` and confirm the `x` bit appears for the user.
- [ ] Execute `./hello.sh` and verify it runs.

  ```bash
  # Option A: use the example script
  cd module2/examples/permissions
  ls -l hello.sh
  chmod u+x hello.sh
  ls -l hello.sh
  ./hello.sh

  # Option B: create your own in ~/unix_practice
  cd ~/unix_practice
  echo '#!/usr/bin/env bash' > hello.sh
  echo 'echo "Hello!"' >> hello.sh
  chmod u+x hello.sh
  ./hello.sh
  ```

---

## Exercise 3: Exploring Ownership

- [ ] Run `ls -l` in a project directory and note the **owner** and **group** columns.
- [ ] Identify which files you own and which might belong to another user (if any).

  ```bash
  cd ~/unix_practice
  ls -l
  # Or: cd /path/to/learn_unix_git && ls -l module2/examples
  ```

---

## Exercise 4: PATH and Command Resolution

- [ ] Run `echo $PATH` and identify at least **three** directories in the list.
- [ ] Use `which bash`, `which python`, and `which git` to see where they live.
- [ ] If a tool you expect is missing, run `which <tool>` and record the result.

  ```bash
  echo $PATH
  which bash
  which python
  which git
  ```

---

## Exercise 5: Environment Variables and Dotfiles

- [ ] Use `env | head` to see a sample of environment variables.
- [ ] Use `ls -a ~` and locate at least **three** dotfiles or dot-directories (e.g. `.bashrc`, `.gitconfig`, `.profile`).
- [ ] Open `~/.bashrc` (or `~/.zshrc` / equivalent) in `less` or `nano` and find a line that modifies `PATH` (do **not** change it yet).

  ```bash
  env | head
  ls -a ~
  less ~/.bashrc
  # or: less ~/.zshrc
  ```

---

## Optional: Use the examples

All exercises can be done in your home or project directories. You can also run the example commands in `module2/examples/` to see file types, permissions, environment, and dotfiles in a prepared layout.

```bash
./scripts/module2.sh --check   # self-check
./scripts/module2.sh --demo    # print demo commands
```
