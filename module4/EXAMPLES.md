# Module 4 Examples

Hands-on examples for **Shell Productivity & Basic Scripting**: history and shortcuts, aliases, script basics, arguments, control flow, and safe scripting.

---

## 1. Command history (`history/`)

Practice **recalling** and **editing** previous commands with history and keyboard shortcuts.

**Layout**: README only (no runnable files — try commands in your shell).

**Try these** (in your terminal):

- `history` / `history | tail -20`
- **↑** / **↓** to move through history
- **Ctrl+A**, **Ctrl+E** (start/end of line); **Ctrl+U**, **Ctrl+K** (clear to start/end)
- **Ctrl+R** to search history

See `history/README.md` for full list.

---

## 2. Aliases (`aliases/`)

Practice **defining** and **using** aliases to shorten frequent commands.

**Layout**: `commands_to_try.txt` (copy-paste alias commands).

**Try these** (in your shell):

```bash
alias ll='ls -alF'
ll
alias cproj='cd ~/proj/learn_unix_git'
cproj
alias
```

See `aliases/README.md` for persisting in ~/.bashrc.

---

## 3. Script basics (`script_basics/`)

Practice **shebang**, **comments**, and **running** a simple script.

**Layout**: `say_hello.sh` (chmod u+x to run).

**Try these** (from repo root):

```bash
cd module4/examples/script_basics
chmod u+x say_hello.sh
./say_hello.sh
bash say_hello.sh
```

See `script_basics/README.md` for shebang and ./ vs bash.

---

## 4. Arguments (`arguments/`)

Practice **positional parameters** (`$1`) and **defaults** (`${1:-World}`).

**Layout**: `greet.sh` (chmod u+x to run).

**Try these**:

```bash
cd module4/examples/arguments
chmod u+x greet.sh
./greet.sh Alice
./greet.sh "Bob Smith"
./greet.sh
```

See `arguments/README.md` for $0, $1, "$@", quoting.

---

## 5. Control flow (`control_flow/`)

Practice **for** loops and **if** (file checks) for batch operations.

**Layout**: `count_lines.sh`, `a.log`, `b.log`, `c.log`.

**Try these**:

```bash
cd module4/examples/control_flow
chmod u+x count_lines.sh
./count_lines.sh
wc -l *.log
```

See `control_flow/README.md` for for/if patterns.

---

## 6. Safe scripting (`safe_scripting/`)

Practice **dry run**, **--confirm** flag, **set -e**, and **quoting**.

**Layout**: `clean_tmp.sh`, `tmp/cache1.tmp`, `tmp/cache2.tmp`.

**Try these**:

```bash
cd module4/examples/safe_scripting
chmod u+x clean_tmp.sh
./clean_tmp.sh
ls tmp/
./clean_tmp.sh --confirm
ls tmp/
```

See `safe_scripting/README.md` for defensive patterns.

---

## 7. Shell functions (`functions/`)

Practice **defining and using shell functions** in the current shell (vs scripts).

**Layout**: `commands_to_try.txt` (copy-paste function definitions).

**Try these** (in your shell):

```bash
cd module4/examples/functions
greet() { echo "Hello, $1"; }
greet Alice
count_lines() { wc -l "$@"; }
count_lines *.txt
declare -f greet
```

See `functions/README.md` for functions vs scripts and persisting in ~/.bashrc.

---

## 8. Read input (`read_input/`)

Practice **reading user input** with `read` and simple prompting.

**Layout**: `prompt_name.sh`, `confirm.sh` (chmod u+x to run).

**Try these**:

```bash
cd module4/examples/read_input
chmod u+x prompt_name.sh confirm.sh
./prompt_name.sh
./confirm.sh
```

See `read_input/README.md` for read -p, -r, and y/n confirmation patterns.

---

## 9. Exit codes (`exit_codes/`)

Practice **returning** and **checking** exit codes with `exit 0`, `exit 1`, and `$?`.

**Layout**: `success.sh`, `failure.sh`, `check_file.sh` (chmod u+x).

**Try these**:

```bash
cd module4/examples/exit_codes
./success.sh; echo $?
./failure.sh; echo $?
./check_file.sh README.md; echo $?
./check_file.sh missing.txt; echo $?
if ./success.sh; then echo "OK"; fi
```

See `exit_codes/README.md` for $? and set -e.

---

## 10. case statement (`case_statement/`)

Practice **multi-way branching** with `case $var in ... esac`.

**Layout**: `greet.sh` (chmod u+x), `commands_to_try.txt`.

**Try these**:

```bash
cd module4/examples/case_statement
./greet.sh hello
./greet.sh bye
./greet.sh other
```

See `case_statement/README.md` for patterns and when to use case.
