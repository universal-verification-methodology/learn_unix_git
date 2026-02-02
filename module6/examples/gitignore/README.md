# .gitignore example

Practice **excluding** generated and build files with a `.gitignore` file so they don’t appear in `git status` or get committed.

## Layout

```
gitignore/
├── README.md       # this file
├── sample.gitignore # copy to your repo root as .gitignore
└── build/          # sample dir; entries in sample.gitignore ignore build/
    └── output.tmp
```

## Try these (in a Git repo that has a build/ or similar)

**1. Copy the sample .gitignore**

```bash
cp module6/examples/gitignore/sample.gitignore /path/to/your/repo/.gitignore
cd /path/to/your/repo
```

Or create `.gitignore` manually with the contents of `sample.gitignore`.

**2. Add build/ and a dummy file**

```bash
mkdir -p build
touch build/output.tmp
git status
```

Without `.gitignore`, `build/output.tmp` would show as untracked.

**3. Create .gitignore and check again**

```bash
# If not already done:
cat module6/examples/gitignore/sample.gitignore > .gitignore
git status
```

`build/output.tmp` should no longer appear — Git ignores it.

**4. Common patterns for digital design**

- **build/**, **out/**, **obj/** — build output directories
- **\*.log** — log files
- **\*.vcd** — waveform dumps
- **\*.o**, **\*.a** — object/archive files

Align these with what your tools generate so you don’t commit large or regenerated files.

See `sample.gitignore` for a ready-to-use file you can copy into your project root as `.gitignore`.
