# Using scripts example

Practice **running** project scripts from the project root and **redirecting** output to log files.

## Layout

```
scripts/
├── README.md           # this file
└── commands_to_try.txt # copy-paste commands
```

The sample project has its own script: `module8/examples/template/sample_project/scripts/run_demo.sh`.

## Try these (from repo root)

**1. Run the sample project script**

```bash
cd module8/examples/template/sample_project
chmod +x scripts/run_demo.sh
./scripts/run_demo.sh
```

**2. Redirect output to a log file**

```bash
./scripts/run_demo.sh > logs/run.log 2>&1
cat logs/run.log
```

**3. Script entry points**

- Many course repos provide scripts like `scripts/run_tests.sh`, `scripts/build.sh`, or `scripts/moduleX.sh`.
- Run from **project root**: `./scripts/run_tests.sh` (so paths inside the script are correct).
- Use **--help** if available: `./scripts/run_tests.sh --help`.

**4. Customizing scripts (lightly)**

- Edit variables near the top (paths, flags) if needed.
- Keep custom changes small and documented so updates from the course repo don’t overwrite your work.

See `commands_to_try.txt` for a compact list.
