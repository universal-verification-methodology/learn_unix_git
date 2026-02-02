# Tar archives example

Practice **creating** and **extracting** `.tar.gz` archives with `tar czf` and `tar xzf`.

## Layout

```
tar_archives/
├── README.md       # this file
└── demo_dir/       # sample directory to archive
    ├── file1.txt
    ├── file2.txt
    └── subdir/
        └── file3.txt
```

## Try these (from repo root)

```bash
cd module5/examples/tar_archives

# Create archive (c = create, z = gzip, f = file)
tar czf demo.tar.gz demo_dir/

# List contents without extracting
tar tzf demo.tar.gz

# Extract to current directory
mkdir -p /tmp/tar_extract
cd /tmp/tar_extract
tar xzf /path/to/learn_unix_git/module5/examples/tar_archives/demo.tar.gz
ls -la demo_dir/
```

Or extract in place (from module5/examples/tar_archives):

```bash
cd module5/examples/tar_archives
tar xzf demo.tar.gz
# demo_dir/ will appear (or overwrite existing)
```

## 1. Creating archives

- **`tar czf archive.tar.gz dir/`** — create a **gzip-compressed** archive of `dir/`.
  - **c** = create, **z** = gzip, **f** = file (next argument is the archive name).
- **`tar cf archive.tar dir/`** — create **uncompressed** tar (no **z**).

## 2. Listing and extracting

- **`tar tzf archive.tar.gz`** — **list** contents (t = list).
- **`tar xzf archive.tar.gz`** — **extract** (x = extract) to current directory.

## 3. What to exclude

When archiving a project, often exclude build output and logs:

- **build/**, **out/**, **obj/**
- **\*.log**, **\*.o**, **\*.vcd** (or include only if needed)

Use patterns similar to `.gitignore` so archives stay small and portable.
