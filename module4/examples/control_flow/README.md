# Control flow example

Practice **loops** and **conditionals** in scripts: `for`, `if`, and batch operations on files.

## Layout

```
control_flow/
├── README.md       # this file
├── count_lines.sh  # for each .log file: print name and line count (chmod u+x)
├── a.log           # sample log
├── b.log           # sample log
└── c.log           # sample log
```

## Try these (from repo root)

```bash
cd module4/examples/control_flow
chmod u+x count_lines.sh
./count_lines.sh
wc -l *.log
```

## 1. For loop over files

```bash
for file in *.log; do
  echo "$file: $(wc -l < "$file") lines"
done
```

`*.log` expands to all files matching the pattern in the current directory. Always quote `"$file"` so names with spaces work.

## 2. If (file checks)

```bash
if [ -f "$1" ]; then
  echo "$1 exists and is a file"
else
  echo "$1 missing or not a file"
fi
```

Common tests: `-f` (file), `-d` (directory), `-e` (exists). Use `[ ]` with spaces around the brackets.

## 3. Batch operations

Use a loop to run the same operation on many files: count lines, grep, run a tool. This prepares you for wrapping builds or tests that process multiple inputs.
