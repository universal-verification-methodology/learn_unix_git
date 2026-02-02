# Relative symlinks in projects example

Practice **creating relative symlinks** with `ln -s` so links work when the project is moved or cloned elsewhere.

## Layout

```
link_relative/
├── README.md       # this file
├── project/        # mock project root
│   ├── src/
│   │   └── main.v
│   ├── external/   # where we might link shared IP
│   └── scripts/
└── shared/         # mock "shared IP" dir (sibling to project)
    └── lib.v
```

## Try these (from repo root)

```bash
cd module5/examples/link_relative/project
ln -s ../../shared/lib.v external/lib.v
ls -la external/
readlink external/lib.v
cat external/lib.v
cd ..
# Moving the whole learn_unix_git repo keeps the link valid
# because we used a path relative to the link's location
```

## 1. Relative vs absolute symlinks

- **`ln -s /abs/path/to/target linkname`** — absolute. Breaks if target or project is moved.
- **`ln -s relative/path/to/target linkname`** — relative to the **link’s** directory. Stays valid when the project (or repo) is moved, as long as the relative path from link to target is unchanged.

## 2. Relative path from link’s directory

From `project/external/lib.v` (the link) to `shared/lib.v` (target), going up from `project/external/` to repo root is `../..`, then `shared/lib.v`, so:

- **`ln -s ../../shared/lib.v external/lib.v`** — create link in `project/external/` pointing to `shared/lib.v` with a path relative to `external/`.

Create the link **from the directory that will contain the link** (or use a path relative to that directory).

## 3. In projects

- **Shared IP**: link `external/foo` → `../../shared/foo` so everyone cloning the repo gets the same layout.
- **Submodules**: Git submodules are an alternative; symlinks are simple when you just need one shared tree.

## 4. Check the link

- **`readlink linkname`** — show target (relative or absolute).
- **`ls -la dir/`** — symlinks show as `linkname -> target`.

Use relative symlinks so project and shared dirs can be moved or cloned without breaking links.
