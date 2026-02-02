# Tags example

Practice **creating and listing tags** with `git tag` for marking releases or milestones (e.g. v1.0, submission deadline).

## Layout

```
tags/
├── README.md           # this file
└── commands_to_try.txt # copy-paste commands
```

## Try these (in a Git repo with at least one commit — e.g. ~/unix_practice/git_demo)

**1. List tags**

```bash
git tag
git tag -l "v*"
```

**2. Create a lightweight tag (current commit)**

```bash
git tag v1.0
git tag submission-2024
```

**3. Create an annotated tag (recommended for releases)**

```bash
git tag -a v1.0 -m "Release 1.0"
```

**4. Show tag info**

```bash
git show v1.0
git log -1 --oneline v1.0
```

**5. Checkout at a tag**

```bash
git checkout v1.0
git checkout -b fix-from-v1 v1.0
```

**6. Push tags to remote**

```bash
git push origin v1.0
git push origin --tags
```

## When to use tags

- **Releases**: `v1.0`, `v2.0` — mark stable points.
- **Course**: `submission-week3` — mark what you submitted.
- **Bisect**: `git bisect good v1.0` — use a tag as a known-good commit.

See `commands_to_try.txt` for a compact list.
