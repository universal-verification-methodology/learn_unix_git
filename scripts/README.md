# Scripts

Scripts for running module checks, demos, scaffolds, Git helpers, and **slides/PDF/video** generation.

## Media scripts

| Script | Purpose |
|--------|---------|
| `build_all_media.sh` | **Full skill pipeline** — pptx → pdf → TTS → video (all modules) |
| `regenerate_media_outlines.sh` | Regenerate outlines only (skill: syllabus + all EXAMPLES) |
| `generate_media_outlines.py` | Same as `regenerate_media_outlines.sh` (legacy name) |
| `verify_all_media.sh` | Verify outlines, assets, audio on video |

Uses skill: `~/.cursor/skills/module-to-slides-video` (set `SKILL_ROOT` to override).

```bash
./scripts/build_all_media.sh                      # rebuild with existing outlines
./scripts/build_all_media.sh --regenerate-outlines  # full decks + rebuild
./scripts/build_all_media.sh --module 3 --run-demos
./scripts/verify_all_media.sh
```

Outputs: `media/moduleN/slides.pptx`, `slides.pdf`, `video.mp4`. See [media/README.md](../media/README.md) and [media/INDEX.md](../media/INDEX.md).

## Module scripts

Run from the **repository root**:

| Script         | Purpose                                      | Options                          |
|----------------|----------------------------------------------|----------------------------------|
| `module1.sh`   | Linux & Shell Basics                         | `--check`, `--demo`, `--scaffold` |
| `module2.sh`   | Filesystem, Permissions & Environment       | `--check`, `--demo`, `--scaffold` |
| `module3.sh`   | Processes, Pipes & Redirection              | `--check`, `--demo`, `--scaffold` |
| `module4.sh`   | Shell Productivity & Basic Scripting        | `--check`, `--demo`, `--scaffold` |
| `module5.sh`   | Editors, Projects & Archives                | `--check`, `--demo`, `--scaffold` |
| `module6.sh`   | Git Basics for Course Work                  | `--check`, `--demo`, `--scaffold` |
| `module7.sh`   | Advanced Git (branches, merge, submodules)  | `--check`, `--demo`              |
| `module8.sh`   | End-to-End Project Workflow                 | `--check`, `--demo`              |

Example:

```bash
./scripts/module1.sh --check
./scripts/module6.sh --scaffold
cd ~/unix_practice/git_demo && git status
```

## Git scripts (including submodules)

Run from the **repository root** (or, for clone, from the parent directory where you want the clone).

| Script                     | Purpose                                      | Usage |
|----------------------------|----------------------------------------------|--------|
| `git-submodule-init.sh`   | Initialize and update submodules after clone | `./scripts/git-submodule-init.sh` or `--check` |
| `git-submodule-add.sh`    | Add a submodule (url + optional path)       | `./scripts/git-submodule-add.sh <url> [path]` |
| `git-submodule-status.sh` | Show status of all submodules                | `./scripts/git-submodule-status.sh` or `--verbose` |
| `git-clone-with-submodules.sh` | Clone a repo and init submodules         | `./scripts/git-clone-with-submodules.sh <url> [dir]` |

### git-submodule-init.sh

After cloning a repo that has submodules, the submodule directories are empty until you run:

```bash
./scripts/git-submodule-init.sh
```

This runs `git submodule update --init --recursive` from the repo root.

- **`--check`** — Only verify we're in a Git repo and list submodules (no clone/update).

### git-submodule-add.sh

Add a new submodule:

```bash
./scripts/git-submodule-add.sh https://github.com/org/shared-ip.git external/shared-ip
./scripts/git-submodule-add.sh https://github.com/org/lib.git   # path defaults to external/lib
```

Then commit: `git add .gitmodules external/shared-ip && git commit -m "Add submodule"`.

### git-submodule-status.sh

Show submodule status (commit and path):

```bash
./scripts/git-submodule-status.sh
./scripts/git-submodule-status.sh --verbose   # also run git status in each submodule
```

### git-clone-with-submodules.sh

Clone a repository and initialize its submodules in one go:

```bash
./scripts/git-clone-with-submodules.sh https://github.com/org/repo.git
./scripts/git-clone-with-submodules.sh https://github.com/org/repo.git my-repo
```

Equivalent one-liner with Git: `git clone --recurse-submodules <url> [dir]`.

## Making scripts executable

From the repo root:

```bash
chmod +x scripts/*.sh
```

## Related

- **Module 6**: [module6/README.md](../module6/README.md) — Git basics, scaffold (`module6.sh --scaffold`).
- **Module 7**: [module7/examples/submodules/](../module7/examples/submodules/) — Submodule examples and `commands_to_try.txt`.
