# Processes example

Practice **listing processes** with `ps`, understanding **PID**, and checking **exit status** with `echo $?`.

## Layout

```
processes/
├── README.md       # this file
├── show_pid.sh      # prints its PID and exits (chmod u+x to run)
└── fail.sh          # exits with status 1 (for exit-status practice)
```

## Try these (from repo root)

```bash
cd module3/examples/processes
chmod u+x show_pid.sh fail.sh
./show_pid.sh
echo $?
./fail.sh
echo $?
ps aux | head -10
ps aux | grep -v grep | grep sleep
```

## 1. Exit status

Every command returns an **exit status** when it finishes:

- **0** = success
- **non-zero** = error (often 1)

Check the last command’s status:

```bash
./show_pid.sh
echo $?
```

Then run `./fail.sh` and `echo $?` again; you should see `1`.

## 2. Listing processes (ps)

```bash
ps aux | head -15
```

Common columns: USER, PID (process ID), %CPU, %MEM, COMMAND. Use `ps aux | grep <name>` to find a process by name (e.g. `grep sleep`). Filter out the grep process with `grep -v grep` if needed.

## 3. Interrupting a process

- **Ctrl+C** — stop the foreground program (e.g. `sleep 30` then Ctrl+C).
- **Ctrl+Z** — suspend the foreground program (optional; then `fg` or `bg` to resume).

## 4. Why it matters

When a build or simulation fails, the exit status and process list help you see what ran and whether it exited normally. Scripts and tools use exit codes so other programs can detect success or failure.
