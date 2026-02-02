# Module 1 Examples

Hands-on examples for **Linux & Shell Basics**: navigation and viewing files.

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

## 2. Viewing files (`viewing/`)

A multi-line text file for practicing `cat`, `head`, `tail`, and `less`.

**Try these**:

```bash
cd module1/examples/viewing
cat sample_for_viewing.txt          # whole file (small)
head -n 10 sample_for_viewing.txt   # first 10 lines
tail -n 10 sample_for_viewing.txt   # last 10 lines
less sample_for_viewing.txt         # scroll: Space, b; search: /word, n; quit: q
```

**In `less`**:

- `Space` or `Page Down`: next page  
- `b` or `Page Up`: previous page  
- `/pattern` then Enter: search forward  
- `n`: next match, `N`: previous match  
- `q`: quit  

## 3. Getting help

```bash
man ls
ls --help
man pwd
man cd
```

Tab-complete commands and paths (type a few letters, then Tab).
