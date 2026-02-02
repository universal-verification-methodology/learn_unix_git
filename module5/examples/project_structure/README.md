# Project structure example

Practice a **simple project layout**: `src/`, `tb/`, `docs/`, `scripts/`, `build/` and clear naming.

## Layout

```
project_structure/
├── README.md           # this file
└── sample_project/    # example project tree
    ├── src/            # source code (e.g. RTL)
    │   └── main.v
    ├── tb/             # testbenches
    │   └── test_main.v
    ├── docs/           # documentation
    │   └── notes.md
    ├── scripts/        # helper scripts
    │   └── build.sh
    └── build/          # generated artifacts (often excluded from archives)
        └── .gitkeep
```

## Try these (from repo root)

```bash
cd module5/examples/project_structure/sample_project
ls -la
ls src tb docs scripts build
find . -type f
tree .
```

(Use `tree` if installed; otherwise `find .` or `ls -R`.)

## 1. Why this layout

- **src/** — source (e.g. Verilog RTL); one place for “real” code.
- **tb/** or **tests/** — testbenches and tests; separate from source.
- **docs/** — notes, specs, READMEs.
- **scripts/** — build, run, and helper scripts.
- **build/** or **out/** — generated files (object files, logs, waveforms). Often excluded from archives and version control.

## 2. Naming conventions

- Use **lowercase**, **hyphens** or **underscores**; avoid spaces in file and directory names.
- Use **descriptive names** for modules and testbenches (e.g. `counter.v`, `tb_counter.v`).

Align this layout with your course or team so everyone knows where to put source, tests, and build output.
