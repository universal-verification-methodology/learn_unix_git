# Xargs example

Practice **building commands from stdin** with `xargs` so you can run a command on many items (e.g. from `find` or `grep -l`).

## Layout

```
xargs/
├── README.md       # this file
├── files/          # a.txt, b.txt, c.txt
└── echo_demo.sh    # script that echoes its args (chmod u+x)
```

## Try these (from repo root)

```bash
cd module3/examples/xargs
ls files/
ls files/ | xargs echo
ls files/ | xargs -I {} echo "File: {}"
find files -type f | xargs wc -l
find files -type f -name "*.txt" | xargs grep -l "hello"
chmod u+x echo_demo.sh
ls files/ | xargs ./echo_demo.sh
```

## 1. What xargs does

**`xargs`** reads items from **stdin** (one per line by default) and passes them as **arguments** to a command. If the command is omitted, it defaults to `echo`.

- **`ls files/ | xargs echo`** — pass list of filenames to echo.
- **`find . -name "*.v" | xargs wc -l`** — count lines in all `.v` files (like `wc -l file1 file2 ...`).

## 2. Placeholder with -I {}

- **`xargs -I {} command {}`** — replace `{}` with each input item.
- **`find . -name "*.v" | xargs -I {} echo "Found: {}"`** — run echo once per file with the filename in place of `{}`.

## 3. Safety with spaces

If filenames contain spaces, use **`find -print0 | xargs -0`** so items are separated by null bytes:

- **`find . -name "*.txt" -print0 | xargs -0 grep -l "pattern"`** — safe with spaces in names.

## 4. Practical use

- **Batch process**: `grep -Rl "CLOCK_SIGNAL" . | xargs wc -l` — line count of every file containing CLOCK_SIGNAL.
- **Clean build**: `find build -type f -name "*.o" | xargs rm` — remove all .o files (or use `find -delete`).

Use xargs when you have a **list** (from find, grep -l, ls) and want to run one command that takes multiple arguments.
