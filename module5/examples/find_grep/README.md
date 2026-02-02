# Find and grep example

Practice **finding files by name** with `find` and **searching file contents** with `grep -R`.

## Layout

```
find_grep/
├── README.md       # this file
├── src/             # sample source files
│   ├── top.v
│   └── util.v
└── tb/              # sample testbench files
    └── tb_top.v
```

Files contain the keyword **CLOCK_SIGNAL** so you can practice `grep -R`.

## Try these (from repo root)

```bash
cd module5/examples/find_grep

# Find files by name
find . -name "*.v"
find . -name "top*"
find . -type f

# Search file contents recursively
grep -R "CLOCK_SIGNAL" .
grep -Rn "CLOCK_SIGNAL" .
grep -Rl "CLOCK_SIGNAL" .
```

## 1. find (by name)

- **`find . -name "*.v"`** — files in current directory (and below) whose name matches `*.v`.
- **`find . -type f`** — all regular files under current directory.
- **`find . -type d`** — all directories.

Use `find` when you know a filename or pattern but not the path.

## 2. grep -R (by content)

- **`grep -R "word" .`** — search for `word` in all files under the current directory (recursive).
- **`grep -Rn "word" .`** — same, but print **line numbers**.
- **`grep -Rl "word" .`** — same, but print only **file names** (no line content).

Use `grep -R` when you need to find where a signal or string is used across a project.

## 3. Working with large trees

- **`tree`** (if installed) — shows directory hierarchy.
- **`find . -type f | wc -l`** — count files under current directory.

Combining `find` and `grep -R` helps you navigate and search projects before using an editor’s multi-file search.
