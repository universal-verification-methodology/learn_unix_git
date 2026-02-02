# Module 5: Editors, Projects & Archives

**Goal**: Work effectively with editors, organize projects, and move/share code safely

---

## Navigation

[← Previous: Module 4: Shell Productivity & Basic Scripting](MODULE4.md) | [Next: Module 6: Git Basics for Course Work →](MODULE6.md)

[↑ Back to README](../README.md)

---

## Running Module 5

From the repo root:

- **Self-check**: `./scripts/module5.sh --check`
- **Demo commands**: `./scripts/module5.sh --demo`
- **Exercise scaffold**: `./scripts/module5.sh --scaffold` (creates `~/unix_practice/unix_course_project/` with src/, tb/, docs/, scripts/, build/)

See [module5/README.md](../module5/README.md) for examples and quick start.

---

## Overview

This module covers practical day-to-day skills for managing source code and project files: choosing and using editors, structuring projects, and using archives to move or back up work. The focus is on habits that make later digital design and verification work smoother and less error-prone.

### What You'll Learn

- **Editor Basics**: How to choose an editor and perform core operations
- **Project Organization**: Simple, consistent directory structures for code
- **Working with Many Files**: Navigating and searching within a project
- **Archives and Compression**: Using `tar` and `zip` to package projects
- **Backup and Sharing**: Simple backup strategies before relying on Git

### Prerequisites

Before starting this module, students should:

- [ ] Be comfortable with basic shell navigation and file operations
- [ ] Have completed at least one simple shell script
- [ ] Know how to open a terminal-based editor like `nano` (or have VS Code installed)

---

## Topics Covered

### 1. Choosing and Using an Editor

- **Editor Options**
  - Terminal editors: `nano`, `vim` (mention only if relevant)
  - GUI editors/IDEs: VS Code, others
- **Core Operations in Any Editor**
  - Opening files from the terminal (e.g., `nano file`, `code file`)
  - Editing, saving, and closing
  - Basic search within a file (e.g., `Ctrl+W` in `nano`, search in VS Code)
- **Digital Design Context**
  - Opening `.v`, `.sv`, `.cpp`, `.md`, and config files from the terminal
  - Keeping testbenches and RTL readable and well-commented

### 2. Project Structure and Naming

- **Simple Project Layout**
  - Example layout for small projects:
    - `src/` for source code
    - `tb/` or `tests/` for testbenches
    - `docs/` for documentation
    - `scripts/` for helper scripts
    - `build/` or `out/` for generated artifacts
- **Naming Conventions**
  - Lowercase, hyphens/underscores; avoid spaces in file and directory names
  - Clear, descriptive names for modules and testbenches
- **Course Alignment**
  - Aligning Unix/Git project organization with your digital design course layouts

### 3. Navigating and Searching in Projects

- **Finding Files**
  - `find . -name "pattern"` (intro-level usage)
- **Searching Content**
  - `grep -R "signal_name" .` (recursive search)
  - Using editor/IDE search features for multi-file search
- **Working with Large Trees**
  - Using `tree` (if available) or structured `ls` to understand directory hierarchies

### 4. Archives and Compression (tar, zip)

- **Creating Archives**
  - `tar czf project.tar.gz project_dir/`
  - `zip -r project.zip project_dir/`
- **Extracting Archives**
  - `tar xzf project.tar.gz`
  - `unzip project.zip`
- **What to Exclude**
  - Build artifacts, logs, and other generated files
  - Aligning with `.gitignore` patterns (preview for Git modules)

### 5. Backup and Sharing Strategies

- **Local Backups**
  - Copying project directories to another drive or backup folder
  - Keeping timestamped archives: `project_YYYYMMDD.tar.gz`
- **Transferring Projects**
  - Using archives for offline sharing (e.g., via USB or file upload)
  - Brief mention of `scp` for remote copies (optional)
- **Preparing for Git**
  - Cleaning up before archiving (remove `build/`, temporary files, etc.)
  - Ensuring a sensible structure before version control is introduced

---

## Command Reference (Detailed)

This section describes the commands and concepts introduced in Module 5: editors, project structure, finding files and text, archives and compression, and backup strategies.

---

### Editors (Overview)

#### Opening Files from the Terminal

