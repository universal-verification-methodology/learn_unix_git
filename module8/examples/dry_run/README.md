# Dry run example

Practice **scripts that support --dry-run** (show what would be done without doing it).

## Layout

```
dry_run/
├── README.md       # this file
├── remove_old.sh   # removes files older than N days; --dry-run lists only (chmod u+x)
└── commands_to_try.txt
```

## Try these (from repo root)

```bash
cd module8/examples/dry_run
chmod u+x remove_old.sh
./remove_old.sh --help
./remove_old.sh --dry-run
touch -d "2020-01-01" old_file.txt 2>/dev/null || touch old_file.txt
./remove_old.sh --dry-run
./remove_old.sh
```

See `commands_to_try.txt` for a compact list.

## 1. Why --dry-run?

- **Safety**: See what would be deleted or changed before running for real.
- **Debug**: Verify logic (e.g. which files match) without side effects.
- **CI/scripts**: Call with `--dry-run` in tests to assert behavior without modifying the system.

## 2. Pattern in scripts

- **Parse**: `if [[ "$1" == --dry-run ]]; then DRY_RUN=1; shift; fi`
- **Action**: Before each destructive step, `if [[ -z "${DRY_RUN:-}" ]]; then rm "$f"; else echo "Would remove: $f"; fi`
- Or: **`echo "Would: rm $f"`** when dry run; **`rm "$f"`** when not.

## 3. When to use

- **Clean scripts**: `./clean.sh --dry-run` then `./clean.sh`.
- **Deploy scripts**: Show what would be copied or run without executing.
- **Course scripts**: Document `--dry-run` in README so students can try safely.

Use --dry-run for any script that deletes, moves, or overwrites files so users can preview first.
