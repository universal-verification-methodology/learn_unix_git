# Combining tools example

Practice **chaining** redirection, pipes, and **tee** in one command for log-style output: capture everything to a file and filter on screen.

## Layout

```
combining/
├── README.md       # this file
└── combine_demo.sh  # prints mixed stdout/stderr (chmod u+x to run)
```

## Try these (from repo root)

```bash
cd module3/examples/combining
chmod u+x combine_demo.sh

# Capture full output to a log and show only lines with "error" on screen
./combine_demo.sh 2>&1 | tee run.log | grep -i error

# Inspect the full log
cat run.log
grep -c ERROR run.log
grep -i warning run.log | less

# Multi-step pipeline: filter then count
cat run.log | grep -i error | wc -l
cat run.log | grep INFO | head -3
```

## 1. Why combine?

In real workflows you often want to:

- **Save** all output to a file (for later inspection).
- **See** only important lines on screen (e.g. errors).

**`command 2>&1 | tee run.log | grep -i error`** does both: stdout and stderr go to the terminal and to `run.log`, and only lines matching "error" are printed (from the pipe after tee).

## 2. Order of operations

- `2>&1` — stderr is merged into stdout.
- `| tee run.log` — full stream is written to `run.log` and passed to the next pipe.
- `| grep -i error` — only matching lines are printed.

So you get a full log file and filtered output at once.

## 3. Other useful chains

- **Count matches**: `grep ERROR run.log | wc -l`
- **First N matches**: `grep -i warning run.log | head -10`
- **Scroll filtered output**: `grep -i error run.log | less`
- **Background + follow log**: `./long_script.sh 2>&1 | tee run.log &` then `tail -f run.log`

Use these when running simulators or builds: capture to a log, then search for ERROR, WARNING, or specific messages.
