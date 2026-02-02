# Safe scripting example

Practice **dry runs**, **--confirm** flags, **set -e**, and **quoting** so scripts are predictable and safe.

## Layout

```
safe_scripting/
├── README.md       # this file
├── clean_tmp.sh    # dry run by default; deletes only with --confirm (chmod u+x)
└── tmp/            # sample files to "clean"
    ├── cache1.tmp
    └── cache2.tmp
```

## Try these (from repo root)

```bash
cd module4/examples/safe_scripting
chmod u+x clean_tmp.sh
./clean_tmp.sh
ls tmp/
./clean_tmp.sh --confirm
ls tmp/
```

## 1. Dry run by default

The script **echoes** what it would delete instead of deleting until you pass `--confirm`. That way you can run it once to inspect, then run with `--confirm` when you are sure.

## 2. set -e and quoting

- **`set -e`** — exit immediately if a command fails (e.g. `cd` to a missing dir). Use at the top of scripts so one failure does not hide the next.
- **`"$VAR"`** — quote variables so paths or arguments with spaces do not break the script. Prefer `"$1"`, `"$file"`, etc.

## 3. Defensive patterns

- **Echo before destructive actions** — e.g. "Would delete: file.txt" so logs are clear.
- **Require an explicit flag** — e.g. `--confirm` for delete, so accidental runs do not remove files.
- **Check that files/dirs exist** — e.g. `if [ -d tmp ]; then ...` before cleaning.

Use these when writing scripts that remove files, run builds, or run tests: dry run first, then confirm.
