# Paths example: absolute vs relative

Practice **absolute** and **relative** paths so you can jump between directories confidently.

## Concepts

- **Relative path**: From your current directory (e.g. `cd src`, `cd ..`, `cd ../viewing`).
- **Absolute path**: From the root of the filesystem (e.g. `/home/user/proj`) or from your home directory (`~`).

`~` is shorthand for your home directory. `..` is the parent directory; `.` is the current directory.

---

## 1. Relative paths from this folder

From **repo root** (the directory that contains `module1/`):

```bash
cd module1/examples/paths
pwd
ls -la
```

Go up one level (into `examples/`):

```bash
cd ..
pwd
ls
```

Go up again (into `module1/`):

```bash
cd ..
pwd
```

Go back down using only relative paths:

```bash
cd examples/paths
pwd
```

---

## 2. Absolute path and home

From anywhere, you can jump to this folder if you know the full path. Replace `$USER` with your username if needed:

```bash
cd /home/$USER/proj/learn_unix_git/module1/examples/paths
pwd
```

Or from repo root, using the shell variable that points to the current directory:

```bash
cd "$(pwd)/module1/examples/paths"
pwd
```

Go to your **home directory**:

```bash
cd ~
pwd
cd ~/proj/learn_unix_git/module1/examples/paths
pwd
```

---

## 3. Mixing relative and absolute

From `module1/examples/paths`:

- `cd ../../..`  → repo root (three levels up)
- `cd ../../viewing`  → `module1/examples/viewing`
- `cd ../../../docs`  → repo `docs/`

From repo root:

- `cd module1/examples/navigation/sample_repo`  → sample repo
- `cd module1/examples/viewing`  → viewing example

---

## 4. Why it matters for RTL/verification

In real projects you'll often do:

- `cd project/src`  then  `cd ../tb`  (relative)
- Or open a terminal "in" a folder and use paths relative to that (e.g. `./scripts/build.sh`).

Being comfortable with `..` and relative paths keeps your commands short and portable.
