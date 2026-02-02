# Init and clone example

Practice **creating** a new repo with `git init` and **cloning** an existing repo with `git clone`.

## Layout

```
init_clone/
├── README.md           # this file
└── commands_to_try.txt # copy-paste commands
```

## Try these

**1. Initialize a new repo** (use a new or practice directory, not inside another repo)

```bash
mkdir -p ~/unix_practice/my_repo
cd ~/unix_practice/my_repo
git init
ls -la .git
```

Or use the scaffold: `./scripts/module6.sh --scaffold` creates `~/unix_practice/git_demo` with `git init` and a sample file.

**2. Clone an existing repo**

```bash
cd ~/unix_practice
git clone https://github.com/some-org/some-repo.git
cd some-repo
git status
git log --oneline | head -5
```

Replace the URL with a real public repo (e.g. a course starter repo). Cloning creates a new directory with the repo name and a full copy of the history.

**3. Typical course pattern**

- Instructor provides a **starter repo** URL.
- You run `git clone <starter-url>` to get your own copy.
- You work locally (edit, add, commit), then push to your fork or assignment repo when ready.

See `commands_to_try.txt` for a compact list of commands.
