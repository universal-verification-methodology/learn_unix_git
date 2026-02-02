# Permissions example

Practice **viewing** and **changing** file permissions with `ls -l` and `chmod`, and run an executable script.

## Layout

```
permissions/
├── README.md     # this file
├── hello.sh      # script — make executable with chmod u+x
└── config.txt   # data file — practice chmod 644 / 600
```

## Try these (from repo root)

```bash
cd module2/examples/permissions
ls -l
ls -l hello.sh
chmod u+x hello.sh
ls -l hello.sh
./hello.sh
chmod 644 config.txt
ls -l config.txt
```

## 1. View permissions (ls -l)

```bash
cd module2/examples/permissions
ls -l hello.sh
```

The permission string (e.g. `-rw-r--r--`) has three groups: **user** (owner), **group**, **others**.

| Letter | Meaning   | For files      | For directories   |
|--------|------------|----------------|-------------------|
| r      | read       | Read contents  | List contents     |
| w      | write      | Modify file    | Create/remove files |
| x      | execute    | Run as program | Enter (cd)        |

Initially `hello.sh` has **no** `x` for the user, so you cannot run it as `./hello.sh` until you add execute.

## 2. Make the script executable (chmod)

**Symbolic mode** (common for scripts):

```bash
chmod u+x hello.sh
ls -l hello.sh
```

You should see `x` in the user column (e.g. `-rwxr--r--`). Then run:

```bash
./hello.sh
```

**Numeric mode** (optional): `chmod 755 hello.sh` gives owner rwx, group and others r-x.

**Quick reference** (numeric):

| Mode | Meaning        | Typical use           |
|------|----------------|------------------------|
| 644  | rw-r--r--      | Data files (read-only for others) |
| 755  | rwxr-xr-x      | Scripts others may run |
| 600  | rw-------      | Private (only you read/write)      |
| u+x  | add execute for user | Make script runnable: `chmod u+x script.sh` |

## 3. Why ./ is needed

The current directory (`.`) is usually **not** in `PATH` for security. So:

- `hello.sh` → shell looks for a command named `hello.sh` in PATH → often "command not found"
- `./hello.sh` → run the file `hello.sh` in the current directory → works after chmod u+x

## 4. What not to do

- Do **not** use `chmod 777 file` or `chmod a+w` unless you understand the risk (everyone can write/execute).
- Prefer `chmod u+x script.sh` to make only **your** user able to execute it.
