# Template repository example

Practice **cloning** a project and **inspecting** its layout so you know where source, tests, scripts, and build output live.

## Layout

```
template/
├── README.md           # this file
└── sample_project/     # example project structure (like a cloned template)
    ├── src/
    ├── tb/
    ├── docs/
    ├── scripts/
    ├── build/
    └── logs/
```

## Try these (from repo root)

**1. Inspect the sample project**

```bash
cd module8/examples/template/sample_project
ls -la
ls src tb docs scripts build logs
find . -type f
tree .
```

(Use `tree` if installed; otherwise `find . -type f` or `ls -R`.)

**2. Typical layout (course-style)**

| Directory | Purpose |
|-----------|---------|
| **src/** | RTL, source code |
| **tb/** or **tests/** | Testbenches, tests |
| **docs/** | Notes, specs, README |
| **scripts/** | Run scripts (build, test, sim) |
| **build/** | Generated artifacts (often in .gitignore) |
| **logs/** | Log files (often in .gitignore) |

**3. If you were cloning a real template**

```bash
git clone <course-template-url> project_name
cd project_name
ls -la
git status
```

Run `git status` to confirm a clean working tree after clone. Then map out where to put new RTL, testbenches, and scripts.
