# Module 1 Examples

Hands-on examples for **Linux & Shell Basics**: navigation, paths, file operations, viewing files, getting help, and design-style layouts.

---

## 1. Navigation (`navigation/`)

A sample project-style directory structure so you can practice `pwd`, `ls`, `cd`, and paths.

**Layout**:

```
sample_repo/
├── src/      # source (e.g. RTL)
├── tb/       # testbenches
├── build/    # build outputs
└── README.txt
```

**Try these** (from this repo root):

```bash
cd module1/examples/navigation/sample_repo
pwd
ls
ls -la
cd src
pwd
ls
cd ..
cd tb
pwd
cd ../build
pwd
cd ../..
```

Use only **relative paths** (e.g. `cd ..`, `cd tb`) to get used to `.` and `..`.

---

## 2. Paths (`paths/`)

Practice **absolute** vs **relative** paths: `..`, `.`, `~`, and full paths.

**Try these** (from repo root):

```bash
cd module1/examples/paths
pwd
cd ..
cd examples/paths
cd ~
pwd
cd ~/proj/learn_unix_git/module1/examples/paths
```

See `paths/README.md` for more exercises.

---

## 3. File operations (`file_operations/`)

Practice **creating**, **copying**, **moving**, and **removing** files and directories in a safe sandbox.

**Try these**:

```bash
cd module1/examples/file_operations
ls -la
mkdir backup
cp original.txt copy.txt
mv copy.txt backup/
rm backup/copy.txt
rmdir backup
```

Full step-by-step: see `file_operations/README.md`.

---

## 4. Viewing files (`viewing/`)

Practice `cat`, `head`, `tail`, and `less` on small and multi-line files.

**Small file (use `cat`):**

```bash
cd module1/examples/viewing
cat short.txt
```

**Larger file (use `head`, `tail`, `less`):**

```bash
head -n 10 sample_for_viewing.txt
tail -n 10 sample_for_viewing.txt
less sample_for_viewing.txt
```

**In `less`**:

- `Space` or `Page Down`: next page  
- `b` or `Page Up`: previous page  
- `/pattern` then Enter: search forward  
- `n`: next match, `N`: previous match  
- `q`: quit  

---

## 5. Design-style files (`design_files/`)

A minimal RTL/verification-style layout with sample `.v`, `.sv`, `.md`, and `.cpp` files. Practice opening them from the shell.

**Try these**:

```bash
cd module1/examples/design_files
ls src tb docs sim
cat src/counter.v
cat docs/notes.md
less tb/tb_counter.sv
```

See `design_files/README.md` for the full layout.

---

## 6. Getting help (`help/`)

Practice **manual pages** and **inline help**.

```bash
man ls
ls --help
whatis ls
apropos directory
```

Tab-complete commands and paths (type a few letters, then Tab). Full list: see `help/README.md`.
