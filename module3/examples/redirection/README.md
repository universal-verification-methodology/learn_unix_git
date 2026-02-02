# Redirection example

Practice **redirecting** standard output and standard error with `>`, `>>`, `2>`, and `2>&1`.

## Layout

```
redirection/
├── README.md       # this file
└── print_both.sh   # prints to stdout and stderr (chmod u+x to run)
```

## Try these (from repo root)

```bash
cd module3/examples/redirection
chmod u+x print_both.sh

# Overwrite: stdout to file
./print_both.sh > out.log
cat out.log

# Separate stdout and stderr
./print_both.sh > out.log 2> err.log
cat out.log
cat err.log

# Both to same file (2>&1 = stderr to wherever stdout goes)
./print_both.sh > combined.log 2>&1
cat combined.log

# Append (>>)
echo "extra line" >> combined.log
tail -3 combined.log
```

## 1. Standard output (>) and append (>>)

- **`command > file`** — stdout overwrites `file`.
- **`command >> file`** — stdout appends to `file`.

## 2. Standard error (2>)

- **`command 2> file`** — stderr goes to `file`; stdout is unchanged (e.g. still to terminal).

## 3. Both to one file (2>&1)

- **`command > file 2>&1`** — stdout to `file`, then stderr to the same place as stdout (so both go to `file`).
- Order matters: `2>&1` means “stderr → same as stdout”, so do `> file` first, then `2>&1`.

## 4. Common patterns

| Goal                    | Command                          |
|-------------------------|-----------------------------------|
| Save stdout             | `command > out.log`              |
| Save stdout and stderr   | `command > run.log 2>&1`        |
| Separate out and err     | `command > out.log 2> err.log`  |
| Append stdout            | `command >> out.log`             |
| Watch log while running  | `command >> run.log 2>&1 &` then `tail -f run.log` |

Use these when running simulators or builds so you can inspect logs later and search for errors.
