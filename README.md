# Learn Unix & Git: Shell and Version Control for Digital Design

[![License: CC BY 4.0](https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by/4.0/)

Unix, Git, and tooling basics for students taking digital design and verification courses. This project provides a complete educational path from shell fundamentals through Git collaboration and end-to-end project workflow. Each module doc includes topics, exercises, assessment, and a **Command Reference (Detailed)** with descriptions of every command: what it does, how it works, common options, and usage examples.

## 📋 Table of Contents

- [Overview](#-overview)
- [Features](#-features)
- [Prerequisites](#-prerequisites)
- [Quick Start](#-quick-start)
- [Project Structure](#-project-structure)
- [Documentation](#-documentation)
- [Modules](#-modules)
- [Usage](#-usage)
- [Contributing](#-contributing)
- [License](#-license)
- [Support](#-support)

## 🎯 Overview

This project is a complete educational resource for learning Unix and Git in the context of digital design and verification. It provides:

- **8 Progressive Modules**: From Linux & shell basics to end-to-end project workflow
- **Comprehensive Examples**: Working examples in each module directory
- **Command Reference (Detailed)**: Per-command descriptions, syntax, options, and tips in every module doc
- **Automated Scripts**: Self-check, demo, and scaffold scripts for each module
- **Full Documentation**: Topics, exercises, assessment, and learning outcomes
- **Course Alignment**: Structure and workflows that match typical digital design courses

### Why Unix & Git?

- **Industry Standard**: Shell and version control are essential for hardware and software teams
- **Digital Design Workflow**: Navigate RTL projects, run simulators, capture logs, and manage source with Git
- **Reproducibility**: Scripted builds, clear history, and clean submission habits
- **Collaboration**: Clone repos, work on branches, merge, and submit via GitHub
- **Foundation**: Prepares you for Verilog/SystemVerilog courses and tooling (e.g. iverilog, Verilator)

### Learning Approach

- **Theory**: Concepts (processes, redirection, staging area, branches, etc.)
- **Practice**: Hands-on commands and scripts with real examples
- **Reference**: Detailed command reference in each module for lookup and review
- **Progressive**: Builds from basic navigation to full project-and-Git workflow

## ✨ Features

- ✅ **8 Modules**: Complete path from shell basics to end-to-end workflow
- ✅ **Command Reference (Detailed)**: Every command documented with what/how/syntax/options/examples/tips
- ✅ **Practical Examples**: Navigation, files, permissions, pipes, scripts, archives, Git, submodules
- ✅ **Scripts per Module**: `--check`, `--demo`, `--scaffold` (where applicable)
- ✅ **Exercises & Assessment**: Hands-on tasks and checklists for each module
- ✅ **GitHub-Oriented**: Clone, commit, push, pull, branches, merge, PRs
- ✅ **Digital Design Context**: Project layout (src/, tb/, build/), logs, and submission flow
- ✅ **Safe Practices**: Quoting, .gitignore, restore, clean rebuild, pre-submission checks

## 📚 Prerequisites

### Required Knowledge

- **Basic Computer Use**: Ability to open a terminal and type commands
- **No Prior Unix Required**: Course starts from navigation and files
- **No Prior Git Required**: Git basics are introduced in Module 6

### System Requirements

- **Operating System**: Linux, macOS, or Windows (WSL2 recommended)
- **Shell**: Bash or compatible (zsh fine)
- **Git**: Git installed (`git --version` works) for Modules 6–8
- **Optional**: GitHub account for remote examples and submission practice

## 🚀 Quick Start

### 1. Clone the Repository

```bash
git clone <repository-url>
cd learn_unix_git
```

### 2. Make Scripts Executable

```bash
chmod +x scripts/*.sh
```

### 3. Run Module 1 Self-Check and Demo

```bash
./scripts/module1.sh --check   # self-check
./scripts/module1.sh --demo    # print demo commands
./scripts/module1.sh --scaffold # create ~/unix_practice for exercises
```

### 4. Start Learning

Begin with [Module 1: Linux & Shell Basics](docs/MODULE1.md) and follow the modules sequentially. Each module doc has a **Command Reference (Detailed)** section for command lookup.

## 📁 Project Structure

```
learn_unix_git/
├── docs/                      # Module documentation (syllabus)
│   ├── MODULE1.md             # Linux & Shell Basics
│   ├── MODULE2.md             # Filesystem, Permissions & Environment
│   ├── MODULE3.md             # Processes, Pipes & Redirection
│   ├── MODULE4.md             # Shell Productivity & Basic Scripting
│   ├── MODULE5.md             # Editors, Projects & Archives
│   ├── MODULE6.md             # Git Basics for Course Work
│   ├── MODULE7.md             # Advanced Git for Collaboration & IP Reuse
│   └── MODULE8.md             # End-to-End Project Workflow
│
├── module1/                   # Shell basics (navigation, files, viewing, help)
│   ├── examples/              # navigation, paths, file_operations, viewing, etc.
│   ├── README.md
│   └── ...
├── module2/                   # Permissions, environment, dotfiles
│   ├── examples/              # permissions, environment, file_types, ownership, etc.
│   ├── README.md
│   └── ...
├── module3/                   # Processes, pipes, redirection, grep
│   ├── examples/              # processes, pipes, redirection, troubleshooting, etc.
│   └── README.md
├── module4/                   # History, aliases, scripts, variables, control flow
│   ├── examples/              # script_basics, arguments, control_flow, safe_scripting, etc.
│   └── README.md
├── module5/                   # Editors, find, grep -R, tar, zip
│   ├── examples/              # editor, find_grep, tar_archives, zip_archives, etc.
│   └── README.md
├── module6/                   # Git basics (init, clone, add, commit, push, .gitignore)
│   ├── examples/              # init_clone, status_diff, add_commit_log, remote_undo, etc.
│   └── README.md
├── module7/                   # Branches, merge, conflicts, submodules, blame, bisect, PRs
│   ├── examples/              # branching, merging, conflicts, submodules, blame_bisect, etc.
│   └── README.md
├── module8/                   # End-to-end workflow (template, scripts, logs, submission)
│   ├── examples/              # template, scripts, logs, iterative, submission
│   └── README.md
│
├── scripts/                   # Per-module scripts
│   ├── module1.sh             # --check, --demo, --scaffold
│   ├── module2.sh             # --check, --demo, --scaffold
│   ├── ...                    # module3–8
│   └── module8.sh
│
└── README.md                  # This file
```

## 📖 Documentation

The `docs/` directory contains the syllabus and module guides. Each module doc includes:

- **Topics Covered**: What the module teaches
- **Command Reference (Detailed)**: Per-command descriptions, syntax, options, examples, tips
- **Learning Outcomes**: What you should be able to do after the module
- **Exercises**: Hands-on tasks
- **Assessment**: Checklist for self or instructor

### Module Documentation

- **[MODULE1.md](docs/MODULE1.md)**: Linux & Shell Basics  
  - Navigation (pwd, ls, cd), paths, file operations (mkdir, cp, mv, rm), viewing (cat, less, head, tail), help (man, --help)

- **[MODULE2.md](docs/MODULE2.md)**: Filesystem, Permissions & Environment  
  - File types, ls -l, symbolic links (ln -s), permissions (chmod), ownership (chown), environment (PATH, echo, env, which, export), dotfiles

- **[MODULE3.md](docs/MODULE3.md)**: Processes, Pipes & Redirection  
  - Processes (ps, kill), jobs (&, jobs, fg, bg), redirection (>, >>, 2>, 2>&1), pipes (|), grep, tee

- **[MODULE4.md](docs/MODULE4.md)**: Shell Productivity & Basic Scripting  
  - History (history, shortcuts), aliases (alias, unalias), script basics (shebang, chmod +x), variables and arguments ($1, $@), control flow (if, for), safe scripting (set -e, quoting)

- **[MODULE5.md](docs/MODULE5.md)**: Editors, Projects & Archives  
  - Editors (nano, vim, code), project structure (src/, tb/, docs/, scripts/, build/), find, grep -R, tree, tar, zip, unzip, backup (date, timestamped archives)

- **[MODULE6.md](docs/MODULE6.md)**: Git Basics for Course Work  
  - Repository, working tree, staging area, commit; git init, clone, status, add, commit, log, diff; .gitignore; remotes (git remote, pull, push); safe undo (git restore)

- **[MODULE7.md](docs/MODULE7.md)**: Advanced Git for Collaboration & IP Reuse  
  - Branches (git branch, checkout, switch), merge (fast-forward, merge commit), conflict resolution, submodules (add, update --init), git blame, git bisect, PR workflow, git fetch

- **[MODULE8.md](docs/MODULE8.md)**: End-to-End Project Workflow  
  - Clone template, run scripts from root, redirect logs, inspect with tail/less/grep, iterative edit→run→commit loop, branching, pre-submission checks (git status, git clean -fdx in a copy), push and verify on GitHub

## 🎓 Modules

### Module 1: Linux & Shell Basics

Get comfortable with the terminal and basic file operations: pwd, ls, cd, mkdir, cp, mv, rm, cat, less, head, tail, man, --help.

**Quick Start**: `./scripts/module1.sh --check` | `--demo` | `--scaffold`

### Module 2: Filesystem, Permissions & Environment

Understand file types, permissions (chmod), ownership, PATH, environment variables, and dotfiles.

**Quick Start**: `./scripts/module2.sh --check` | `--demo` | `--scaffold`

### Module 3: Processes, Pipes & Redirection

Manage processes (ps, kill), run jobs in background, redirect stdout/stderr, use pipes and grep.

**Quick Start**: `./scripts/module3.sh --check` | `--demo` | `--scaffold`

### Module 4: Shell Productivity & Basic Scripting

Use history and aliases; write shell scripts with variables, arguments, conditionals, and loops; apply safe scripting practices.

**Quick Start**: `./scripts/module4.sh --check` | `--demo` | `--scaffold`

### Module 5: Editors, Projects & Archives

Use editors from the terminal; organize projects (src/, tb/, docs/, scripts/, build/); find files and text; create and extract tar and zip archives.

**Quick Start**: `./scripts/module5.sh --check` | `--demo` | `--scaffold`

### Module 6: Git Basics for Course Work

Initialize and clone repos; track changes (status, add, commit, log, diff); use .gitignore; connect to GitHub (remote, pull, push); safely undo changes (restore).

**Quick Start**: `./scripts/module6.sh --check` | `--demo` | `--scaffold`

### Module 7: Advanced Git for Collaboration & IP Reuse

Create and switch branches; merge (including conflict resolution); use submodules; inspect history (blame, bisect); follow branch-and-PR workflow.

**Quick Start**: `./scripts/module7.sh --check` | `--demo`

### Module 8: End-to-End Project Workflow

Combine Unix and Git: clone a template, run scripts, capture and inspect logs, develop iteratively with small commits, prepare and submit via GitHub.

**Quick Start**: `./scripts/module8.sh --check` | `--demo`

## 💻 Usage

### Per-Module Scripts

Each module has a script under `scripts/`:

```bash
./scripts/moduleN.sh --check    # self-check (prerequisites, tools)
./scripts/moduleN.sh --demo     # print demo commands
./scripts/moduleN.sh --scaffold # create practice dirs/files (modules 1–6)
```

Run from the **repository root**. Not all modules have `--scaffold`; see the module doc or script help.

### Module Content and Examples

- **Module docs**: [docs/MODULE1.md](docs/MODULE1.md) … [docs/MODULE8.md](docs/MODULE8.md) — full syllabus and **Command Reference (Detailed)**.
- **Examples**: [module1/README.md](module1/README.md) … [module8/README.md](module8/README.md) — quick start and example index for each module.

### Command Reference

For any command introduced in a module, open that module’s doc and go to the **Command Reference (Detailed)** section. There you’ll find what it does, how it works, syntax, options, examples, and tips.

## 🤝 Contributing

Contributions are welcome. This project follows practices suited to educational material:

1. **Documentation**: Keep module docs and command references clear and consistent.
2. **Examples**: Ensure examples run and match the described workflow.
3. **Scripts**: Preserve `--check`, `--demo`, `--scaffold` behavior; document new options.
4. **Structure**: Follow the existing module layout (docs/, moduleN/, scripts/).

## 📄 License

This work is licensed under a [Creative Commons Attribution 4.0 International License](https://creativecommons.org/licenses/by/4.0/).

[![CC BY 4.0](https://i.creativecommons.org/l/by/4.0/88x31.png)](https://creativecommons.org/licenses/by/4.0/)

### What this means

- ✅ **You may:** Share and adapt the material for any purpose, including commercially.
- 📝 **You must:** Give appropriate credit, link to the license, and indicate if changes were made.

## 📞 Support

For questions or issues:

1. Check the [documentation](docs/) and the **Command Reference (Detailed)** in each module doc.
2. Review the [module READMEs](module1/README.md) for examples and quick start.
3. Run `./scripts/moduleN.sh --check` and `--demo` for the relevant module.
4. Open an issue for bugs or suggestions.

---

**Happy Learning! 🚀**

Start with [Module 1: Linux & Shell Basics](docs/MODULE1.md).
