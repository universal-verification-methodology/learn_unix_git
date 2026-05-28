#!/usr/bin/env python3
"""Generate media/moduleN outline.yaml, manifest.yaml, learning_path.mmd for modules 2-8."""

from __future__ import annotations

from pathlib import Path
from textwrap import dedent

import yaml

COURSE = Path(__file__).resolve().parent.parent

MODULES: dict[int, dict] = {
    2: {
        "title": "Filesystem, Permissions & Environment",
        "subtitle": "Understand Unix file types, permissions, and environment variables",
        "path_mmd": "flowchart LR\n  A[File types] --> B[Permissions]\n  B --> C[Ownership]\n  C --> D[Environment PATH]\n  D --> E[Dotfiles]\n  E --> F[Module 3]",
        "objectives": [
            "Read ls -l output (types, permissions, owner)",
            "Use chmod to make scripts executable safely",
            "Explain HOME, PATH, and which",
            "Fix common permission denied and command not found errors",
        ],
        "prereq": ["Module 1 complete (cd, ls, pwd, basic files)"],
        "context": [
            "Simulators and tools depend on PATH",
            "Scripts in projects need chmod +x",
            "Dotfiles like .gitignore appear in every repo",
        ],
        "demos": [
            {
                "id": "module_check",
                "title": "Module 2 self-check",
                "command": "./scripts/module2.sh --check",
                "expect": "All required checks passed",
                "slide_title": "Self-check",
            },
            {
                "id": "permissions_ls",
                "title": "Permissions listing",
                "command": "cd module2/examples/permissions && ls -l hello.sh config.txt",
                "expect": "hello.sh",
                "slide_title": "ls -l and permissions",
            },
            {
                "id": "which_tools",
                "title": "PATH and which",
                "command": "which bash && which git",
                "expect": "bash",
                "slide_title": "Finding commands on PATH",
            },
        ],
        "code": {
            "title": "Make a script executable",
            "source": "module2/CHECKLIST.md",
            "body": "chmod u+x hello.sh\n./hello.sh",
        },
        "scaffold": "./scripts/module2.sh --scaffold",
        "exercises": [
            "chmod on ~/unix_practice/hello.sh",
            "echo $PATH and which for git",
            "ls -la to see dotfiles in examples/dotfiles",
        ],
        "summary": ["File types and rwx permissions", "PATH and environment", "Next: Module 3 — processes & pipes"],
        "next": "Module 3: Processes, Pipes & Redirection",
    },
    3: {
        "title": "Processes, Pipes & Redirection",
        "subtitle": "Manage programs and connect commands with pipes and redirection",
        "path_mmd": "flowchart LR\n  A[Processes] --> B[Redirection]\n  B --> C[Pipes & grep]\n  C --> D[Log analysis]\n  D --> E[Module 4]",
        "objectives": [
            "Stop foreground jobs with Ctrl+C",
            "Redirect stdout/stderr to log files",
            "Chain commands with pipes",
            "Search simulator logs with grep",
        ],
        "prereq": ["Module 2 (permissions, executable scripts)"],
        "context": [
            "Save build/sim output: command > run.log 2>&1",
            "Filter errors: grep -i error run.log",
            "Exit status $? indicates success or failure",
        ],
        "demos": [
            {
                "id": "module_check",
                "title": "Module 3 self-check",
                "command": "./scripts/module3.sh --check",
                "expect": "All required checks passed",
                "slide_title": "Self-check",
            },
            {
                "id": "grep_errors",
                "title": "grep on sample log",
                "command": "cd module3/examples/pipes && grep ERROR sample.log",
                "expect": "ERROR",
                "slide_title": "Searching logs",
            },
            {
                "id": "redirection",
                "title": "Separate stdout and stderr",
                "command": "cd module3/examples/redirection && chmod u+x print_both.sh && ./print_both.sh > /tmp/m3_out.log 2> /tmp/m3_err.log && head -2 /tmp/m3_out.log",
                "expect": "stdout",
                "slide_title": "Redirection demo",
            },
        ],
        "code": {
            "title": "Capture full log",
            "source": "docs/MODULE3.md",
            "body": "./scripts/run_tests.sh > logs/run.log 2>&1\ntail -f logs/run.log",
        },
        "scaffold": "./scripts/module3.sh --scaffold",
        "exercises": ["grep ERROR on ~/unix_practice/sample.log", "Try 2>&1 | tee debug.log", "Check echo $? after a command"],
        "summary": ["Processes and exit status", "Redirection and pipes", "Next: Module 4 — shell scripting"],
        "next": "Module 4: Shell Productivity & Basic Scripting",
    },
    4: {
        "title": "Shell Productivity & Basic Scripting",
        "subtitle": "Automate repetitive commands with bash scripts",
        "path_mmd": "flowchart LR\n  A[History & aliases] --> B[Scripts]\n  B --> C[Variables]\n  C --> D[Control flow]\n  D --> E[Safe scripting]\n  E --> F[Module 5]",
        "objectives": [
            "Use history and Ctrl+R effectively",
            "Write scripts with shebang and chmod +x",
            "Pass arguments with $1 and $@",
            "Apply set -e and quoted variables",
        ],
        "prereq": ["Module 3 (redirection, pipes)"],
        "context": [
            "Wrap compile/sim steps in scripts/",
            "Course module scripts are the pattern to follow",
            "Quote variables to avoid word-splitting bugs",
        ],
        "demos": [
            {
                "id": "module_check",
                "title": "Module 4 self-check",
                "command": "./scripts/module4.sh --check",
                "expect": "All required checks passed",
                "slide_title": "Self-check",
            },
            {
                "id": "say_hello",
                "title": "Run example script",
                "command": "cd module4/examples/script_basics && chmod u+x say_hello.sh && ./say_hello.sh",
                "expect": "Hello",
                "slide_title": "First bash script",
            },
            {
                "id": "greet_args",
                "title": "Script with arguments",
                "command": "cd module4/examples/arguments && chmod u+x greet.sh && ./greet.sh Student",
                "expect": "Student",
                "slide_title": "Positional parameters",
            },
        ],
        "code": {
            "title": "Minimal script",
            "source": "module4/examples/script_basics/say_hello.sh",
            "body": "#!/usr/bin/env bash\necho \"Hello from script\"",
        },
        "scaffold": "./scripts/module4.sh --scaffold",
        "exercises": ["Run say_hello.sh and greet.sh from scaffold", "Add an alias ll='ls -alF'", "Write a loop over *.log"],
        "summary": ["Scripts automate design flows", "History and aliases save time", "Next: Module 5 — projects & archives"],
        "next": "Module 5: Editors, Projects & Archives",
    },
    5: {
        "title": "Editors, Projects & Archives",
        "subtitle": "Organize projects and package code with tar and zip",
        "path_mmd": "flowchart LR\n  A[Editors] --> B[Project layout]\n  B --> C[find & grep]\n  C --> D[tar & zip]\n  D --> E[Backups]\n  E --> F[Module 6]",
        "objectives": [
            "Use a consistent src/tb/scripts/build layout",
            "Find files and search with grep -R",
            "Create and extract tar.gz archives",
            "Back up projects before major changes",
        ],
        "prereq": ["Module 4 (basic scripts)"],
        "context": [
            "RTL projects mirror course repo structure",
            "Exclude build/ from archives and Git",
            "grep -R finds signals across a tree",
        ],
        "demos": [
            {
                "id": "module_check",
                "title": "Module 5 self-check",
                "command": "./scripts/module5.sh --check",
                "expect": "All required checks passed",
                "slide_title": "Self-check",
            },
            {
                "id": "project_tree",
                "title": "Sample project layout",
                "command": "cd module5/examples/project_structure/sample_project && find . -type f | head -8",
                "expect": "src",
                "slide_title": "Project structure",
            },
            {
                "id": "tar_list",
                "title": "Create and list tar archive",
                "command": "cd module5/examples/tar_archives && tar czf /tmp/m5_demo.tar.gz demo_dir/ && tar tzf /tmp/m5_demo.tar.gz | head -5",
                "expect": "demo_dir",
                "slide_title": "tar archives",
            },
        ],
        "code": {
            "title": "Create archive",
            "source": "docs/MODULE5.md",
            "body": "tar czf project_$(date +%Y%m%d).tar.gz project_dir/\ntar xzf project.tar.gz",
        },
        "scaffold": "./scripts/module5.sh --scaffold",
        "exercises": ["Scaffold unix_course_project/", "grep -R in sample_project", "Create a tar.gz backup"],
        "summary": ["Organize src/tb/scripts/build", "Archives for sharing", "Next: Module 6 — Git basics"],
        "next": "Module 6: Git Basics for Course Work",
    },
    6: {
        "title": "Git Basics for Course Work",
        "subtitle": "Track changes and work with course repositories",
        "path_mmd": "flowchart LR\n  A[Git model] --> B[init & clone]\n  B --> C[add & commit]\n  C --> D[remotes]\n  D --> E[gitignore]\n  E --> F[Module 7]",
        "objectives": [
            "Explain working tree, staging, and commits",
            "Use status, add, commit, log, diff",
            "Clone and push to GitHub",
            "Write a useful .gitignore for build artifacts",
        ],
        "prereq": ["Module 5 (project structure)", "git installed"],
        "context": [
            "Course work is submitted via Git",
            "Never commit build/ or large waveforms",
            "Small focused commits are easier to review",
        ],
        "demos": [
            {
                "id": "module_check",
                "title": "Module 6 self-check",
                "command": "./scripts/module6.sh --check",
                "expect": "All required checks passed",
                "slide_title": "Self-check",
            },
            {
                "id": "git_version",
                "title": "Git available",
                "command": "git --version",
                "expect": "git version",
                "slide_title": "Git installation",
            },
            {
                "id": "git_help",
                "title": "Git help",
                "command": "git help -a 2>/dev/null | head -5",
                "expect": "git",
                "slide_title": "Exploring git help",
            },
        ],
        "code": {
            "title": "Basic workflow",
            "source": "docs/MODULE6.md",
            "body": "git status\ngit add file.sv\ngit commit -m \"Add counter testbench\"",
        },
        "scaffold": "./scripts/module6.sh --scaffold",
        "exercises": ["Scaffold git_demo and make a commit", "Write .gitignore for build/", "git log --oneline"],
        "summary": ["Local Git workflow", "Remotes and GitHub", "Next: Module 7 — collaboration"],
        "next": "Module 7: Advanced Git for Collaboration",
    },
    7: {
        "title": "Advanced Git for Collaboration",
        "subtitle": "Branches, merges, conflicts, and submodules",
        "path_mmd": "flowchart LR\n  A[Branches] --> B[Merge]\n  B --> C[Conflicts]\n  C --> D[Submodules]\n  D --> E[blame & bisect]\n  E --> F[Module 8]",
        "objectives": [
            "Create and switch feature branches",
            "Merge branches and resolve conflicts",
            "Understand submodules for shared IP",
            "Use git blame and bisect conceptually",
        ],
        "prereq": ["Module 6 (add, commit, push)"],
        "context": [
            "Team labs use branches per feature",
            "Conflicts happen when two people edit same lines",
            "Verification IP may live in submodules",
        ],
        "demos": [
            {
                "id": "module_check",
                "title": "Module 7 self-check",
                "command": "./scripts/module7.sh --check",
                "expect": "All required checks passed",
                "slide_title": "Self-check",
            },
            {
                "id": "conflict_sample",
                "title": "Conflict markers example",
                "command": "head -15 module7/examples/conflicts/sample_conflict.txt",
                "expect": "<<<<<<<",
                "slide_title": "Merge conflict format",
            },
            {
                "id": "git_branch_help",
                "title": "Branch commands",
                "command": "git help branch 2>/dev/null | head -8",
                "expect": "branch",
                "slide_title": "Branches",
            },
        ],
        "code": {
            "title": "Feature branch",
            "source": "docs/MODULE7.md",
            "body": "git checkout -b feature/lab2\ngit merge main",
        },
        "scaffold": "",
        "exercises": ["Create branch in git_demo", "Resolve sample_conflict.txt on paper", "Try git submodule update --init"],
        "summary": ["Branching and merging", "Conflicts and submodules", "Next: Module 8 — end-to-end workflow"],
        "next": "Module 8: End-to-End Project Workflow",
    },
    8: {
        "title": "End-to-End Project Workflow",
        "subtitle": "Combine Unix and Git into a repeatable design flow",
        "path_mmd": "flowchart LR\n  A[Clone template] --> B[Run scripts]\n  B --> C[Logs]\n  C --> D[Git commits]\n  D --> E[Submit]\n  E --> G[Done]",
        "objectives": [
            "Bootstrap a project from a template repo",
            "Run scripted build/test flows",
            "Capture and analyze logs",
            "Commit milestones and push for submission",
        ],
        "prereq": ["Modules 1–7 or equivalent experience"],
        "context": [
            "Full loop: edit → run → inspect → commit → push",
            "Reproducibility matters for grading and debug",
            "Pre-push checks catch common mistakes",
        ],
        "demos": [
            {
                "id": "module_check",
                "title": "Module 8 self-check",
                "command": "./scripts/module8.sh --check",
                "expect": "All required checks passed",
                "slide_title": "Self-check",
            },
            {
                "id": "sample_project_run",
                "title": "Template project script",
                "command": "cd module8/examples/template/sample_project && chmod u+x scripts/run_demo.sh && ./scripts/run_demo.sh",
                "expect": "Run started",
                "slide_title": "Scripted workflow",
            },
            {
                "id": "grep_log",
                "title": "Search captured log",
                "command": "grep INFO module8/examples/template/sample_project/logs/run.log 2>/dev/null | head -3",
                "expect": "INFO",
                "slide_title": "Log inspection",
            },
        ],
        "code": {
            "title": "Run with log capture",
            "source": "module8/examples/template/sample_project/scripts/run_demo.sh",
            "body": "./scripts/run_demo.sh > logs/run.log 2>&1\ngrep -i error logs/run.log",
        },
        "scaffold": "",
        "exercises": ["Walk through sample_project/", "Make a commit after a script run", "Review pre-push checklist in module8"],
        "summary": ["Unix + Git + scripts together", "You are ready for design courses", "Course complete — keep practicing"],
        "next": "Digital design & verification courses",
    },
}


