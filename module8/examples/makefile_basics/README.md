# Makefile basics example

Practice a **simple Makefile** for build, run, and clean targets (common in course and RTL projects).

## Layout

```
makefile_basics/
├── README.md       # this file
├── sample_project/ # minimal project with Makefile
│   ├── Makefile
│   ├── src/
│   │   └── main.v
│   ├── tb/
│   │   └── test_main.v
│   ├── build/
│   └── logs/
└── Makefile        # top-level example
```

## Try these (from repo root)

```bash
cd module8/examples/makefile_basics/sample_project
make
make run
make clean
make help
```

## 1. What is Make?

**Make** reads a **Makefile** and runs **targets** (e.g. `build`, `run`, `clean`) based on rules and dependencies. One command: `make` or `make build`.

## 2. Basic targets

- **`all`** (or first target) — default when you run `make`.
- **`build`** — compile or generate outputs (e.g. into `build/`).
- **`run`** — run simulation or tests (often calls a script).
- **`clean`** — remove generated files (e.g. `build/*`, `logs/*`).
- **`help`** — list available targets (optional but useful).

## 3. Simple rule syntax

```makefile
target: dependencies
	command
```

- **`target`** — name you run: `make target`.
- **`dependencies`** — files or other targets; if they change, the target is re-run.
- **`command`** — shell command(s); must be indented with a **tab**.

## 4. Example (conceptual)

```makefile
.PHONY: all build run clean help
all: build

build:
	@echo "Building..."
	mkdir -p build

run: build
	./scripts/run_demo.sh

clean:
	rm -rf build/* logs/*

help:
	@echo "Targets: all, build, run, clean, help"
```

See `sample_project/Makefile` for a minimal working example. Use `make` from the **project root** so paths in the Makefile are correct.
