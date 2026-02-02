# Hidden files and dotfiles example

Practice **listing hidden files** with `ls -a` and recognizing **dotfiles** and **dot-directories** in projects.

## Layout

```
dotfiles/
├── README.md       # this file
├── visible.txt     # normal file (shows with ls)
├── .hidden_file    # hidden file
├── .sample_rc      # example dotfile (config-style name)
├── .gitignore      # typical project dotfile
└── .hidden_dir/    # hidden directory
```

## Try these (from repo root)

```bash
cd module2/examples/dotfiles
ls
ls -a
ls -la
cat .hidden_file
cat .sample_rc
ls -a ~ | head -15
```

## 1. Hidden names (ls -a)

Files and directories whose names **start with a dot** (`.`) are hidden from plain `ls`.

```bash
cd module2/examples/dotfiles
ls
ls -a
```

Here you’ll see a normal file, a hidden file, and a hidden directory (e.g. `.hidden_file`, `.hidden_dir/`). Use `ls -la` for a long listing including hidden items.

## 2. What’s in this example

- **visible.txt** — normal file (shows with `ls`)
- **.hidden_file** — hidden file (only with `ls -a`)
- **.sample_rc** — example dotfile (config-style name)
- **.gitignore** — typical project dotfile; hidden, used by Git
- **.hidden_dir/** — hidden directory

## 3. Common dotfiles and dot-dirs

| Name        | Typical use                    |
|------------|----------------------------------|
| `.git/`    | Git repository data              |
| `.gitignore` | Files Git should ignore        |
| `.bashrc`  | Bash config (sourced in interactive shells) |
| `.profile` | Login shell config               |
| `.zshrc`   | Zsh config                       |
| `.config/` | User config directory            |

## 4. Inspect your home directory

```bash
ls -a ~
ls -la ~ | head -25
```

Look for `.bashrc`, `.profile`, `.gitconfig`, etc. **Do not edit** system or shell config until you understand what you’re changing; reading with `less` or `cat` is safe.

## 5. Project structure

In design and dev work:

- **Home** (`~`) — your personal files and dotfiles
- **Project dirs** (e.g. `~/proj/learn_unix_git`) — repos often have `.git/`, `.gitignore`, sometimes `.config` or tool-specific dotfiles

Knowing that dotfiles exist and how to list them (`ls -a`) helps you navigate and configure your environment safely.
