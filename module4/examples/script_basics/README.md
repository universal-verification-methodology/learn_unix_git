# Script basics example

Practice **writing** and **running** a simple script with a shebang and comments.

## Layout

```
script_basics/
├── README.md       # this file
└── say_hello.sh    # prints a message (chmod u+x to run)
```

## Try these (from repo root)

```bash
cd module4/examples/script_basics
chmod u+x say_hello.sh
./say_hello.sh
bash say_hello.sh
```

## 1. Shebang

The first line `#!/usr/bin/env bash` tells the system to run the script with `bash`. Use `#!/usr/bin/env bash` so the script finds bash in the user's PATH (portable).

## 2. Running scripts

- **`./say_hello.sh`** — run the file in the current directory (requires execute bit: `chmod u+x say_hello.sh`).
- **`bash say_hello.sh`** — run with bash explicitly; no execute bit needed.

Prefer `./script.sh` for scripts you will reuse; it makes the script the "command."

## 3. Comments and readability

Lines starting with `#` are comments. Use them to explain what the script does and any important steps. Keep scripts short and readable so you can change them later.