- **Terminal editors**: Run in the same terminal; no separate window. Good for quick edits on remote machines or when a GUI is not available.
  - **`nano file`**: Simple, beginner-friendly. Shortcuts shown at bottom: Ctrl+O save, Ctrl+X exit, Ctrl+W search. See Module 1.
  - **`vim file`** (or **`vi`**): Powerful but steeper learning curve. Modes: normal (navigation), insert (typing), command (`:w` save, `:q` quit). Mentioned here; detailed use is optional for this module.
- **GUI editors**: Open in a separate window; often better for large projects and multi-file search.
  - **`code file`** or **`code .`**: Opens VS Code; `code .` opens the current directory as a workspace. Requires VS Code to be installed and the `code` command to be on your `PATH` (often set by the installer).
- **Tip**: Use the same editor consistently so you learn its shortcuts. For digital design, open `.v`, `.sv`, `.cpp`, and `.md` from the project root so paths in configs stay simple.

---

#### Core Operations (Any Editor)

- **Open**: From terminal, run `editor path/to/file` or `editor .` to open a directory (GUI).
- **Edit**: Type or use editor-specific shortcuts to insert, delete, and move text.
- **Search within file**: In **nano**: Ctrl+W, type pattern, Enter; Alt+W for next. In **VS Code**: Ctrl+F (Cmd+F on macOS); Enter for next. In **vim**: `/pattern` then Enter; `n` for next.
- **Save**: nano: Ctrl+O, Enter; VS Code: Ctrl+S; vim: `:w` then Enter.
- **Close**: nano: Ctrl+X; VS Code: close tab/window; vim: `:q` (or `:q!` to discard changes).
- **Tip**: Save often. Use search to jump to signal names or module names in RTL and testbenches.

---

### Project Structure and Naming

#### Suggested Directory Layout

A simple, consistent layout for small code projects (including RTL/verification):

| Directory   | Typical contents |
|------------|-------------------|
| **`src/`** | Source code (e.g. RTL `.v`, `.sv`; C++ `.cpp`). |
| **`tb/`** or **`tests/`** | Testbenches, test scripts, test lists. |
| **`docs/`** | Documentation, notes, specs (e.g. `.md`). |
| **`scripts/`** | Helper scripts (build, run, clean). |
| **`build/`** or **`out/`** | Generated artifacts (object files, logs, waveforms). Not usually version-controlled or archived. |

- **Tip**: Keep generated files (build/, logs, large binaries) out of archives and version control; document the layout in a README so others (and you later) can find things quickly.

---

#### Naming Conventions

- **Files and directories**: Use **lowercase**; separate words with **hyphens** or **underscores** (e.g. `my_module.v`, `test_bench.sv`). **Avoid spaces** in names so scripts and command-line tools work without quoting.
- **Modules and signals**: Use clear, descriptive names; follow course or team conventions. Consistent naming makes `grep` and editor search more effective.
- **Tip**: Align naming with your digital design course so project structure and file names feel familiar when you add Git later.

---

### Finding Files and Text in Projects

#### `find` — Search for Files by Name or Other Criteria

- **What it does**: Walks a directory tree and **finds files or directories** that match given criteria (name, type, size, etc.). Prints the path of each match. Essential for locating files in large projects.
- **How it works**: Starts at one or more directories and recursively descends; for each entry it evaluates the expressions you give (e.g. `-name`, `-type`) and prints the path if the whole expression is true.
- **Syntax**: `find path... [options] [expression]`
- **Common options and expressions**:
  - **`-name "pattern"`**: Match basename against **glob** pattern (e.g. `*.v`, `*test*`). Case-sensitive.
  - **`-iname "pattern"`**: Like `-name` but **case-insensitive**.
  - **`-type d`**: Only **directories**.
  - **`-type f`**: Only **regular files**.
  - **`-maxdepth n`**: Do not descend more than **n** levels (GNU find; check `man find` on your system).
- **Examples**:
  ```bash
  find . -name "*.v"              # all .v files under current dir
  find . -name "*.sv" -type f     # regular files ending in .sv
  find src -iname "*counter*"     # names containing "counter" (any case)
  find . -type d -name build     # directories named build
  find . -maxdepth 2 -name "*.md" # .md files in . and one level down (GNU)
  ```
- **Tip**: Quote the pattern so the shell does not expand it (e.g. `find . -name "*.v"`). Use `-type f` or `-type d` to restrict to files or directories.

