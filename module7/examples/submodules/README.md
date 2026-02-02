# Submodules example

Practice **adding** and **updating** Git submodules for shared IP or libraries.

## Layout

```
submodules/
├── README.md           # this file
└── commands_to_try.txt # copy-paste commands
```

## 1. What are submodules?

A **submodule** is another Git repository embedded inside your project at a specific path. Common uses:

- **Shared IP** — RTL or verification blocks used by several projects
- **Libraries** — verification libraries, test utilities
- **Tool trees** — scripts or tools maintained in a separate repo

The parent repo stores only the **path** and the **commit** the submodule should be at. It does not store the submodule’s files directly.

## 2. Adding a submodule

```bash
git submodule add <url> path/to/submodule
```

Example:

```bash
git submodule add https://github.com/some-org/shared-ip.git external/shared-ip
```

This clones the repo into `external/shared-ip` and records the current commit in the parent repo. Git creates/updates `.gitmodules` and adds the submodule path to the index.

**Commit the change:**

```bash
git add .gitmodules external/shared-ip
git commit -m "Add shared-ip as submodule"
```

## 3. Cloning a repo that has submodules

When you clone a repo that contains submodules, the submodule directories are **empty** until you run:

```bash
git submodule update --init --recursive
```

Or clone with:

```bash
git clone --recurse-submodules <url>
```

## 4. Updating a submodule to a newer commit

```bash
cd path/to/submodule
git pull
cd ../..
git add path/to/submodule
git commit -m "Update submodule to latest"
```

The parent repo must record the new commit; otherwise others will still get the old submodule commit when they clone or update.

## 5. Common pitfalls

- **Forgetting `git submodule update --init`** — after clone, submodule dirs are empty until you run it.
- **Changing submodule without updating parent** — if you commit inside the submodule, also commit the parent repo so the new submodule commit is recorded.

See `commands_to_try.txt` for a compact list. Use a real small repo URL when trying `git submodule add` (e.g. a small public repo or one provided by your course).
