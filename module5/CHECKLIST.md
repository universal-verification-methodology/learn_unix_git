# Module 5 Exercises

Work through these exercises to reinforce **Editors, Projects & Archives**. Do them in your terminal; check off each when done.

Full exercise list: [docs/MODULE5.md#exercises](../docs/MODULE5.md#exercises).

---

## Exercise 1: Editor Warm-Up

- [ ] Choose your primary editor (e.g. nano or VS Code).
- [ ] Open a Verilog or text file (e.g. `module5/examples/editor/sample.v` or `sample.txt`).
- [ ] Search for a specific word (nano: Ctrl+W; VS Code: Ctrl+F).
- [ ] Make an edit.
- [ ] Save and close the file.

---

## Exercise 2: Project Layout

- [ ] Create a new directory `unix_course_project` (e.g. in ~/unix_practice).
- [ ] Inside it, create `src/`, `tb/`, `docs/`, `scripts/`, and `build/`.
- [ ] Create simple placeholder files in each (e.g. `src/main.txt`, `tb/test.txt`).

  ```bash
  mkdir -p ~/unix_practice/unix_course_project/{src,tb,docs,scripts,build}
  touch ~/unix_practice/unix_course_project/src/main.txt
  touch ~/unix_practice/unix_course_project/tb/test.txt
  touch ~/unix_practice/unix_course_project/docs/notes.txt
  touch ~/unix_practice/unix_course_project/scripts/build.sh
  ls -la ~/unix_practice/unix_course_project
  ```

---

## Exercise 3: Searching in Projects

- [ ] In `src/` and `tb/`, create a few files that contain a common keyword (e.g. `CLOCK_SIGNAL`).
- [ ] Use `grep -R "CLOCK_SIGNAL" .` from the project root to find all usages.
- [ ] Try the same with your editor’s multi-file search feature.

  You can use `module5/examples/find_grep` as a sample: `cd module5/examples/find_grep && grep -R "CLOCK_SIGNAL" .`

---

## Exercise 4: Creating and Extracting Archives

- [ ] From the parent directory of `unix_course_project`, run:
  - `tar czf unix_course_project.tar.gz unix_course_project`
  - `zip -r unix_course_project.zip unix_course_project`
- [ ] Move or rename `unix_course_project`, then extract each archive into a new directory and verify structure and contents.

  ```bash
  cd ~/unix_practice
  tar czf unix_course_project.tar.gz unix_course_project
  zip -r unix_course_project.zip unix_course_project
  mv unix_course_project unix_course_project_orig
  tar xzf unix_course_project.tar.gz
  unzip unix_course_project.zip -d unzip_out
  ls -la unix_course_project unzip_out
  ```

---

## Exercise 5: Backup Habit

- [ ] Create a timestamped archive for backup:
  - Example: `tar czf unix_course_project_$(date +%Y%m%d).tar.gz unix_course_project`
- [ ] Verify that the archive exists and can be extracted.

  ```bash
  cd ~/unix_practice
  tar czf "unix_course_project_$(date +%Y%m%d).tar.gz" unix_course_project
  ls -la *.tar.gz
  tar tzf unix_course_project_*.tar.gz
  ```

---

## Optional: Use the examples

All exercises can be done in your home or project directories. You can also run the example commands in `module5/examples/` to see editor, project structure, find/grep, tar, zip, and backup in action.

```bash
./scripts/module5.sh --check   # self-check
./scripts/module5.sh --demo    # print demo commands
```
