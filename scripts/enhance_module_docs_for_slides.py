#!/usr/bin/env python3
"""Inject Before You Start and Design Architecture sections into docs/MODULE*.md."""

from __future__ import annotations

import re
from pathlib import Path

COURSE_ROOT = Path(__file__).resolve().parent.parent

BEFORE_START: dict[int, str] = {
    1: """## Before You Start

Complete these setup steps once; repeat the self-check whenever you return to this module.

1. **Install a Unix-like environment**: Linux, macOS, or WSL2 on Windows. Open Terminal (or Windows Terminal → Ubuntu).
2. **Clone this course repo** (if needed): `git clone <repository-url>` then `cd learn_unix_git`.
3. **Make helper scripts executable**: `chmod +x scripts/*.sh` from the repo root.
4. **Verify Module 1**: `./scripts/module1.sh --check` — expect "All required checks passed".
5. **Create a practice workspace**: `./scripts/module1.sh --scaffold` creates `~/unix_practice/` for exercises.
6. **Work through the labs**: Open `module1/EXAMPLES.md` and run each numbered example in your own terminal.
7. **Regenerate slides/video** (optional): `./scripts/build_all_media.sh --module 1`.

""",
    2: """## Before You Start

1. **Complete Module 1** or be comfortable with `cd`, `ls`, `pwd`, and basic file commands.
2. **From the repo root**, run `./scripts/module2.sh --check` — all checks should pass.
3. **Scaffold practice files**: `./scripts/module2.sh --scaffold` copies `hello.sh` to `~/unix_practice/`.
4. **Open the labs index**: `module2/EXAMPLES.md` — run permissions, dotfiles, and environment examples.
5. **Keep `docs/MODULE2.md` open** for the detailed command reference while practicing.

""",
    3: """## Before You Start

1. **Complete Module 2** — you need permissions and environment basics.
2. **Self-check**: `./scripts/module3.sh --check` from the repo root.
3. **Scaffold**: `./scripts/module3.sh --scaffold` copies `sample.log` to `~/unix_practice/` for grep practice.
4. **Run each lab** in `module3/EXAMPLES.md`: redirection, pipes, grep, and process control.
5. **Use two terminals** when trying background jobs (`&`, `fg`, `bg`).

""",
    4: """## Before You Start

1. **Complete Module 3** — pipes, redirection, and grep should be familiar.
2. **Self-check**: `./scripts/module4.sh --check` from the repo root.
3. **Scaffold scripts**: `./scripts/module4.sh --scaffold` copies `say_hello.sh` and `greet.sh` to `~/unix_practice/`.
4. **Make scripts executable** after scaffold: `chmod u+x ~/unix_practice/*.sh`.
5. **Follow `module4/EXAMPLES.md`** — edit, run, and extend each script example.

""",
    5: """## Before You Start

1. **Complete Module 4** — basic shell scripting is assumed.
2. **Self-check**: `./scripts/module5.sh --check` from the repo root.
3. **Scaffold a project tree**: `./scripts/module5.sh --scaffold` creates `~/unix_practice/unix_course_project/` with `src/`, `tb/`, `docs/`, `scripts/`, `build/`.
4. **Choose an editor**: `nano` (terminal) or VS Code (`code .` if installed).
5. **Work through `module5/EXAMPLES.md`**: project layout, find/grep, tar/zip archives.

""",
    6: """## Before You Start

1. **Install Git**: run `git --version` — install from [git-scm.com](https://git-scm.com) or your package manager if missing.
2. **Optional GitHub account** for remote clone/push exercises later in the module.
3. **Self-check**: `./scripts/module6.sh --check` from the repo root.
4. **Scaffold a local repo**: `./scripts/module6.sh --scaffold` creates `~/unix_practice/git_demo/` with `git init` and an initial commit.
5. **Open `module6/EXAMPLES.md`** — walk through status, add, commit, log, diff, clone, and `.gitignore` labs.

""",
    7: """## Before You Start

1. **Complete Module 6** — local Git workflow (`add`, `commit`, `push`) must be comfortable.
2. **Use the Module 6 practice repo** or run `./scripts/module6.sh --scaffold` to recreate `~/unix_practice/git_demo/`.
3. **Self-check**: `./scripts/module7.sh --check` from the repo root.
4. **Open `module7/EXAMPLES.md`** — branches, merge, conflicts, submodules, and reflog.
5. **Use a throwaway clone** for merge/conflict practice so you do not damage real coursework.

""",
    8: """## Before You Start

1. **Complete Modules 1–7** or equivalent Unix and Git experience.
2. **Self-check**: `./scripts/module8.sh --check` from the repo root.
3. **Open the template project**: `module8/examples/template/sample_project/` — inspect `src/`, `tb/`, `scripts/`, `logs/`.
4. **Make the demo script executable**: `chmod u+x module8/examples/template/sample_project/scripts/run_demo.sh`.
5. **Run the end-to-end flow** in `module8/EXAMPLES.md`: script → log capture → grep → git commit → pre-push checklist.

""",
}

