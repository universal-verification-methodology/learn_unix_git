#!/usr/bin/env python3
"""Write module-specific Mermaid architecture diagrams for slide decks."""

from __future__ import annotations

from pathlib import Path

COURSE_ROOT = Path(__file__).resolve().parent.parent

# rtl_architecture.mmd — primary stack / structure diagram per module
RTL: dict[int, str] = {
    1: """flowchart TB
  T["Terminal emulator\\n(window you type in)"]
  S["Shell (bash/zsh)\\nparses commands"]
  K["Kernel\\nruns programs, manages files"]
  F["Filesystem tree\\n/ home src tb build"]
  T --> S --> K --> F
""",
    2: """flowchart LR
  U["User / Group / Other"]
  P["rwx permission bits"]
  F["File or directory"]
  X["Execute bit → ./script.sh"]
  U --> P --> F
  P --> X
""",
    3: """flowchart LR
  IN["stdin (fd 0)"]
  CMD["Process\\ne.g. grep sim"]
  OUT["stdout (fd 1)"]
  ERR["stderr (fd 2)"]
  IN --> CMD --> OUT
  CMD --> ERR
""",
    4: """flowchart TB
  SH["#!/usr/bin/env bash"]
  VAR["Variables & $1 $2"]
  CTL["if / for / case"]
  EC["Exit code $?"]
  SH --> VAR --> CTL --> EC
""",
    5: """flowchart TB
  ROOT["project_root/"]
  SRC["src/ RTL source"]
  TB["tb/ testbenches"]
  DOC["docs/"]
  SCR["scripts/"]
  BLD["build/ generated"]
  ROOT --> SRC
  ROOT --> TB
  ROOT --> DOC
  ROOT --> SCR
  ROOT --> BLD
""",
    6: """flowchart LR
  WT["Working tree\\n(edit files)"]
  ST["Staging area\\ngit add"]
  REPO["Local repo\\ngit commit"]
  REM["Remote\\nGitHub"]
  WT -->|git add| ST -->|git commit| REPO
  REPO <-->|push / pull| REM
""",
    7: """flowchart TB
  M["main branch"]
  F["feature branch"]
  MG["git merge"]
  CF["Conflict markers\\n<<<<<<<"]
  M --> MG
  F --> MG
  MG --> CF
""",
    8: """flowchart TB
  CL["git clone template"]
  ED["Edit src/ tb/"]
  RN["scripts/run_*.sh"]
  LG["logs/ build/"]
  CM["git commit"]
  PS["git push"]
  CL --> ED --> RN --> LG --> CM --> PS
""",
}

# verification_architecture.mmd — workflow / data-flow diagram
VERIFY: dict[int, str] = {
    1: """flowchart LR
  CMD["Command\\npwd ls cd"]
  STD["stdout to terminal"]
  LOG["Log file\\n(sim preview)"]
  CMD --> STD
  CMD --> LOG
""",
    2: """flowchart LR
  Q["which git"]
  PATH["PATH directories"]
  BIN["/usr/bin/git"]
  Q --> PATH --> BIN
""",
    3: """flowchart LR
  A["grep ERROR log"]
  B["sort"]
  C["uniq -c"]
  D["head -20"]
  A --> B --> C --> D
""",
    4: """flowchart LR
  ARG["Arguments $1 $2"]
  SCR["script.sh"]
  OUT["Printed output"]
  ARG --> SCR --> OUT
""",
    5: """flowchart LR
  FIND["find . -name *.v"]
  GREP["grep -R signal src/"]
  HIT["Matching files"]
  FIND --> HIT
  GREP --> HIT
""",
    6: """flowchart LR
  ED["Edit file"]
  ADD["git add"]
  COM["git commit"]
  LOG["git log"]
  ED --> ADD --> COM --> LOG
""",
    7: """flowchart LR
  BR["git branch feature"]
  WK["Work & commit"]
  MR["git merge"]
  BR --> WK --> MR
""",
    8: """flowchart LR
  RUN["./scripts/run_demo.sh"]
  CAP["> logs/run.log 2>&1"]
  GREP["grep ERROR logs/"]
  RUN --> CAP --> GREP
""",
}

# testing_methods.mmd — self-check and practice flow
TESTING: dict[int, str] = {
    1: """flowchart LR
  CH["module1.sh --check"]
  EX["EXAMPLES.md labs"]
  CK["CHECKLIST.md"]
  CH --> EX --> CK
""",
    2: """flowchart LR
  CH["module2.sh --check"]
  CHM["chmod +x hello.sh"]
  WH["which bash git"]
  CH --> CHM --> WH
""",
    3: """flowchart LR
  CH["module3.sh --check"]
  RD["redirection > 2>&1"]
  PI["pipes | grep"]
  CH --> RD --> PI
""",
    4: """flowchart LR
  CH["module4.sh --check"]
  SH["./say_hello.sh"]
  GR["./greet.sh args"]
  CH --> SH --> GR
""",
    5: """flowchart LR
  CH["module5.sh --check"]
  TR["tree / find"]
  AR["tar czf backup"]
  CH --> TR --> AR
""",
    6: """flowchart LR
  CH["module6.sh --check"]
  ST["git status"]
  DF["git diff"]
  CH --> ST --> DF
""",
    7: """flowchart LR
  CH["module7.sh --check"]
  MG["merge practice"]
  RF["git reflog"]
  CH --> MG --> RF
""",
    8: """flowchart LR
  CH["module8.sh --check"]
  RN["run_demo.sh"]
  PP["pre-push checklist"]
  CH --> RN --> PP
""",
}


def write_diagrams(module: int) -> None:
    """Write all three architecture diagrams for one module."""
    base = COURSE_ROOT / "media" / f"module{module}" / "assets" / "diagrams"
    base.mkdir(parents=True, exist_ok=True)
    (base / "rtl_architecture.mmd").write_text(RTL[module], encoding="utf-8")
    (base / "verification_architecture.mmd").write_text(VERIFY[module], encoding="utf-8")
    (base / "testing_methods.mmd").write_text(TESTING[module], encoding="utf-8")


def main() -> int:
    for n in range(1, 9):
        write_diagrams(n)
        print(f"Wrote diagrams for module {n}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
