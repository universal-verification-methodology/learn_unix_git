# Module 3 Exercises

Work through these exercises to reinforce **Processes, Pipes & Redirection**. Do them in your terminal; check off each when done.

Full exercise list: [docs/MODULE3.md#exercises](../docs/MODULE3.md#exercises).

---

## Exercise 1: Process Basics

- [ ] Run a command that sleeps: `sleep 30`.
- [ ] Use **Ctrl+C** to interrupt it.
- [ ] Start `sleep 60 &` and note the **job number** and **PID**.
- [ ] Use `ps` to find the `sleep` process (e.g. `ps aux | grep sleep`).

  ```bash
  sleep 30
  # Ctrl+C
  sleep 60 &
  jobs
  ps aux | grep sleep
  ```

---

## Exercise 2: Foreground and Background

- [ ] Run `yes "running..."` (be ready to stop it).
- [ ] Stop it with **Ctrl+C**.
- [ ] Start it again as `yes "running..." > yes.log &`.
- [ ] Use `tail -n 5 yes.log` to inspect the output.
- [ ] Stop the background job (e.g. `jobs`, then `fg %1` and **Ctrl+C**, or `kill <PID>`).

  ```bash
  yes "running..."
  # Ctrl+C
  yes "running..." > yes.log &
  tail -n 5 yes.log
  jobs
  fg %1
  # Ctrl+C
  ```

---

## Exercise 3: Redirection Practice

- [ ] Run a command that prints both output and an error (e.g. `ls`, then `ls does_not_exist`).
- [ ] Capture **stdout** to `out.log` and **stderr** to `err.log`:
  - `ls . does_not_exist > out.log 2> err.log`
- [ ] Inspect both files with `cat` or `less`.

  ```bash
  cd ~/unix_practice   # or any dir
  ls . does_not_exist > out.log 2> err.log
  cat out.log
  cat err.log
  ```

  Or use the example script: `module3/examples/redirection/print_both.sh > out.log 2> err.log`.

---

## Exercise 4: Pipes and Grep

- [ ] Create a sample log file (or use `module3/examples/pipes/sample.log`):
  - `dmesg | tail -n 100 > sample.log` (or `cp module3/examples/pipes/sample.log .`).
- [ ] Use `grep` to find lines containing a specific word.
- [ ] Use `grep -i` for case-insensitive search and compare results.
- [ ] View filtered results with `grep "<word>" sample.log | less`.

  ```bash
  cp module3/examples/pipes/sample.log ~/unix_practice/
  cd ~/unix_practice
  grep ERROR sample.log
  grep -i warning sample.log
  grep -i error sample.log | less
  ```

---

## Exercise 5: Log-Based Debugging

- [ ] Run a command that fails (e.g. misspell a command or pass a bad flag).
- [ ] Capture its **combined** output to `debug.log`:
  - `badcommand 2>&1 | tee debug.log`
- [ ] Open `debug.log` and identify:
  - The command that failed
  - The error message
  - At least one thing you could try to fix it

  ```bash
  badcommand 2>&1 | tee debug.log
  echo $?
  cat debug.log
  ```

  Or use the example: `module3/examples/troubleshooting/failing_cmd.sh 2>&1 | tee debug.log`.

---

## Optional: Use the examples

All exercises can be done in your home or project directories. You can also run the example scripts in `module3/examples/` to see processes, redirection, pipes, background jobs, and troubleshooting in action.

```bash
./scripts/module3.sh --check   # self-check
./scripts/module3.sh --demo    # print demo commands
```
