#!/usr/bin/env python3
"""Truncate long outline bullets so verify_media.py passes (max 140 chars)."""

from __future__ import annotations

import argparse
import sys
from pathlib import Path
from typing import Any

import yaml

MAX_BULLET = 135


def _truncate(text: str, limit: int = MAX_BULLET) -> str:
    s = " ".join(str(text).split())
    if len(s) <= limit:
        return s
    cut = s[: limit - 1].rsplit(" ", 1)[0]
    return f"{cut}…" if cut else f"{s[: limit - 1]}…"


def _sanitize_slide(spec: dict[str, Any]) -> None:
    if spec.get("type") != "bullets":
        return
    bullets = spec.get("bullets")
    if not isinstance(bullets, list):
        return
    spec["bullets"] = [_truncate(b) for b in bullets]
    if spec.get("title") == "Overview" and len(spec["bullets"]) == 1:
        text = spec["bullets"][0]
        if len(text) > MAX_BULLET:
            words = text.split()
            mid = len(words) // 2
            spec["bullets"] = [
                _truncate(" ".join(words[:mid])),
                _truncate(" ".join(words[mid:])),
            ]


def sanitize_outline(path: Path) -> int:
    data = yaml.safe_load(path.read_text(encoding="utf-8"))
    if not isinstance(data, dict):
        return 0
    changed = 0
    for slide in data.get("slides", []):
        if not isinstance(slide, dict):
            continue
        before = yaml.dump(slide, allow_unicode=True)
        _sanitize_slide(slide)
        if yaml.dump(slide, allow_unicode=True) != before:
            changed += 1
    path.write_text(
        yaml.dump(data, allow_unicode=True, sort_keys=False, default_flow_style=False),
        encoding="utf-8",
    )
    return changed


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("course_root", type=Path)
    args = parser.parse_args()
    media = args.course_root / "media"
    total = 0
    for outline in sorted(media.glob("module*/outline.yaml")):
        n = sanitize_outline(outline)
        if n:
            print(f"OK: {outline.relative_to(args.course_root)} — sanitized {n} slide(s)")
            total += n
    if total == 0:
        print("No changes needed.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
