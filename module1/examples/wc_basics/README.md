# wc (word count) basics example

Practice **counting lines, words, and bytes** with `wc` on single files and piped input.

## Layout

```
wc_basics/
├── README.md       # this file
├── poem.txt
├── list.txt
└── empty.txt       # empty file
```

## Try these (from repo root)

```bash
cd module1/examples/wc_basics
wc poem.txt
wc -l poem.txt
wc -w poem.txt
wc -c poem.txt
wc -l list.txt poem.txt
wc poem.txt list.txt
cat poem.txt | wc -l
wc -l *.txt
```

## 1. wc output

**`wc file`** prints (by default): **lines**, **words**, **bytes**, then the filename.

- **`wc -l`** — line count only.
- **`wc -w`** — word count only.
- **`wc -c`** — byte (character) count only.
- **`wc -l file1 file2`** — line count per file and total.

## 2. Piped input

- **`cat file | wc -l`** — count lines (same as `wc -l file`).
- **`command | wc -l`** — count lines of command output (e.g. how many files: `ls | wc -l`).

## 3. Practical use

- **Logs**: `wc -l run.log` — how many lines in the log.
- **Code**: `wc -l src/*.v` — line counts per source file.
- **Lists**: `ls | wc -l` — number of items in current directory.

Words are separated by whitespace; lines by newlines. Empty file gives `0 0 0`.
