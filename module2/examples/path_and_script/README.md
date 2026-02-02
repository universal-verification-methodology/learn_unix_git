# PATH and scripts example

See **why you must use ./script.sh** to run a script in the current directory, and how **PATH** affects which command runs.

## Layout

```
path_and_script/
├── README.md       # this file
└── local_cmd.sh    # script in this directory (already executable)
```

## Try these (from repo root)

**1. Run the script by path (works):**

```bash
cd module2/examples/path_and_script
./local_cmd.sh
```

**2. Try without ./ (usually fails):**

```bash
local_cmd.sh
```

You should get something like "command not found". The shell looks for a command named `local_cmd.sh` in every directory listed in **PATH**. The current directory (`.`) is **not** in PATH by default, so the shell never runs `./local_cmd.sh` unless you type the path.

**3. See what PATH contains:**

```bash
echo $PATH
```

None of those entries is "the current directory", so `local_cmd.sh` is not found. Using `./local_cmd.sh` tells the shell exactly which file to run.

**4. Why PATH exists**

PATH lets you type `ls` or `git` from any directory because their directories (e.g. `/usr/bin`) are in PATH. Scripts in your project are usually **not** in PATH, so you run them with a path: `./script.sh` or `./scripts/build.sh`.

## Summary

| You type       | Shell does                         | Result        |
|----------------|------------------------------------|---------------|
| `local_cmd.sh` | Searches PATH for `local_cmd.sh`   | Not found     |
| `./local_cmd.sh` | Runs file `./local_cmd.sh`        | Runs script   |

This is why module 2 permissions example uses `./hello.sh` after `chmod u+x hello.sh`.
