# Environment file example

Practice **loading variables** from a file (e.g. config or .env-style) with `source` or `set -a`.

## Layout

```
env_file/
├── README.md       # this file
├── sample.env      # KEY=value lines (no spaces around =)
├── use_env.sh      # sources sample.env and prints (chmod u+x)
└── commands_to_try.txt
```

## Try these (from repo root)

```bash
cd module8/examples/env_file
source sample.env
echo $MY_VAR
echo $ANOTHER_VAR
chmod u+x use_env.sh
./use_env.sh
export $(grep -v '^#' sample.env | xargs)
echo $MY_VAR
```

See `commands_to_try.txt` for a compact list.

## 1. source (dot)

- **`source file`** or **`. file`** — run the file in the **current shell**. Variables and functions defined there stay in the shell (or script).
- **`source config.env`** — if `config.env` contains `MY_VAR=hello`, after sourcing, `echo $MY_VAR` prints `hello`.

## 2. File format

- **`KEY=value`** — one per line; no spaces around `=`. No `export` needed if you source in the same shell that runs commands.
- **`# comment`** — lines starting with `#` are ignored if you filter them (e.g. `grep -v '^#'`).

## 3. In scripts

- **At top of script**: `source "$(dirname "$0")/config.env"` — load config from script’s directory. Then `$MY_VAR` is set for the rest of the script.
- **Optional**: Check if file exists: `[[ -f config.env ]] && source config.env`.

## 4. export from file (one-liner)

- **`export $(grep -v '^#' sample.env | xargs)`** — load KEY=value lines and export them (no spaces in values). Use with care; not safe for values with spaces or special characters. Prefer sourcing a script that does `export VAR=value`.

Use env files for local config (paths, flags) so the same script can run with different settings without editing the script.
