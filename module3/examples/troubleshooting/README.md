# Troubleshooting example

Practice **capturing** failing command output with **tee** and **2>&1**, then inspecting the log to find the error.

## Layout

```
troubleshooting/
├── README.md       # this file
├── failing_cmd.sh   # prints to stdout and stderr then exits 1 (chmod u+x)
└── commands_to_try.txt   # copy-paste commands
```

## Try these (from repo root)

```bash
cd module3/examples/troubleshooting
chmod u+x failing_cmd.sh

# Run a "failing" command and capture everything to a log
./failing_cmd.sh 2>&1 | tee debug.log
echo $?

# Inspect the log
cat debug.log
grep -i error debug.log
grep -i fail debug.log
```

**Simulate a real failure** (command not found):

```bash
badcommand 2>&1 | tee notfound.log
cat notfound.log
echo $?
```

## 1. tee: show output and save to file

- **`command | tee file`** — stdout goes to the terminal **and** to `file`.
- **`command 2>&1 | tee file`** — stdout and stderr both go to the terminal and to `file`. Good for capturing full output when debugging.

## 2. 2>&1 with tee

- **`badcommand 2>&1 | tee debug.log`** — run `badcommand`; stderr is merged into stdout (`2>&1`), then the combined stream is shown and written to `debug.log`.
- You see the error on screen and can open `debug.log` later to find the failing command and message.

## 3. Debugging mindset

1. **Capture** — redirect or tee output to a log so nothing is lost.
2. **Identify** — open the log and find the **command** that failed and the **error message**.
3. **Fix** — typo? Missing tool? Wrong path? Use the message to decide what to change.

Use this when a build or simulation fails: run it with `2>&1 | tee run.log`, then search the log for ERROR, WARNING, or the first line that indicates failure.
