# Practice sandbox & browser labs

[![Sandbox](https://img.shields.io/badge/sandbox-unix--git--practice-orange)](https://github.com/universal-verification-methodology/unix-git-practice)
[![Shared IP](https://img.shields.io/badge/submodule-unix--git--shared--ip-blue)](https://github.com/universal-verification-methodology/unix-git-shared-ip)
[![Course](https://img.shields.io/badge/course-learn__unix__git-0A9EDC)](https://github.com/universal-verification-methodology/learn_unix_git)

Course **examples** live in this repository. For **real GitHub remotes, pull requests, Make, and submodules**, use the org sandbox templates and (optionally) the companion browser platform.

## Why a separate sandbox?

| Surface | Safe for |
|---------|----------|
| **This repo (`learn_unix_git`)** | Reading modules, local `examples/`, `moduleN.sh` |
| **`unix-git-practice` template** | Student push, PR, submission rehearsal |
| **`unix-git-shared-ip`** | Submodule / shared-IP pin demos |
| **`platform/tools/`** | In-browser concept labs (no install) |

Pushing coursework into the curriculum tree would mix student noise with shared history. The template keeps those concerns apart — same pattern as industry “starter” vs “docs” repos.

## GitHub sandbox (Unix & Git)

| Repo | Role |
|------|------|
| [unix-git-practice](https://github.com/universal-verification-methodology/unix-git-practice) | Student **template** — Use this template, Make, PR |
| [unix-git-shared-ip](https://github.com/universal-verification-methodology/unix-git-shared-ip) | Shared library **submodule** at `external/shared-ip` |

```bash
# Writable copy: on GitHub click “Use this template”, then:
git clone --recurse-submodules https://github.com/<YOU>/unix-git-practice.git
cd unix-git-practice
make test
bash scripts/check_ready.sh
```

Explore-only clone of the org template:

```bash
git clone --recurse-submodules \
  https://github.com/universal-verification-methodology/unix-git-practice.git
```

## Browser platform (learning monorepo)

If you have a checkout that includes `platform/`:

| Lab | Path |
|-----|------|
| Remotes / PR / submodule checklist | `platform/tools/remotes/` |
| All Unix & Git browser tools | `platform/tools/index.html` |
| Pre-push checklist (browser) | `platform/tools/workflow/` |
| Conflict resolver | `platform/tools/git-conflicts/` |
| Blame & bisect | `platform/tools/blame-bisect/` |

```bash
python -m http.server 8080 --directory platform
# → http://localhost:8080/tools/
```

## Where this fits in the modules

| Module | Sandbox focus |
|--------|----------------|
| **6** | Template clone, status/add/commit, first push |
| **7** | Branch + PR on your copy; `git submodule update --init` |
| **8** | `make test`, `bash scripts/check_ready.sh`, submission loop |
