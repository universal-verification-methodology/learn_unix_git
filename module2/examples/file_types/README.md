# File types example

Practice reading **ls -l** output and working with **regular files**, **directories**, and **symbolic links**.

## Layout

```
file_types/
├── README.md       # this file
├── sample.txt      # regular file (-)
├── subdir/         # directory (d)
├── my_symlink      # symlink (l) → sample.txt
└── broken_link    # broken symlink (l) → missing target
```

## Try these (from repo root)

```bash
cd module2/examples/file_types
ls -l
ls -l my_symlink
readlink my_symlink
cat my_symlink
readlink broken_link
ls -l broken_link
```

Optional: create a symlink with `ln -s sample.txt my_copy_link`, then `rm my_copy_link`. See below for details.

## 1. Long listing (ls -l)

From this directory:

```bash
cd module2/examples/file_types
ls -l
```

Interpret the first column:

| First char | Meaning        | Example |
|------------|----------------|---------|
| `-`        | Regular file   | `-rw-r--r--` for sample.txt |
| `d`        | Directory      | `drwxr-xr-x` for subdir |
| `l`        | Symbolic link  | `lrwxrwxrwx` for my_symlink |

Other columns (left to right): permissions, link count, owner, group, size, date/time, name.

## 2. Inspect the symlink

```bash
ls -l my_symlink
cat my_symlink
readlink my_symlink
```

`readlink` prints the target path. Reading `my_symlink` shows the content of `sample.txt` because the link points to it.

**Broken symlink**: `broken_link` points to a target that does not exist. `readlink broken_link` still shows the target path; `cat broken_link` fails. `ls -l` shows the link with a broken target (often highlighted in red).

## 3. Create your own symlink (optional)

```bash
ln -s sample.txt my_copy_link
ls -l my_copy_link
readlink my_copy_link
rm my_copy_link   # remove the link when done (does not delete sample.txt)
```

**Note**: Removing a symlink with `rm` does **not** delete the target file.

## 4. Why symlinks matter

In design and tooling you may see symlinks for:

- Toolchain binaries (e.g. a `bin/` full of links to real installs)
- Build outputs pointing at shared or cached files
- Version or config switches (e.g. `gcc` → `gcc-12`)
