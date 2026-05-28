# Course media — slides, PDF, and video

Generated teaching assets for each module. Source content: `docs/MODULEN.md` and `moduleN/` labs.

See [INDEX.md](INDEX.md) for links to every module’s PPTX, PDF, and video.

## Build (one command)

From the `learn_unix_git` repo root:

```bash
./scripts/build_all_media.sh
```

| Flag | Purpose |
|------|---------|
| `--install-deps` | `sudo apt install` LibreOffice Impress, ffmpeg, poppler (optional; improves PDF) |
| `--pptx-only` | Skip PDF and video |
| `--module 2` | Single module |
| `--regenerate-outlines` | Full syllabus + all EXAMPLES → `outline.yaml` (skill generator) |
| `--no-run-demos` | Reuse existing terminal screenshots (faster) |

Requires the Cursor skill: `~/.cursor/skills/module-to-slides-video` (run `bash …/scripts/setup.sh` once).

## Per-module outputs

| File | Description |
|------|-------------|
| `outline.yaml` | Slide plan (machine input for `build_slides.py`) |
| `script.md` | Narration / timing notes for video |
| `assets/manifest.yaml` | Images and demo capture commands |
| `slides.pptx` | **Primary deck** — edit in PowerPoint |
| `slides.pdf` | PDF export (from PPTX via LibreOffice, or from slide frames) |
| `video.mp4` | Slides + **TTS narration** (`audio/narration.wav`, `captions.srt`) |

## Review all modules

```bash
# Linux
xdg-open media/module1/slides.pptx   # or open in PowerPoint on Windows

# List deliverables
ls -lh media/module*/slides.{pptx,pdf} media/module*/video.mp4
```

## Regenerate outlines + full rebuild (skill)

```bash
./scripts/build_all_media.sh --regenerate-outlines
# or outlines only:
./scripts/regenerate_media_outlines.sh
```

Uses `~/.cursor/skills/module-to-slides-video` (same as other courses in the monorepo). Expect ~39–42 slides per module. Optional: `media/outline_overrides.yaml` for tricky demo captures.

## Git

Intermediate files under `frames/` and `*.log` are gitignored per `media/moduleN/.gitignore`. Commit `slides.pptx` / `slides.pdf` / `video.mp4` if you want them in the repo (large files).
