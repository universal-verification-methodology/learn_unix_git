# Background jobs example

Practice running commands in the **background** with `&`, listing **jobs**, and inspecting output with **tail**.

## Layout

```
background/
├── README.md       # this file
└── slow_output.sh  # prints lines slowly (chmod u+x to run)
```

## Try these (from repo root)

**1. Run a command in the background**

```bash
cd module3/examples/background
chmod u+x slow_output.sh

# Start in background (note the &)
./slow_output.sh > bg.log 2>&1 &
echo "Job started. Note the job number and PID."
jobs
```

**2. Inspect the log while it runs**

```bash
tail -5 bg.log
sleep 2
tail -5 bg.log
```

**3. Follow the log in real time (optional)**

```bash
tail -f bg.log
# Press Ctrl+C to stop following (the background job keeps running)
```

**4. Bring job to foreground or stop it**

```bash
jobs
fg %1
# Then Ctrl+C to stop, or wait for it to finish
```

Or kill by PID (from `jobs` or `ps aux | grep slow_output`):

```bash
kill <PID>
```

## 1. Background execution (&)

- **`command &`** — run `command` in the background; you get the prompt back immediately.
- The shell prints a **job number** (e.g. `[1] 12345`) and the **PID** (process ID).

## 2. Job control (jobs, fg, bg)

- **`jobs`** — list background jobs for this shell.
- **`fg %1`** — bring job 1 to the **foreground** (so it can read keyboard; Ctrl+C stops it).
- **`bg %1`** — run job 1 in the **background** (if it was suspended with Ctrl+Z).

## 3. Watching logs (tail -f)

- **`tail -f file`** — show the last lines of `file` and keep printing new lines as they are written.
- Useful for long-running simulations or builds: run the command with `> run.log 2>&1 &`, then `tail -f run.log`.

## 4. When to use background

- Long-running simulations or builds so you can keep using the terminal.
- Redirect output to a log: `./simulate.sh > sim.log 2>&1 &`, then inspect with `tail -f sim.log` or `grep ERROR sim.log`.
