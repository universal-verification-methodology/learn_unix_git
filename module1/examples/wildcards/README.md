# Wildcards (globbing) example

Practice **filename expansion** with `*`, `?`, and `[...]` so you can work with many files at once.

## Layout

```
wildcards/
├── README.md       # this file
├── a.txt
├── b.txt
├── c.txt
├── report_2024.txt
├── report_2023.txt
├── data_1.log
├── data_2.log
└── design.v
```

## Try these (from repo root)

```bash
cd module1/examples/wildcards
ls
ls *.txt
ls report_*.txt
ls data_?.log
ls [abc].txt
ls [a-c].txt
ls *.[tv]*
```

## 1. Asterisk (*)

**`*`** matches **any** sequence of characters (including none).

- `ls *.txt` — all files ending in `.txt`
- `ls report_*` — all files whose name starts with `report_`
- `cp *.v backup/` — copy all `.v` files into `backup/`

## 2. Question mark (?)

**`?`** matches **exactly one** character.

- `ls data_?.log` — `data_1.log`, `data_2.log`, but not `data_10.log`
- `ls ?.txt` — single-letter names like `a.txt`, `b.txt`

## 3. Brackets [...]

**`[abc]`** matches **one** character from the set. **`[a-c]`** is a range (a, b, c).

- `ls [abc].txt` — `a.txt`, `b.txt`, `c.txt`
- `ls [0-9].log` — files named `0.log` through `9.log`

## 4. Practical use

- **RTL/verification**: `ls src/*.v`, `cat tb/*.sv | wc -l`
- **Logs**: `rm build/*.log`, `grep ERROR *.log`
- **Backup**: `cp *.v backup/`

**Note:** The shell expands wildcards **before** the command runs. So `rm *.tmp` becomes a list of filenames; double-check with `ls *.tmp` first.
