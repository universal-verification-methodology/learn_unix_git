#!/usr/bin/env python3
"""Regenerate outlines via the module-to-slides-video skill (legacy CLI name)."""

from __future__ import annotations

import subprocess
import sys
from pathlib import Path

COURSE_ROOT = Path(__file__).resolve().parent.parent
SKILL = Path.home() / ".cursor/skills/module-to-slides-video/scripts/regenerate_course_outlines.sh"


def main() -> int:
    if not SKILL.is_file():
        print(
            f"ERROR: skill not found: {SKILL}\n"
            "Install: ~/.cursor/skills/module-to-slides-video",
            file=sys.stderr,
        )
        return 1
    cmd = ["bash", str(SKILL), str(COURSE_ROOT), *sys.argv[1:]]
    return subprocess.call(cmd)


if __name__ == "__main__":
    sys.exit(main())
