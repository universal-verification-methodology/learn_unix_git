# Environment example

Practice **inspecting** environment variables and **finding** which command the shell runs (`PATH`, `which`, `env`).

## 1. Key variables

```bash
echo $HOME
echo $USER
echo $SHELL
echo $PWD
```

`PWD` is your current directory; `HOME` is your home directory; `SHELL` is your login shell.

## 2. PATH and command resolution

```bash
echo $PATH
```

`PATH` is a list of directories, separated by `:`. When you type a command (e.g. `ls`), the shell looks in each directory **in order** for an executable with that name.

## 3. Which command runs? (which)

```bash
which bash
which ls
which git
which python
which iverilog
```

`which <command>` prints the **full path** of the executable that would run. If you get nothing or "not found", that command is not in your PATH.

**Common "command not found" causes**:

- Tool not installed
- Tool installed but its `bin/` directory not in PATH
- Typo in command name

## 4. List all environment variables (env / printenv)

```bash
env | head -20
printenv HOME
```

Use `env` or `printenv` to inspect variables; `printenv VAR` prints a single variable.

## 5. One-shot and session variables (optional)

**For one command only**:

```bash
MY_VAR=hello echo $MY_VAR
```

**For the rest of the shell session** (export):

```bash
export MY_VAR=hello
echo $MY_VAR
```

Unset when done: `unset MY_VAR`. Persistent configuration belongs in dotfiles (e.g. `~/.bashrc`), not in ad-hoc exports.

## 6. Why this matters for design/verification

- Simulators and tools (e.g. `iverilog`, `verilator`, `python`) must be on PATH or you get "command not found".
- Use `which iverilog` (etc.) to confirm the binary and path.
- Toolchains often require setting variables (e.g. `VERILATOR_ROOT`) before use; those are usually documented in the tool’s README.