def build_outline(mod: int, spec: dict) -> dict:
    slides: list[dict] = [
        {"type": "title", "title": f"Module {mod}", "subtitle": spec["title"]},
        {
            "type": "bullets",
            "title": "Learning objectives",
            "bullets": spec["objectives"],
        },
        {"type": "bullets", "title": "Prerequisites", "bullets": spec["prereq"]},
        {
            "type": "image",
            "title": "Learning path",
            "image": "assets/diagrams/learning_path.png",
        },
        {"type": "bullets", "title": "Course context", "bullets": spec["context"]},
        {"type": "section", "title": "Core topics"},
    ]
    for i, demo in enumerate(spec["demos"]):
        if i == 1:
            slides.append(
                {
                    "type": "code",
                    "title": spec["code"]["title"],
                    "source_file": spec["code"]["source"],
                    "code": spec["code"]["body"],
                }
            )
        slides.append(
            {
                "type": "demo",
                "title": demo["slide_title"],
                "command": demo["command"],
                "screenshot": f"assets/screenshots/{demo['id']}.png",
            }
        )
    slides.append({"type": "section", "title": "Practice"})
    if spec.get("scaffold"):
        slides.append(
            {
                "type": "code",
                "title": "Exercise scaffold",
                "code": spec["scaffold"],
            }
        )
    slides.append(
        {"type": "bullets", "title": "Exercises", "bullets": spec["exercises"]}
    )
    slides.append(
        {
            "type": "bullets",
            "title": "Summary & next steps",
            "bullets": spec["summary"] + [f"Next: {spec['next']}"],
        }
    )
    return {
        "title": f"Module {mod} — {spec['title']}",
        "course": "learn_unix_git",
        "module": mod,
        "subtitle": spec["subtitle"],
        "footer": f"learn_unix_git / Module {mod}",
        "slides": slides,
    }


