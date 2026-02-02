# Module 3 Examples

Hands-on examples for **Processes, Pipes & Redirection**: processes and exit status, redirection, pipes and grep, background jobs, and troubleshooting with tee.

---

## 1. Processes (`processes/`)

Practice **ps**, **PID**, and **exit status** (`echo $?`).

**Layout**: `show_pid.sh`, `fail.sh` (runnable after chmod u+x).

**Try these** (from repo root):

```bash
cd module3/examples/processes
chmod u+x show_pid.sh fail.sh
./show_pid.sh
echo $?
./fail.sh
echo $?
ps aux | head -10
```

See `processes/README.md` for Ctrl+C and process listing.

---

## 2. Redirection (`redirection/`)

Practice **>**, **>>**, **2>**, and **2>&1** with a script that prints to stdout and stderr.

**Layout**: `print_both.sh` (chmod u+x to run).

**Try these**:

```bash
cd module3/examples/redirection
chmod u+x print_both.sh
./print_both.sh > out.log
cat out.log
./print_both.sh > out.log 2> err.log
cat out.log err.log
./print_both.sh > combined.log 2>&1
cat combined.log
```

See `redirection/README.md` for patterns and order of redirections.

---

## 3. Pipes (`pipes/`)

Practice **pipes** (`|`) and **grep** on a sample log.

**Layout**: `sample.log` (log with INFO, WARNING, ERROR lines).

**Try these**:

```bash
cd module3/examples/pipes
grep ERROR sample.log
grep -i warning sample.log
grep -i error sample.log | less
grep -c ERROR sample.log
```

See `pipes/README.md` for grep options and common chains.

---

## 4. Background jobs (`background/`)

Practice **&**, **jobs**, and **tail -f** with a slow-printing script.

**Layout**: `slow_output.sh` (chmod u+x to run).

**Try these**:

```bash
cd module3/examples/background
chmod u+x slow_output.sh
./slow_output.sh > bg.log 2>&1 &
jobs
tail -5 bg.log
sleep 2
tail -5 bg.log
tail -f bg.log
```

Use `fg %1` or `kill <PID>` to stop the job. See `background/README.md` for job control.

---

## 5. Troubleshooting (`troubleshooting/`)

Practice **tee** and **2>&1** to capture failing command output.

**Layout**: `failing_cmd.sh`, `commands_to_try.txt`.

**Try these**:

```bash
cd module3/examples/troubleshooting
chmod u+x failing_cmd.sh
./failing_cmd.sh 2>&1 | tee debug.log
echo $?
cat debug.log
grep -i error debug.log
```

See `troubleshooting/README.md` for debugging mindset and tee usage.