DESIGN_ARCH: dict[int, str] = {
    1: """## Design Architecture

### 1. Terminal and shell stack

- **Terminal emulator** — the window (GNOME Terminal, Windows Terminal, iTerm).
- **Shell (bash/zsh)** — reads your command line, expands paths, runs programs.
- **Kernel** — executes programs, manages files and processes.
- **Takeaway**: you type in the terminal; the shell interprets; the kernel does the work.

### 2. Filesystem and path model

- **Tree structure** — `/` root, home (`~`), current (`.`), parent (`..`).
- **Absolute paths** start at `/` or `~`; **relative paths** start from the current directory.
- **Verification repos** mirror this: `src/`, `tb/`, `build/` as sibling directories under a project root.

### 3. Command execution flow

- You enter a command → shell parses words and options → shell finds the program (via PATH or `./`) → program runs → stdout/stderr printed to terminal.
- **Self-check scripts** (`./scripts/module1.sh --check`) automate this verification for you.

""",
    2: """## Design Architecture

### 1. File permission model

- Every file has an **owner**, **group**, and **others** with **r/w/x** bits.
- **`ls -l`** shows type (file `−`, directory `d`, link `l`) and the permission triplet.
- Scripts need **`x`** (execute) on at least the owner to run as `./script.sh`.

### 2. Environment and PATH resolution

- **Environment variables** (`HOME`, `PATH`, `USER`) are inherited by child processes.
- **`PATH`** is a colon-separated list of directories searched for command names.
- **`which command`** shows the resolved binary — essential when simulators or Git are "not found".

### 3. Dotfiles and project config

- Hidden files (names starting with `.`) store config: `.bashrc`, `.gitignore`.
- Course repos use dotfiles to exclude build artifacts from Git (preview for Module 6).

""",
    3: """## Design Architecture

### 1. Standard streams (stdin, stdout, stderr)

- Every process has file descriptors **0** (stdin), **1** (stdout), **2** (stderr).
- By default all three attach to your terminal; redirection and pipes rewire them.

### 2. Pipe chain architecture

- **`cmd1 | cmd2 | cmd3`** — stdout of each command feeds stdin of the next.
- Classic pattern: **`grep ERROR sim.log | sort | uniq -c | head`** — filter, sort, count, preview.
- Pipes connect **stdout → stdin** only; use **`2>&1`** to include stderr in the chain.

### 3. Foreground vs background execution

- **Foreground** — terminal blocked until the command finishes (`./sim`).
- **Background** — append **`&`** to return the prompt; use **`jobs`**, **`fg`**, **`bg`** to manage.
- **`Ctrl+C`** sends SIGINT to the foreground process group.

""",
    4: """## Design Architecture

### 1. Script structure and shebang

- **`#!/usr/bin/env bash`** tells the OS which interpreter to use.
- Scripts are plain text files made executable with **`chmod u+x script.sh`**.
- Run as **`./script.sh`** (relative) or **`bash script.sh`** (explicit interpreter).

### 2. Variables, arguments, and quoting

- **`$1`, `$2`, …** — positional arguments; **`$#`** count; **`"$@"`** preserves word boundaries.
- **Single quotes** — literal text; **double quotes** — allow variable expansion.
- Quoting prevents word-splitting on spaces in paths and signal names.

### 3. Control flow and exit codes

- **`if` / `then` / `else`**, **`for`**, **`while`**, **`case`** — automate repetitive tasks.
- **`$?`** holds the last exit code; **`set -e`** exits on first failure (use in production scripts).
- Module scripts under **`scripts/moduleN.sh`** follow these patterns.

""",
    5: """## Design Architecture

### 1. Standard project layout

- **`src/`** — RTL and source (`.v`, `.sv`, `.cpp`).
- **`tb/`** or **`tests/`** — testbenches and test lists.
- **`docs/`**, **`scripts/`**, **`build/`** — documentation, automation, generated output.
- Same layout used in digital design courses and in Module 8's template project.

### 2. Discovery architecture (find + grep)

- **`find . -name "*.v"`** — locate files by name pattern in a tree.
- **`grep -R "signal" src/`** — search file **contents** recursively.
- Editors/IDEs add a GUI layer on top of the same search patterns.

### 3. Archive and backup flow

- **`tar czf`** / **`zip -r`** bundle a directory for backup or sharing.
- Exclude **`build/`**, logs, and **`.git/`** — align exclusions with future `.gitignore` rules.
- Timestamped names: **`project_$(date +%Y%m%d).tar.gz`**.

""",
    6: """## Design Architecture

### 1. Git three-tree model

- **Working tree** — files on disk you edit.
- **Staging area (index)** — changes selected with **`git add`**.
- **Repository (HEAD)** — committed snapshots referenced by **`git commit`**.

### 2. Commit graph and history

- Each **commit** points to a parent; **`git log`** walks the chain.
- **Branches** are movable pointers to commits; **`main`** is the default branch name.
- **`git diff`** compares working tree vs staging vs last commit.

### 3. Local and remote sync

- **`git clone`** copies a remote repo (e.g. GitHub) including full history.
- **`git push`** / **`git pull`** synchronize local and remote branches.
- **`.gitignore`** excludes build artifacts from ever entering the repository.

""",
    7: """## Design Architecture

### 1. Branching model

- **`git branch feature`** creates a pointer; **`git checkout feature`** switches context.
- **`git switch -c feature`** (modern) combines create + switch.
- Feature branches isolate work before merging into **`main`**.

### 2. Merge and conflict resolution

- **`git merge feature`** combines histories; Git auto-merges non-overlapping edits.
- **Conflicts** mark overlapping regions with **`<<<<<<<`**, **`=======`**, **`>>>>>>>`** markers.
- Resolve in an editor, then **`git add`** and **`git commit`** to complete the merge.

### 3. Submodules and shared IP

- **Submodules** pin an external repo at a specific commit inside your project.
- **`.gitmodules`** records URLs and paths — common for shared verification IP or course libraries.
- **`git submodule update --init --recursive`** fetches submodule content after clone.

""",
    8: """## Design Architecture

### 1. End-to-end workflow loop

- **Clone template** → **edit source/testbench** → **run scripts** → **inspect logs** → **commit milestone** → **push to GitHub**.
- Each iteration should leave the repo in a reproducible state for grading or teammates.

### 2. Script-driven execution layer

- Entry points live under **`scripts/`** (e.g. **`run_demo.sh`**, **`run_tests.sh`**).
- Redirect output: **`./scripts/run_demo.sh > logs/run.log 2>&1`** captures stdout and stderr.
- Analyze with **`grep`**, **`tail`**, **`less`** — same tools from Modules 1–3.

### 3. Submission and reproducibility architecture

- **Pre-push checklist**: clean **`git status`**, scripts pass from a fresh checkout, build outputs in **`.gitignore`**.
- **GitHub** is the submission endpoint; commits document what changed and why.
- Optional **pull requests** for review before merging feature work into **`main`**.

""",
}


