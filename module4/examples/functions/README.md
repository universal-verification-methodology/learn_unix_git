# Shell functions example

Practice **defining and using shell functions** in the current shell (vs separate scripts).

## Layout

```
functions/
├── README.md       # this file
└── commands_to_try.txt   # copy-paste function definitions
```

## Try these (in your shell)

```bash
cd module4/examples/functions
# Define a function (no spaces around = in assignment)
greet() { echo "Hello, $1"; }
greet Alice
greet "Bob Smith"

# Function with multiple commands
count_lines() { wc -l "$@"; }
count_lines *.txt

# List defined functions
declare -f greet
type greet
```

See `commands_to_try.txt` for more examples. Define in current shell or add to `~/.bashrc` to persist.

## 1. Why functions?

- **Same shell**: Functions run in the current shell (no new process). Scripts run in a subshell.
- **Reuse**: Define once, call many times; good for aliases that need arguments or multi-step logic.
- **Quick helpers**: `count() { wc -l "$@"; }` — then `count *.log` from any directory.

## 2. Syntax

- **`name() { commands; }`** — define function. Use `"$@"` to pass all arguments through.
- **`name arg1 arg2`** — call function (no parentheses).

## 3. Functions vs scripts

| Aspect       | Function              | Script                 |
|-------------|------------------------|------------------------|
| Where       | Current shell          | Subshell (child process) |
| Persistence | Lost when shell exits  | File on disk           |
| Persist     | Add to ~/.bashrc       | N/A                    |
| Arguments   | $1, $2, "$@"           | $1, $2, "$@"           |

Use a **function** for short, interactive helpers. Use a **script** when you need a file to share, version-control, or run from other tools.
