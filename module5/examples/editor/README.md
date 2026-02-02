# Editor example

Practice **opening** files from the terminal and performing **core operations** (edit, save, search) in your chosen editor.

## Layout

```
editor/
├── README.md       # this file
├── sample.v        # sample Verilog-style file to open
└── sample.txt      # plain text file to open
```

## Try these (from repo root)

**1. Open a file from the terminal**

**nano** (terminal editor):

```bash
cd module5/examples/editor
nano sample.txt
```

- Edit text, then **Ctrl+O** to save, **Enter**, **Ctrl+X** to exit.
- **Ctrl+W** to search within the file.

**VS Code** (if installed):

```bash
code module5/examples/editor/sample.v
```

Or from inside the directory: `code sample.v`.

**2. Core operations in any editor**

- **Open** — from terminal: `nano file` or `code file`.
- **Search** — nano: Ctrl+W; VS Code: Ctrl+F (or Cmd+F).
- **Save** — nano: Ctrl+O then Enter; VS Code: Ctrl+S.
- **Close** — nano: Ctrl+X; VS Code: close tab or window.

**3. Digital design context**

Open `.v`, `.sv`, `.cpp`, `.md`, and config files the same way: `nano src/top.v` or `code tb/testbench.sv`. Keeping RTL and testbenches in a clear layout (e.g. `src/`, `tb/`) makes them easy to open from the shell.