---

#### `grep -R` — Recursive Search for Text in Files

- **What it does**: **Recursively** searches under given directories for **lines** that match a pattern (default: basic regex). Prints matching lines (and optionally filenames or line numbers). Use for finding signal names, module names, or error strings across a project.
- **How it works**: Like `grep` (Module 3) but descends into subdirectories and reads each file; skips binary files by default on many systems.
- **Syntax**: `grep -R [options] pattern path...` or `grep -r ...` (same as `-R` in GNU grep).
- **Common options**:
  - **`-R`** (or **`-r`**): **Recurse** into directories.
  - **`-n`**: Print **line numbers**.
  - **`-i`**: **Ignore case**.
  - **`-l`**: Print only **file names** that contain a match (no line content).
  - **`--include="*.v"`**: Only search files matching the glob (e.g. `.v` files; GNU grep).
- **Examples**:
  ```bash
  grep -R "CLOCK_SIGNAL" .           # all lines containing CLOCK_SIGNAL
  grep -Rn "reset" src/              # with line numbers under src/
  grep -Rl "ERROR" .                # only filenames that contain ERROR
  grep -Ri "counter" .              # case-insensitive
  grep -R --include="*.v" "module " .   # only in .v files (GNU)
  ```
- **Tip**: Use `-n` when you need to open the file at the right line; use `-l` when you only need to know which files match. Quote the pattern to avoid shell expansion.

---

#### `tree` — Display Directory Tree (If Available)

- **What it does**: Lists directories and files in a **tree** format (indented hierarchy). Helps visualize project structure quickly. Not installed on all systems; use `ls -R` or structured `find` if `tree` is missing.
- **How it works**: Walks the directory tree and prints names with indentation and branch characters.
- **Syntax**: `tree [path] [options]`
- **Common options**:
  - **`-L n`**: Limit depth to **n** levels.
  - **`-a`**: Include **hidden** files (names starting with `.`).
  - **`-I "pattern"`**: **Ignore** files/dirs matching the pattern (e.g. `build`, `.git`).
- **Examples**:
  ```bash
  tree                    # current directory
  tree -L 2                # two levels deep
  tree -I "build|.git"     # skip build and .git (GNU tree)
  ```
- **Tip**: If `tree` is not available, use `find . -type d | head -50` or `ls -R` for a flat list of directories; or rely on your editor’s file explorer.

---

### Archives and Compression

#### `tar` — Create or Extract Archive (Tape Archive)

- **What it does**: **Bundles** many files and directories into a single **archive** file (and optionally compresses it). Also **extracts** or **lists** such archives. The standard way on Unix-like systems to package a project (e.g. for backup or sharing).
- **How it works**: In "create" mode, tar reads the listed files and writes a single stream (to a file or stdout). In "extract" mode, it reads an archive and recreates files and directories. **Compression** is handled by **gzip** (`z`) or **bzip2** (`j`) via options; tar does not compress by itself.
- **Syntax**: `tar [options] archive_file [path...]` — options are often given as a short cluster (e.g. `czf`, `xzf`).
- **Common option letters**:
  - **`c`**: **Create** a new archive.
  - **`x`**: **Extract** from an archive.
  - **`t`**: **List** (table of contents) without extracting.
  - **`f`**: Next argument is the **file** (archive) name; required when the archive is a file.
  - **`z`**: Use **gzip** (`.gz`): compress when creating, decompress when extracting.
  - **`j`**: Use **bzip2** (`.bz2`): same idea.
  - **`v`**: **Verbose**: print filenames (optional; helpful for debugging).
- **Examples**:
  ```bash
  tar czf project.tar.gz project_dir/    # create gzip-compressed archive
  tar czvf project.tar.gz project_dir/   # same, verbose
  tar xzf project.tar.gz                 # extract (creates project_dir/ in cwd)
  tar xzf project.tar.gz -C /tmp         # extract into /tmp
  tar tzf project.tar.gz                 # list contents without extracting
  tar cvf project.tar project_dir/       # create uncompressed .tar
  ```
- **Tip**: Use **`tar czf name.tar.gz dir/`** to create and **`tar xzf name.tar.gz`** to extract. The **`f`** option must be last in the option cluster so the next argument is the archive filename. Exclude build artifacts when creating (see "What to Exclude" below).

