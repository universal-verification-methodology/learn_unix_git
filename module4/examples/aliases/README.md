# Aliases example

Practice **defining** and **using** aliases to shorten frequent commands.

## Layout

```
aliases/
├── README.md           # this file
└── commands_to_try.txt # copy-paste alias commands
```

## Try these (in your shell)

**1. Create a temporary alias (current session only)**

```bash
alias ll='ls -alF'
ll
alias cproj='cd ~/proj/learn_unix_git'
cproj
pwd
```

**2. List all active aliases**

```bash
alias
alias | grep ll
```

**3. Remove an alias (current session)**

```bash
unalias ll
ll
# ll is gone; use ls -alF again
```

**4. Persist aliases (optional)**

Add lines to `~/.bashrc` or `~/.zshrc`:

```bash
alias ll='ls -alF'
alias cproj='cd ~/proj/learn_unix_git'
```

Then run `source ~/.bashrc` (or `source ~/.zshrc`) or open a new terminal. **Do not edit** config files until you are comfortable; try temporary aliases first.

## Common aliases

| Alias     | Typical definition   | Use                |
|-----------|-----------------------|--------------------|
| ll        | ls -alF               | Long listing       |
| la        | ls -A                 | List almost all    |
| cproj     | cd ~/proj/...         | Jump to project    |
| ..        | cd ..                 | Up one directory   |

See `commands_to_try.txt` for copy-paste lines.
