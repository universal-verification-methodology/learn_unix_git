# Here document example

Practice **here documents** (`<<EOF`) to feed multi-line input to a command or script without a separate file.

## Layout

```
here_doc/
├── README.md       # this file
└── read_stdin.sh   # reads lines from stdin (chmod u+x)
```

## Try these (from repo root)

```bash
cd module3/examples/here_doc
chmod u+x read_stdin.sh
./read_stdin.sh <<EOF
line one
line two
line three
EOF
cat <<EOF
Hello
Multi-line
Text
EOF
grep "two" <<EOF
one
two
three
EOF
```

## 1. Basic here document

**`command <<EOF`** … **`EOF`** — everything between the two `EOF` markers is sent to the command’s **stdin**. The delimiter (EOF) can be any word; use the same word at start and end.

- **`cat <<EOF`** … **`EOF`** — cat prints the lines (like a small inline file).
- **`grep "pattern" <<EOF`** … **`EOF`** — grep searches in that text.

## 2. Quoting the delimiter

- **`<<EOF`** — variable expansion happens (e.g. `$HOME` is expanded).
- **`<<'EOF'`** — no expansion; literal text. Use when you want to pass literal `$VAR` to the command.

## 3. When to use

- **Scripts**: Feed a config block or list to a command: `my_tool <<CONFIG` … `CONFIG`.
- **One-off**: Multi-line input without creating a temp file.
- **Tests**: Pipe or here-doc sample input into a program.

## 4. read_stdin.sh

The script reads stdin line by line and echoes it. Run it with `./read_stdin.sh <<EOF` … `EOF` to see the here-doc as its input.