---

#### `zip` — Create ZIP Archive

- **What it does**: Creates a **ZIP** archive (a single file containing one or more files/directories, usually compressed). Common on Windows and for email or web uploads; also widely supported on Unix.
- **How it works**: Recursively adds the given files and directories to the archive; with `-r`, directories are descended. Compression is built in (default).
- **Syntax**: `zip [options] archive_name path...`
- **Common options**:
  - **`-r`**: **Recurse** into directories (required to archive a directory tree).
  - **`-q`**: **Quiet** (less output).
  - **`-x "pattern"`**: **Exclude** paths matching the pattern (e.g. `-x "*.o"`).
- **Examples**:
  ```bash
  zip -r project.zip project_dir/        # create archive of project_dir/
  zip -rq backup.zip src/ docs/         # quiet; only src and docs
  zip -r project.zip project_dir/ -x "build/*" -x "*.log"   # exclude build and logs
  ```
- **Tip**: Always use **`-r`** when archiving a directory so subdirectories are included. Use **`-x`** to skip build output and logs.

---

#### `unzip` — Extract or List ZIP Archive

- **What it does**: **Extracts** files from a ZIP archive, or **lists** its contents without extracting. Use when you receive a `.zip` file or need to unpack one you created.
- **How it works**: Reads the ZIP file and recreates the stored files and directories in the current directory (or under `-d dir`).
- **Syntax**: `unzip [options] archive [file...]`
- **Common options**:
  - **`-l`**: **List** contents (do not extract).
  - **`-o`**: **Overwrite** existing files without prompting (use with care).
  - **`-d dir`**: Extract into **directory** `dir`.
  - **`-q`**: **Quiet** (less output).
- **Examples**:
  ```bash
  unzip project.zip                     # extract into current directory
  unzip -l project.zip                  # list contents
  unzip project.zip -d /tmp/restore     # extract into /tmp/restore
  unzip -o project.zip                  # overwrite existing files
  ```
- **Tip**: Run **`unzip -l project.zip`** first to see what will be extracted and where; then run **`unzip project.zip`** (or with `-d`) to extract.

---

#### What to Exclude from Archives

- **Build artifacts**: `build/`, `out/`, `obj/`, `*.o`, `*.a`, generated binaries, simulation logs and waveforms. These can be recreated and are often large.
- **Version control data**: `.git/`, `.svn/` — usually not needed in a backup archive if you have the repo elsewhere; for sharing source-only, exclude them to keep the archive small.
- **Temporary and IDE files**: `*~`, `*.swp`, `.DS_Store`, IDE project dirs. Optional to exclude but keeps the archive clean.
- **Align with `.gitignore`**: Patterns you ignore in Git (e.g. `build/`, `*.log`) are good candidates to exclude from archives too. When you add Git (Module 6), the same habits will apply.
- **Tip**: Before creating an archive, remove or rename `build/` if you want a clean snapshot, or use `tar`/`zip` exclude options (e.g. `tar czf ... --exclude='build' ...` or `zip -x "build/*"`).

---

### Backup and Sharing

#### Timestamped Archives

- **What it does**: Including the **date** in the archive name (e.g. `project_20250203.tar.gz`) lets you keep multiple backups without overwriting and makes it clear when the backup was made.
- **How it works**: Use the **`date`** command with a format string to generate the date part; the shell substitutes it when you run the command.
- **Syntax**: `date +format` — format codes: **`%Y`** 4-digit year, **`%m`** month (01–12), **`%d`** day (01–31), **`%H`** hour, **`%M`** minute.
- **Examples**:
  ```bash
  date +%Y%m%d                    # 20250203
  tar czf project_$(date +%Y%m%d).tar.gz project_dir/
  zip -r project_$(date +%Y%m%d).zip project_dir/
  ```
- **Tip**: Use **`$(date +%Y%m%d)`** in the filename so each run creates a new name. Store backups in a dedicated folder (e.g. `~/backups/`) or on another drive.

---

#### `date` — Print or Set Date and Time

