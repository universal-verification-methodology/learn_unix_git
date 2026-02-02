# Read input example

Practice **reading user input** in scripts with `read` and simple prompting.

## Layout

```
read_input/
├── README.md       # this file
├── prompt_name.sh  # asks for name, then greets (chmod u+x)
└── confirm.sh      # asks y/n before proceeding (chmod u+x)
```

## Try these (from repo root)

```bash
cd module4/examples/read_input
chmod u+x prompt_name.sh confirm.sh
./prompt_name.sh
./confirm.sh
```

## 1. read basics

- **`read name`** — read one line from stdin into variable `name`.
- **`read -p "Enter name: " name`** — prompt and read in one step (bash).
- **`read -r line`** — read raw (don’t interpret backslashes).

## 2. Using the input

After `read`, use `"$name"` (quoted) so spaces are preserved. Example:

```bash
read -p "Your name: " name
echo "Hello, $name"
```

## 3. Confirmations

Common pattern for “proceed? (y/n)”:

```bash
read -p "Continue? (y/n) " answer
if [[ "$answer" == [yY] ]]; then
  echo "Proceeding..."
else
  echo "Aborted."
fi
```

See `confirm.sh` for a full example.

## 4. Piping and read

- **`echo "alice" | read name`** — in a pipeline, `read` runs in a subshell, so `name` may be empty in the current shell. Prefer **`read name <<< "alice"`** (here-string) or **`read name < file`** when you want the variable in the current shell.

Use `read` for interactive scripts; use arguments (`$1`, `$2`) or environment variables for non-interactive use.
