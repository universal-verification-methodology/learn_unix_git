# Module 5: Editors, Projects & Archives

**Goal**: Work effectively with editors, organize projects, and move/share code safely

---

## Navigation

[← Previous: Module 4: Shell Productivity & Basic Scripting](MODULE4.md) | [Next: Module 6: Git Basics for Course Work →](MODULE6.md)

[↑ Back to README](../README.md)

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

