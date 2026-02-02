# Diff and patch example

Practice **comparing files** with `diff` and **applying changes** with `patch`.

## Layout

```
diff_patch/
├── README.md       # this file
├── original.txt    # baseline file
├── modified.txt    # changed version (for diff)
└── another.txt     # second file for side-by-side
```

## Try these (from repo root)

```bash
cd module5/examples/diff_patch
diff original.txt modified.txt
diff -u original.txt modified.txt
diff original.txt modified.txt > change.patch
patch original.txt < change.patch
diff -u original.txt modified.txt > change.patch
patch -p0 < change.patch
```

## 1. diff

- **`diff file1 file2`** — show line-by-line differences (default format).
- **`diff -u file1 file2`** — unified diff (like `git diff`); good for patches.
- **`diff -r dir1 dir2`** — compare directories recursively.

## 2. patch

- **`diff -u old new > change.patch`** — create a patch file (unified format).
- **`patch file < change.patch`** — apply patch to `file` (updates file in place).
- **`patch -R file < change.patch`** — reverse (undo) the patch.

## 3. Why it matters

- **Code review**: `diff -u` shows exactly what changed; same format as `git diff`.
- **Sharing changes**: Send a `.patch` file instead of whole files; recipient runs `patch` to apply.
- **Reverting**: Keep the patch; use `patch -R` to undo.

## 4. Git and diff

Git uses the same unified diff format. `git diff` and `git apply` work like diff/patch on tracked files. Use `diff`/`patch` for ad-hoc file comparisons or when Git isn’t involved.
