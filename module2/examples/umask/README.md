# Umask example

Practice **default permissions** for new files and directories with `umask`.

## Layout

```
umask/
├── README.md       # this file
└── create_demo.sh  # script that creates a file and dir (chmod u+x to run)
```

## Try these (from repo root)

```bash
cd module2/examples/umask
umask
umask -S
touch before.txt
mkdir before_dir
ls -l before.txt before_dir
umask 0022
umask 0002
touch after.txt
mkdir after_dir
ls -l after.txt after_dir
chmod u+x create_demo.sh
./create_demo.sh
```

## 1. What is umask?

**`umask`** sets the **default permissions** for newly created files and directories. It is a mask: bits that are **set** in umask are **cleared** in the resulting permission.

- **Default often 0022** — new files get `644` (rw-r--r--), new dirs get `755` (rwxr-xr-x).
- **umask 0002** — new files get `664`, new dirs get `775` (group can write).

## 2. Viewing umask

- **`umask`** — show numeric umask (e.g. 0022).
- **`umask -S`** — show symbolic form (e.g. u=rwx,g=rx,o=rx).

## 3. Setting umask

- **`umask 0022`** — typical restrictive default.
- **`umask 0002`** — allow group write (common in shared project dirs).

Changing umask affects only the current shell and child processes. To make it permanent, add `umask 0002` (or your choice) to `~/.bashrc` or `~/.profile`.

## 4. Why it matters

In shared project directories (e.g. course repos, team RTL), a looser umask (0002) lets teammates create files that others in the group can edit. Check with `umask` and `ls -l` after creating a file or directory.