- **What it does**: Prints the **current date and time** (or a formatted string). Used in scripts for timestamps and in backup filenames.
- **How it works**: Reads the system clock and formats it according to the format string (e.g. `+%Y%m%d`).
- **Syntax**: `date [options] [+format]`
- **Common format codes**: `%Y` year, `%m` month, `%d` day, `%H` hour (24h), `%M` minute, `%S` second.
- **Examples**:
  ```bash
  date                    # default format
  date +%Y-%m-%d          # 2025-02-03
  date +%Y%m%d_%H%M       # 20250203_1430
  ```
- **Tip**: Use the same format consistently (e.g. `%Y%m%d`) so sorted filenames order correctly by date.

---

#### `scp` — Secure Copy (Optional)

- **What it does**: **Copies files or directories** between your machine and a **remote** machine over SSH. Use when you need to transfer a project or archive to a server or another computer.
- **How it works**: Uses SSH for authentication and encryption; syntax is similar to `cp`. Either direction: local → remote or remote → local.
- **Syntax**: `scp [options] source destination` — source or destination can be `user@host:path`.
- **Examples**:
  ```bash
  scp project.tar.gz user@server:/home/user/   # upload to server
  scp user@server:/path/to/file.tar.gz .       # download from server
  scp -r project_dir/ user@server:/home/user/  # upload directory (-r recursive)
  ```
- **Tip**: Use **`-r`** for directories. Ensure SSH access to the remote host is set up (key or password). For one-off sharing, a USB drive or cloud upload is often simpler than setting up `scp`.

---

### Summary: Archive and Backup Patterns

| Goal | Example |
|------|--------|
| Create gzip tarball | `tar czf project.tar.gz project_dir/` |
| Extract gzip tarball | `tar xzf project.tar.gz` |
| List tarball contents | `tar tzf project.tar.gz` |
| Create ZIP archive | `zip -r project.zip project_dir/` |
| Extract ZIP | `unzip project.zip` |
| List ZIP contents | `unzip -l project.zip` |
| Timestamped backup | `tar czf project_$(date +%Y%m%d).tar.gz project_dir/` |
| Exclude build dir (tar) | `tar czf project.tar.gz --exclude='build' project_dir/` |
| Exclude build (zip) | `zip -r project.zip project_dir/ -x "build/*"` |

---

## Learning Outcomes

By the end of this module, students should be able to:

- Open, edit, save, and close files using a chosen editor (terminal or GUI)
- Organize a small project into a sensible directory structure
- Search for files and text within a project
- Create and extract `tar` and `zip` archives
- Back up and share a project safely without accidentally including large generated files

---

## Exercises

1. **Editor Warm-Up**
   - Choose your primary editor (e.g., `nano` or VS Code).
   - Open a Verilog or text file.
   - Perform the following:
     - Search for a specific word.
     - Make an edit.
     - Save and close the file.

2. **Project Layout**
   - Create a new directory `unix_course_project`.
   - Inside it, create `src/`, `tb/`, `docs/`, `scripts/`, and `build/`.
   - Create simple placeholder files in each (e.g., `src/main.txt`, `tb/test.txt`).

3. **Searching in Projects**
   - In `src/` and `tb/`, create a few files that contain a common keyword (e.g., `CLOCK_SIGNAL`).
   - Use `grep -R "CLOCK_SIGNAL" .` from the project root to find all usages.
   - Try the same with your editor’s multi-file search feature.

4. **Creating and Extracting Archives**
   - From the parent directory of `unix_course_project`, run:
     - `tar czf unix_course_project.tar.gz unix_course_project`
     - `zip -r unix_course_project.zip unix_course_project`
   - Move `unix_course_project` aside or rename it, then:
     - Extract each archive into a new directory and verify structure and contents.

5. **Backup Habit**
   - Create a timestamped archive for backup:
     - Example: `tar czf unix_course_project_$(date +%Y%m%d).tar.gz unix_course_project`
   - Verify that the archive exists and can be extracted.

---

## Assessment

- [ ] Can perform basic editing tasks in a chosen editor
- [ ] Can create a clean, multi-directory project structure
- [ ] Can search across files for specific text
- [ ] Can create and extract both `tar.gz` and `zip` archives
- [ ] Can produce a backup archive of a project with a sensible name
- [ ] Understands what types of files should generally be excluded from archives and version control

---

## Next Steps

After completing this module, proceed to **Module 6: Git Basics for Course Work** to learn how to track changes to your projects using Git and collaborate via GitHub.

