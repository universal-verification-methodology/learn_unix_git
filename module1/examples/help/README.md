# Getting help example

Practice **finding help** for shell commands: manual pages, `--help`, and discovery tools.

---

## 1. Manual pages (`man`)

Open the manual for a command:

```bash
man ls
```

Inside `man`:

- **Space** or **Page Down**: next page  
- **b** or **Page Up**: previous page  
- **/** then type a word and Enter: search forward (e.g. `/reverse`)  
- **n**: next match, **N**: previous match  
- **q**: quit  

Try:

```bash
man pwd
man cd
man mkdir
man cp
man rm
```

---

## 2. Inline help (`--help` or `-h`)

Many commands print a short help message:

```bash
ls --help
mkdir --help
cp --help
```

Compare with `man ls`: the man page is longer and more detailed; `--help` is quick reference.

---

## 3. One-line description (`whatis`)

See a one-line summary of a command:

```bash
whatis ls
whatis pwd
whatis cat
```

---

## 4. Search by keyword (`apropos`)

Find commands whose description matches a word:

```bash
apropos directory
apropos copy
apropos "list file"
```

Use quotes for multi-word search. Not every system has full apropos databases, but it's useful when available.

---

## 5. Tab completion

Type the start of a command or path, then press **Tab**:

```bash
pw<Tab>     # completes to pwd
cd mod<Tab> # completes to module1/ if you're in repo root
ls -<Tab>   # may list options (depends on shell)
```

Tab completion saves typing and reduces typos.

---

## Quick reference

| Goal              | Command           |
|-------------------|-------------------|
| Full manual       | `man command`     |
| Short help        | `command --help`  |
| One-line summary  | `whatis command`  |
| Search by keyword | `apropos keyword` |
