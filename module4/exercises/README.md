# Module 4 Exercises

Work through these exercises to reinforce **Shell Productivity & Basic Scripting**. Do them in your terminal; check off each when done.

Full exercise list: [docs/MODULE4.md#exercises](../docs/MODULE4.md#exercises).

---

## Exercise 1: History and Shortcuts

- [ ] Run at least 5 different commands.
- [ ] Use `history` to view them.
- [ ] Use **Ctrl+R** to search for one of the commands and re-run it.
- [ ] Practice editing a recalled command using **Ctrl+A** and **Ctrl+E**.

  ```bash
  pwd
  ls
  cd ~
  echo hello
  date
  history
  # Ctrl+R, type "ls", Enter
  # Recall a command, then Ctrl+A / Ctrl+E to move
  ```

---

## Exercise 2: Creating Aliases

- [ ] Create a temporary alias `ll` for `ls -alF`.
- [ ] Create an alias `cproj` that `cd`s into your main course project directory.
- [ ] Use `alias` (with no arguments) to list all active aliases.

  ```bash
  alias ll='ls -alF'
  ll
  alias cproj='cd ~/proj/learn_unix_git'
  cproj
  alias
  ```

---

## Exercise 3: First Script

- [ ] Create a script `say_hello.sh` with:
  - A shebang line.
  - A message that prints "Hello from the script!".
- [ ] Make it executable and run it with `./say_hello.sh`.

  You can use the example: `module4/examples/script_basics/say_hello.sh` (copy to ~/unix_practice and run), or create your own.

---

## Exercise 4: Script with Arguments

- [ ] Create `greet.sh` that:
  - Accepts a name as `$1`.
  - Prints `Hello, <name>!` (or a default if no name is given).
- [ ] Test it with and without providing a name.

  You can use the example: `module4/examples/arguments/greet.sh` (copy and run), or create your own with `NAME="${1:-World}"` and `echo "Hello, ${NAME}!"`.

---

## Exercise 5: Batch Operation Script

- [ ] In a directory with several `.log` files, create a script `count_lines.sh` that:
  - Loops over `*.log`.
  - Prints the file name and line count (using `wc -l`).
- [ ] Run it and verify the counts match manual checks on a couple of files.

  You can use the example: `cd module4/examples/control_flow && ./count_lines.sh`, or create your own in ~/unix_practice with sample .log files.

---

## Exercise 6: Safety Check

- [ ] Write a script `clean_tmp.sh` that:
  - Echoes which files it would delete in a `tmp/` directory.
  - Only deletes them if a `--confirm` flag is passed.
- [ ] Test it without `--confirm` to see the dry run, then with `--confirm` in a safe test directory.

  You can use the example: `module4/examples/safe_scripting/clean_tmp.sh` (dry run, then `./clean_tmp.sh --confirm`).

---

## Optional: Use the examples

All exercises can be done in your home or project directories. You can also run the example scripts in `module4/examples/` to see history, aliases, script basics, arguments, control flow, and safe scripting in action.

```bash
./scripts/module4.sh --check   # self-check
./scripts/module4.sh --demo   # print demo commands
```
