# Module 1 Exercises

Work through these exercises to reinforce **Linux & Shell Basics**. Do them in your terminal; check off each when done.

Full exercise list: [docs/MODULE1.md#exercises](../docs/MODULE1.md#exercises).

---

## Exercise 1: Hello Terminal

- [ ] Open a terminal.
- [ ] Run `pwd` and note the result.
- [ ] Use `ls` to list files, then `ls -la` to view hidden files.

---

## Exercise 2: Directory Navigation

- [ ] Create a directory called `unix_practice` in your home directory:
  ```bash
  mkdir ~/unix_practice
  ```
- [ ] Inside `unix_practice`, create subdirectories `notes` and `projects`:
  ```bash
  mkdir ~/unix_practice/notes ~/unix_practice/projects
  ```
- [ ] Practice moving between these directories using **only relative paths**:
  ```bash
  cd ~/unix_practice
  cd notes
  cd ..
  cd projects
  cd ..
  pwd
  ```

---

## Exercise 3: File Operations

- [ ] In `notes`, create a file `readme.txt` with some text using `nano`:
  ```bash
  cd ~/unix_practice/notes
  nano readme.txt
  ```
  (Type text, then Ctrl+O to save, Enter, Ctrl+X to exit.)
- [ ] Copy `readme.txt` to `notes/readme_copy.txt`:
  ```bash
  cp readme.txt readme_copy.txt
  ```
- [ ] Move `readme_copy.txt` into `projects/` and rename it to `project_notes.txt`:
  ```bash
  mv readme_copy.txt ../projects/project_notes.txt
  ```
- [ ] Delete `project_notes.txt`:
  ```bash
  rm ../projects/project_notes.txt
  ```

---

## Exercise 4: Viewing Files

- [ ] Create a text file with at least 30 lines (or use the provided sample):
  ```bash
  # Option A: from repo root (learn_unix_git), copy the module example file
  cp module1/examples/viewing/sample_for_viewing.txt ~/unix_practice/notes/longfile.txt
  # Option B: create your own (e.g. copy a log or use a script)
  ```
- [ ] Use `head` and `tail` to view the beginning and end:
  ```bash
  head -n 10 ~/unix_practice/notes/longfile.txt
  tail -n 10 ~/unix_practice/notes/longfile.txt
  ```
- [ ] Use `less` to scroll through the file and search for a specific word:
  ```bash
  less ~/unix_practice/notes/longfile.txt
  ```
  (Press `/`, type a word, Enter; use `n` for next match, `q` to quit.)

---

## Exercise 5: Help and Documentation

- [ ] Use `man ls` to find at least two useful flags and try them:
  ```bash
  man ls
  # e.g. try: ls -l, ls -t, ls -S
  ```
- [ ] Use `ls --help` and compare it with the `man` page.
- [ ] Use tab completion to type a few commands and paths more quickly (e.g. type `cd ~/unix_` then Tab).

---

## Optional: Use This Scaffold

To get the `unix_practice` directory and a sample long file without typing every command:

```bash
# From repo root
./scripts/module1.sh --scaffold
```

This creates `~/unix_practice/notes/`, `~/unix_practice/projects/`, and copies `module1/examples/viewing/sample_for_viewing.txt` into `~/unix_practice/notes/longfile.txt`. You can then do the exercises above in that directory.
