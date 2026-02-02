# ls options example

Practice **listing files** with different `ls` options: long format, time sort, size sort, human-readable, and recursive.

## Layout

```
ls_options/
├── README.md       # this file
├── small.txt
├── medium.txt      # a bit more content
├── subdir/
│   └── nested.txt
└── big.txt         # largest file
```

## Try these (from repo root)

```bash
cd module1/examples/ls_options
ls
ls -l
ls -la
ls -lt
ls -lS
ls -lh
ls -lR
ls -la subdir
```

## 1. Common options

- **`ls -l`** — long format: permissions, owner, size, date, name.
- **`ls -a`** / **`ls -la`** — include hidden (dot) files.
- **`ls -t`** — sort by modification time (newest first).
- **`ls -S`** — sort by size (largest first).
- **`ls -h`** — human-readable sizes (e.g. 1K, 2M) with `-l`.
- **`ls -R`** — list directories recursively.

## 2. Combining options

- **`ls -lt`** — long format, newest first.
- **`ls -lSh`** — long, by size, human-readable.
- **`ls -la`** — long, include dotfiles.

## 3. Quick recap

| Option | Effect |
|--------|--------|
| `-l` | Long format |
| `-a` | Show hidden (dot) files |
| `-t` | Sort by time (newest first) |
| `-S` | Sort by size (largest first) |
| `-h` | Human-readable sizes |
| `-R` | Recursive |

Use these when inspecting project dirs, build outputs, or log directories.
