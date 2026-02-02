# realpath and canonical paths example

Practice **resolving paths** to an absolute, canonical form with `realpath` and `readlink -f`.

## Layout

```
realpath/
├── README.md       # this file
├── a_file.txt
└── link_to_file    # symlink to a_file.txt (create if missing: ln -s a_file.txt link_to_file)
```

## Try these (from repo root)

```bash
cd module2/examples/realpath
pwd
realpath .
realpath a_file.txt
realpath link_to_file
readlink -f .
readlink -f link_to_file
cd /tmp
realpath /home/user/proj/learn_unix_git/module2/examples/realpath/../realpath
```

## 1. realpath

- **`realpath path`** — resolve to an **absolute** path with no `..`, `.`, or symlink segments. Must exist (or use `realpath -m` on some systems to allow missing).
- **`realpath .`** — absolute path of current directory.
- **`realpath file`** — absolute path of that file (follows symlinks).

## 2. readlink -f

- **`readlink -f path`** — similar: canonical absolute path, following symlinks. Common on Linux; `realpath` is often clearer and more portable (GNU coreutils).

## 3. When to use

- **Scripts**: Get the absolute path of the script’s directory: `SCRIPT_DIR=$(realpath "$(dirname "$0")")`.
- **Compare paths**: Two paths might refer to the same file; `realpath` both and compare strings.
- **No symlinks in path**: `realpath` resolves symlinks in the path, so you get the real location.

## 4. Create symlink for this example

If `link_to_file` is missing:

```bash
cd module2/examples/realpath
ln -s a_file.txt link_to_file
realpath link_to_file
```

You should see the same path as `realpath a_file.txt`.