def build_manifest(mod: int, spec: dict) -> dict:
    outline = build_outline(mod, spec)
    demo_slides: dict[str, int] = {}
    for i, slide in enumerate(outline["slides"], start=1):
        if slide.get("type") == "demo" and slide.get("screenshot"):
            name = Path(slide["screenshot"]).stem
            demo_slides[name] = i

    assets: list[dict] = [
        {
            "id": "learning_path",
            "type": "diagram",
            "file": "assets/diagrams/learning_path.png",
            "source": "assets/diagrams/learning_path.mmd",
            "generator": "render_diagrams.sh",
            "slides": [4],
            "license": "learn_unix_git course materials",
        }
    ]
    for demo in spec["demos"]:
        sid = demo_slides.get(demo["id"], 0)
        entry: dict = {
            "id": demo["id"],
            "type": "screenshot",
            "file": f"assets/screenshots/{demo['id']}.png",
            "capture_command": demo["command"],
            "cwd": ".",
            "slides": [sid] if sid else [],
        }
        if demo.get("expect"):
            entry["expect_stdout_contains"] = demo["expect"]
        assets.append(entry)
    return {"module": mod, "course": "learn_unix_git", "assets": assets}


def build_script(mod: int, spec: dict) -> str:
    return dedent(
        f"""\
        # Narration script — Module {mod}: {spec['title']}

        **Target length:** ~12 minutes

        ## Timing table

        | Slide | Section | Duration | Notes |
        |-------|---------|----------|-------|
        | 1 | Title | 0:20 | Welcome to Module {mod} |
        | 2 | Objectives | 0:45 | {spec['subtitle']} |
        | 4 | Learning path | 0:40 | Walk through diagram |
        | 8+ | Demos | 4:00 | Run commands from repo root |
        | last | Summary | 0:45 | Next: {spec['next']} |
        """
    )


def main() -> None:
    for mod, spec in MODULES.items():
        media = COURSE / "media" / f"module{mod}"
        media.mkdir(parents=True, exist_ok=True)
        (media / "assets" / "diagrams").mkdir(parents=True, exist_ok=True)
        (media / "assets" / "screenshots").mkdir(parents=True, exist_ok=True)

        outline_path = media / "outline.yaml"
        outline_path.write_text(
            yaml.dump(build_outline(mod, spec), sort_keys=False, allow_unicode=True),
            encoding="utf-8",
        )

        manifest_path = media / "assets" / "manifest.yaml"
        manifest_path.write_text(
            yaml.dump(build_manifest(mod, spec), sort_keys=False, allow_unicode=True),
            encoding="utf-8",
        )

        mmd_path = media / "assets" / "diagrams" / "learning_path.mmd"
        mmd_path.write_text(spec["path_mmd"] + "\n", encoding="utf-8")

        script_path = media / "script.md"
        script_path.write_text(build_script(mod, spec), encoding="utf-8")

        print(f"OK: module {mod} media sources written")


if __name__ == "__main__":
    main()
