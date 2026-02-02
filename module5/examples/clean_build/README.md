# Clean build example

Practice **cleaning build outputs** safely: listing first, then removing generated files and directories.

## Layout

```
clean_build/
├── README.md       # this file
├── sample_project/ # mock project with build/ and logs/
│   ├── build/
│   │   ├── output.o
│   │   ├── output.tmp
│   │   └── wave.vcd
│   ├── logs/
│   │   └── run.log
│   ├── src/
│   │   └── main.v
│   └── tb/
│       └── test_main.v
└── clean.sh        # script that cleans build/ and logs/ (chmod u+x)
```

## Try these (from repo root)

```bash
cd module5/examples/clean_build/sample_project
find build logs -type f
find build logs -type f -delete
# Or use the script:
cd ..
chmod u+x clean.sh
./clean.sh
ls sample_project/build sample_project/logs
```

## 1. List before deleting

- **`find build -type f`** — list all files under `build/`.
- **`find build -name "*.o"`** — list only `.o` files.
- **`find build -name "*.vcd"`** — list waveform/log files.

Always **list first** to confirm you’re removing the right things.

## 2. Remove files

- **`find build -type f -delete`** — remove all files under `build/` (directories stay).
- **`rm -rf build/*`** — remove everything inside `build/` (keeps `build/` dir).
- **`rm -rf build`** — remove `build/` and everything inside.

Use **`-delete`** or **`rm`** only after confirming paths. Never run `rm -rf` with a variable or path you didn’t check.

## 3. Script pattern

A typical clean script:

1. Change to project root (or use absolute path).
2. List what will be removed (dry run or echo).
3. Remove only known build/output dirs (e.g. `build/`, `logs/`).
4. Optionally use `find ... -delete` or `rm -rf build logs`.

See `clean.sh` for a minimal example.

## 4. .gitignore

Add `build/`, `logs/`, `*.vcd`, `*.o` to `.gitignore` so generated files are never committed. Clean scripts then only affect local outputs.
