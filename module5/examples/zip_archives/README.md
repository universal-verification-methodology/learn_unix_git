# Zip archives example

Practice **creating** and **extracting** `.zip` archives with `zip -r` and `unzip`.

## Layout

```
zip_archives/
├── README.md       # this file
└── demo_dir/       # sample directory to archive
    ├── file1.txt
    ├── file2.txt
    └── subdir/
        └── file3.txt
```

## Try these (from repo root)

```bash
cd module5/examples/zip_archives

# Create archive (-r = recursive)
zip -r demo.zip demo_dir/

# List contents without extracting
unzip -l demo.zip

# Extract to current directory
unzip demo.zip
# or extract to a specific directory:
mkdir -p /tmp/zip_extract
unzip demo.zip -d /tmp/zip_extract
ls -la /tmp/zip_extract/demo_dir/
```

## 1. Creating archives

- **`zip -r archive.zip dir/`** — create a zip of `dir/` and its contents (**-r** = recursive).
- **`zip archive.zip file1 file2`** — zip specific files (no -r needed for flat list).

## 2. Listing and extracting

- **`unzip -l archive.zip`** — **list** contents without extracting.
- **`unzip archive.zip`** — **extract** to current directory.
- **`unzip archive.zip -d /path/to/dir`** — extract into **/path/to/dir**.

## 3. Tar vs zip

- **tar.gz** — common on Linux/macOS; `tar czf` / `tar xzf`.
- **zip** — common on Windows and for sharing; `zip -r` / `unzip`.

Use zip when sharing with Windows users or when the recipient expects a `.zip` file.