EXECUTION_FLOW: dict[int, str] = {
    1: """## Execution Flow

**Execution sequence**: Clone repo → chmod scripts → module1.sh --check → scaffold practice dirs → run EXAMPLES.md labs → complete CHECKLIST.md

""",
    2: """## Execution Flow

**Execution sequence**: module2.sh --check → scaffold hello.sh → chmod u+x → run permissions examples → inspect PATH with which

""",
    3: """## Execution Flow

**Execution sequence**: module3.sh --check → scaffold sample.log → practice redirection → build pipe chains → grep log files

""",
    4: """## Execution Flow

**Execution sequence**: module4.sh --check → scaffold scripts → chmod +x → run say_hello.sh → extend greet.sh with arguments

""",
    5: """## Execution Flow

**Execution sequence**: module5.sh --check → scaffold project tree → find/grep across src/ → create tar.gz backup archive

""",
    6: """## Execution Flow

**Execution sequence**: git --version → module6.sh --check → scaffold git_demo → status → add → commit → log → diff

""",
    7: """## Execution Flow

**Execution sequence**: module7.sh --check → create branch → commit → merge → resolve conflicts → inspect reflog

""",
    8: """## Execution Flow

**Execution sequence**: module8.sh --check → run sample_project script → capture logs → grep errors → git commit → pre-push checklist

""",
}


def inject_sections(path: Path, module: int) -> bool:
    """Return True if file was modified."""
    text = path.read_text(encoding="utf-8")
    original = text

    if "## Before You Start" not in text:
        marker = f"## Running Module {module}"
        if marker not in text:
            print(f"WARN: no Running Module marker in {path}")
        else:
            text = text.replace(marker, BEFORE_START[module] + marker, 1)

    if "## Design Architecture" not in text or "## Execution Flow" not in text:
        marker = "## Topics Covered"
        if marker in text:
            prefix = ""
            if "## Design Architecture" not in text:
                prefix += DESIGN_ARCH[module]
            if "## Execution Flow" not in text:
                prefix += EXECUTION_FLOW[module]
            if prefix:
                text = text.replace(marker, prefix + marker, 1)

    if text != original:
        path.write_text(text, encoding="utf-8")
        return True
    return False


def main() -> int:
    changed = 0
    for n in range(1, 9):
        path = COURSE_ROOT / "docs" / f"MODULE{n}.md"
        if not path.is_file():
            print(f"SKIP missing {path}")
            continue
        if inject_sections(path, n):
            print(f"Updated {path.name}")
            changed += 1
        else:
            print(f"Unchanged {path.name}")
    print(f"Done: {changed} file(s) updated")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
