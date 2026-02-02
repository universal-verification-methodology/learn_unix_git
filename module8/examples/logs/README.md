# Logs and outputs example

Practice **inspecting** log directories and **searching** logs with `tail`, `less`, and `grep`.

## Layout

```
logs/
├── README.md           # this file
├── sample.log          # sample log for grep/tail/less practice
└── commands_to_try.txt  # copy-paste commands
```

After running the sample project script, use `module8/examples/template/sample_project/logs/run.log` or this `sample.log`.

## Try these (from repo root)

**1. Generate a log (run sample project script)**

```bash
cd module8/examples/template/sample_project
./scripts/run_demo.sh > logs/run.log 2>&1
```

**2. Inspect the log**

```bash
tail -20 logs/run.log
less logs/run.log
grep -i error logs/run.log
grep -i info logs/run.log
```

**3. Log directory patterns**

- **logs/**, **build/**, **out/** — common places for run output.
- Use `tree` or `ls -R` (with care) to see where outputs go.

**4. Analyzing logs**

- **tail** — last N lines: `tail -50 logs/run.log`
- **less** — scroll and search: `less logs/run.log` then `/error`
- **grep** — filter by keyword: `grep -i error logs/run.log`, `grep -i warn logs/run.log`

**5. Cleaning outputs**

- Use a **clean script** if provided: `./scripts/clean.sh`
- Or remove by hand: `rm -rf build/* logs/*` (only if you know these are generated).
- Don’t delete hand-written source in `src/` or `tb/`.

See `commands_to_try.txt` and use `sample.log` for practice.
