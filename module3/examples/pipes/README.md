# Pipes example

Practice **pipes** (`|`) and **grep** to connect commands and search output.

## Layout

```
pipes/
├── README.md       # this file
└── sample.log      # sample log for grep practice
```

## Try these (from repo root)

```bash
cd module3/examples/pipes

# Search for lines containing a word
grep ERROR sample.log
grep WARNING sample.log
grep -i error sample.log
grep -i warning sample.log

# Pipe output into less
grep -i error sample.log | less
cat sample.log | grep INFO | head -5

# Count matches
grep -c ERROR sample.log
grep -ci warning sample.log
```

## 1. Pipes (|)

**`command1 | command2`** — sends the **stdout** of `command1` as **stdin** to `command2`.

Examples:

- `ls -l | less` — list long, scroll in less
- `ps aux | grep sleep` — list processes, keep lines with "sleep"
- `cat sample.log | grep ERROR` — show only lines containing ERROR

## 2. grep basics

- **`grep "word" file`** — print lines in `file` that contain `word`.
- **`grep -i "word" file`** — same, but case-insensitive (ERROR, error, Error all match).
- **`grep -c "word" file`** — count matching lines.
- **`grep -v "word" file`** — print lines that do **not** contain `word`.

You can pipe into grep: `command | grep "word"`.

## 3. Common chains for logs

- `cat run.log | grep -i error | less` — search for errors and scroll.
- `tail -100 run.log | grep WARNING` — last 100 lines, then filter warnings.
- `command 2>&1 | tee run.log | grep -i error` — run command, save full output to `run.log`, and show lines with "error" on screen.

Use these when debugging builds or simulations: redirect output to a log, then grep for ERROR, WARNING, or specific messages.
