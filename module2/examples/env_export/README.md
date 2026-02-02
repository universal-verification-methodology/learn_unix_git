# Environment variables and export example

Practice **setting**, **exporting**, and **inheriting** environment variables in the shell and in scripts.

## Layout

```
env_export/
├── README.md       # this file
├── show_var.sh     # prints MY_VAR (chmod u+x)
└── commands_to_try.txt
```

## Try these (from repo root)

```bash
cd module2/examples/env_export
MY_VAR=hello
echo $MY_VAR
bash -c 'echo $MY_VAR'
export MY_VAR
bash -c 'echo $MY_VAR'
chmod u+x show_var.sh
./show_var.sh
MY_VAR=overridden ./show_var.sh
unset MY_VAR
```

See `commands_to_try.txt` for a compact list.

## 1. Set vs export

- **`VAR=value`** — set variable in **current shell** only. Child processes (e.g. a script) do **not** see it.
- **`export VAR=value`** — set and **export**; child processes inherit it.
- **`unset VAR`** — remove the variable.

## 2. Why export matters

When you run `./script.sh`, the script runs in a **subprocess**. It only sees variables that were **exported** in the parent shell. So `PATH` is visible in scripts because it is exported by default; a variable you set with `MY_VAR=foo` is not visible unless you `export MY_VAR`.

## 3. One-shot override

- **`MY_VAR=value ./script.sh`** — run the script with `MY_VAR` set (and exported) only for that command. Useful for passing a value without changing your shell.

## 4. In scripts

To make a variable available to commands the script runs, use `export MY_VAR` in the script. To avoid affecting the parent shell, scripts run in a subshell, so exports inside the script only affect the script and its children.
