# Module 5 Examples

Hands-on examples for **Editors, Projects & Archives**: editor basics, project structure, find/grep, tar, zip, and backup.

---

## 1. Editor (`editor/`)

Practice **opening** files from the terminal and **core operations** (edit, save, search) in nano or VS Code.

**Layout**: `sample.v`, `sample.txt` (files to open).

**Try these** (from repo root):

```bash
cd module5/examples/editor
nano sample.txt
code sample.v
```

See `editor/README.md` for nano shortcuts and digital design context.

---

## 2. Project structure (`project_structure/`)

Practice a **simple project layout**: src/, tb/, docs/, scripts/, build/.

**Layout**: `sample_project/` with src/main.v, tb/test_main.v, docs/notes.md, scripts/build.sh, build/.gitkeep.

**Try these** (from repo root):

```bash
cd module5/examples/project_structure/sample_project
ls -la
ls src tb docs scripts build
find . -type f
tree .
```

See `project_structure/README.md` for naming and layout rationale.

---

## 3. Find and grep (`find_grep/`)

Practice **find** (by name) and **grep -R** (by content) across a small project.

**Layout**: `src/top.v`, `src/util.v`, `tb/tb_top.v` (contain keyword CLOCK_SIGNAL).

**Try these** (from repo root):

```bash
cd module5/examples/find_grep
find . -name "*.v"
find . -name "top*"
grep -R "CLOCK_SIGNAL" .
grep -Rn "CLOCK_SIGNAL" .
grep -Rl "CLOCK_SIGNAL" .
```

See `find_grep/README.md` for find/grep options.

---

## 4. Tar archives (`tar_archives/`)

Practice **creating** and **extracting** `.tar.gz` archives.

**Layout**: `demo_dir/` with file1.txt, file2.txt, subdir/file3.txt.

**Try these** (from repo root):

```bash
cd module5/examples/tar_archives
tar czf demo.tar.gz demo_dir/
tar tzf demo.tar.gz
tar xzf demo.tar.gz -C /tmp
ls -la /tmp/demo_dir
```

See `tar_archives/README.md` for tar options and what to exclude.

---

## 5. Zip archives (`zip_archives/`)

Practice **creating** and **extracting** `.zip` archives.

**Layout**: `demo_dir/` with file1.txt, file2.txt, subdir/file3.txt.

**Try these** (from repo root):

```bash
cd module5/examples/zip_archives
zip -r demo.zip demo_dir/
unzip -l demo.zip
unzip demo.zip -d /tmp
ls -la /tmp/demo_dir
```

See `zip_archives/README.md` for zip/unzip and tar vs zip.

---

## 6. Backup (`backup/`)

Practice **timestamped archives** and **what to exclude** from backups.

**Layout**: `backup_demo.sh` (chmod u+x to run; creates timestamped tar.gz of sample_project).

**Try these** (from repo root):

```bash
cd module5/examples/backup
chmod u+x backup_demo.sh
./backup_demo.sh
ls -la backup_*.tar.gz
tar tzf backup_sample_project_YYYYMMDD_HHMMSS.tar.gz
```

Or manual: `tar czf "backup_$(date +%Y%m%d).tar.gz" project_dir/`

See `backup/README.md` for exclude patterns and preparing for Git.

---

## 7. Diff and patch (`diff_patch/`)

Practice **comparing files** with `diff` and **applying changes** with `patch`.

**Layout**: `original.txt`, `modified.txt`, `another.txt`.

**Try these** (from repo root):

```bash
cd module5/examples/diff_patch
diff original.txt modified.txt
diff -u original.txt modified.txt
diff -u original.txt modified.txt > change.patch
patch original.txt < change.patch
```

See `diff_patch/README.md` for unified diff and patch -R (reverse).

---

## 8. Clean build (`clean_build/`)

Practice **cleaning build outputs** safely: list first, then remove generated files.

**Layout**: `sample_project/` with build/, logs/, src/, tb/; `clean.sh` (chmod u+x).

**Try these** (from repo root):

```bash
cd module5/examples/clean_build/sample_project
find build logs -type f
find build logs -type f -delete
cd ..
./clean.sh
```

See `clean_build/README.md` for list-before-delete and .gitignore.

---

## 9. sed basics (`sed_basics/`)

Practice **simple substitution** and line operations with `sed`.

**Layout**: `sample.txt`, `config_like.txt`.

**Try these** (from repo root):

```bash
cd module5/examples/sed_basics
sed 's/old/new/' sample.txt
sed 's/old/new/g' sample.txt
sed -n '2p' sample.txt
sed '2d' sample.txt
```

See `sed_basics/README.md` for s///g and -i (in-place).

---

## 10. Relative symlinks (`link_relative/`)

Practice **relative symlinks** with `ln -s` so links work when the project is moved.

**Layout**: `project/` (src/, external/), `shared/lib.v`. Create link: `cd project && ln -s ../../shared/lib.v external/lib.v`.

**Try these**:

```bash
cd module5/examples/link_relative/project
ln -s ../../shared/lib.v external/lib.v
ls -la external/
readlink external/lib.v
```

See `link_relative/README.md` for relative vs absolute and project layout.
