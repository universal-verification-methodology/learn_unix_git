# File operations example

Practice **creating**, **copying**, **moving**, and **removing** files and directories in a safe sandbox.

## Setup

From the repo root:

```bash
cd module1/examples/file_operations
ls -la
```

You should see `original.txt` and this README. The exercises below use only files you create or copy here, so you can experiment without breaking the course repo.

---

## 1. Create a directory

```bash
mkdir backup
ls -la
```

Create nested directories in one go:

```bash
mkdir -p archive/2024
ls -la archive
```

---

## 2. Copy a file

```bash
cp original.txt copy.txt
ls -la
cat copy.txt
```

Copy into a directory:

```bash
cp original.txt backup/
ls backup
```

---

## 3. Move (or rename) a file

Rename a file:

```bash
mv copy.txt renamed.txt
ls -la
```

Move a file into a directory:

```bash
mv renamed.txt backup/
ls backup
```

---

## 4. Remove files and directories

Remove a **file**:

```bash
rm backup/renamed.txt
ls backup
```

Remove an **empty** directory:

```bash
rmdir backup
```

If the directory is not empty, use:

```bash
rm -r archive
```

**Warning:** `rm -r` deletes a directory and everything inside it. Never run `rm -rf /` or `rm -rf ~` — it can wipe your system or home directory.

---

## 5. Quick recap

| Goal              | Command           |
|-------------------|-------------------|
| Create directory  | `mkdir name`      |
| Create with parents | `mkdir -p a/b/c` |
| Copy file         | `cp src dst`      |
| Copy into dir     | `cp file dir/`    |
| Move/rename       | `mv src dst`      |
| Remove file       | `rm file`         |
| Remove empty dir  | `rmdir dir`       |
| Remove dir + contents | `rm -r dir`  |

After practicing, you can remove the directories you created (e.g. `rm -r backup archive` if they exist) to leave the example folder clean.
