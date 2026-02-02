# Command history and shortcuts example

Practice **recalling** and **editing** previous commands with history and keyboard shortcuts.

## Layout

This folder has no runnable scripts — try the commands below directly in your terminal.

## Try these (in your shell)

**1. View history**

```bash
history
history | tail -20
```

**2. Navigate history with arrow keys**

- **↑** (Up) — previous command
- **↓** (Down) — next command

**3. Edit the current line**

- **Ctrl+A** — jump to **start** of line
- **Ctrl+E** — jump to **end** of line
- **Ctrl+U** — clear from cursor to **start** of line
- **Ctrl+K** — clear from cursor to **end** of line

**4. Reverse search (Ctrl+R)**

- Press **Ctrl+R**
- Type part of a past command (e.g. `grep` or `cd module`)
- Press **Enter** to run the match, or **Ctrl+C** to cancel

**5. Re-run by number (optional)**

```bash
!123
```

Runs command number 123 from `history`. Use with care.

## Why it matters

Faster recall and small edits (e.g. change a path or flag) save time when running simulators, builds, and repeated commands. Ctrl+R is especially useful to find a long command you ran earlier.
