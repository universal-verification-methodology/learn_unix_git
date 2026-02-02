# case statement example

Practice **multi-way branching** with `case $var in ... esac` (cleaner than many if/elif for one variable).

## Layout

```
case_statement/
├── README.md       # this file
├── greet.sh        # case on first argument (chmod u+x)
└── commands_to_try.txt
```

## Try these (from repo root)

```bash
cd module4/examples/case_statement
chmod u+x greet.sh
./greet.sh hello
./greet.sh bye
./greet.sh other
./greet.sh
```

See `commands_to_try.txt` for a minimal case template.

## 1. case syntax

```bash
case "$var" in
  pattern1) commands ;;
  pattern2) commands ;;
  *) default commands ;;
esac
```

- **`pattern)`** — match; then **`;;`** ends that branch.
- **`*)`** — default (like else). Use **`*`** to match anything.
- **`|`** — multiple patterns: `hello|hi) echo "Hi" ;;`

## 2. Patterns

- **Literal**: `hello)` matches exactly `hello`.
- **Glob**: `*.txt)` matches any value ending in `.txt`.
- **`[yY]`** — one character: y or Y.

## 3. When to use

- **Menus**: user choice (1, 2, 3 or yes/no).
- **File extension**: `case "$f" in *.v) ... ;; *.sv) ... ;; esac`.
- **Commands**: dispatch on first argument (start|stop|restart).

Use case when you have one variable and several possible values; it’s shorter and clearer than long if/elif chains.
