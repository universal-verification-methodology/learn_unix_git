# Design-style files example

A minimal **RTL/verification-style** layout with sample `.v`, `.sv`, `.md`, and `.cpp` files. Practice opening these from the shell with `cat` and `less` — the same way you'll inspect source in real projects.

## Layout

```
design_files/
├── README.md       # this file
├── src/            # "RTL" (Verilog)
│   └── counter.v
├── tb/             # testbench (SystemVerilog)
│   └── tb_counter.sv
├── docs/           # notes (Markdown)
│   └── notes.md
└── sim/            # C++ (e.g. Verilator test)
    └── main.cpp
```

## Try these

From **repo root**:

```bash
cd module1/examples/design_files
pwd
ls -la
ls src tb docs sim
```

**View small files with `cat`:**

```bash
cat src/counter.v
cat docs/notes.md
```

**View longer or scrollable files with `less`:**

```bash
less tb/tb_counter.sv
less sim/main.cpp
```

**Navigate between directories (like a real project):**

```bash
cd src
ls
cat counter.v
cd ../tb
cat tb_counter.sv
cd ..
```

In real digital design and verification work, you'll often open `.v`, `.sv`, `.cpp`, and `.md` from the terminal. Getting used to `cat` and `less` here will make that routine.
