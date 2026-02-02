# Touch example

Practice **creating empty files** and **updating file timestamps** with `touch`.

## Layout

```
touch/
├── README.md       # this file
└── existing.txt    # file to update timestamp
```

## Try these (from repo root)

```bash
cd module1/examples/touch
ls -l existing.txt
touch newfile.txt
ls -l newfile.txt
touch existing.txt
ls -l existing.txt
touch placeholder_{1,2,3}.tmp
ls -l placeholder_*.tmp
```

## 1. Create an empty file

**`touch filename`** — if the file does **not** exist, `touch` creates an empty file. If it exists, it updates the access and modification time to "now".

- `touch notes.txt` — create empty `notes.txt` (or update its time)
- `touch build/.gitkeep` — common trick to keep an empty `build/` directory in Git

## 2. Update timestamps

Useful when you want a file to look "newer" for build systems or when testing scripts that depend on modification time.

- `touch existing.txt` — set access and modification time of `existing.txt` to now
- `touch -d "2024-01-01" old.txt` — set a specific date (GNU touch)

## 3. Brace expansion (bonus)

**`touch file_{1,2,3}.tmp`** — creates `file_1.tmp`, `file_2.tmp`, `file_3.tmp`. The shell expands `{1,2,3}` before running `touch`. Handy for creating several placeholders at once.

## 4. Quick recap

| Goal                 | Command           |
|----------------------|-------------------|
| Create empty file    | `touch name`      |
| Update time (exists) | `touch name`      |
| Keep empty dir in Git| `touch dir/.gitkeep` |

After practicing, you can remove test files: `rm -f newfile.txt placeholder_*.tmp` to leave the folder clean.
