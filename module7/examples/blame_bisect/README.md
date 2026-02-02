# Blame and bisect example

Practice **inspecting** who changed each line with `git blame` and **finding** the commit that introduced a bug with `git bisect`.

## Layout

```
blame_bisect/
├── README.md           # this file
└── commands_to_try.txt # copy-paste commands
```

## 1. git blame

**See who last modified each line:**

```bash
git blame notes.md
git blame -L 1,20 notes.md
```

Each line is prefixed with commit hash, author, date, and line number. Use it to see **who** changed a line and **which commit** (then use `git show <hash>` for the full commit).

**Use cases:** Understanding why a line exists, finding the commit that introduced a change, coordinating with teammates.

## 2. git bisect (conceptual workflow)

**Find the commit that introduced a bug:**

1. **Start bisect:** `git bisect start`
2. **Mark a bad commit** (e.g. current HEAD): `git bisect bad`
3. **Mark a good commit** (known working): `git bisect good <hash>`
4. Git checks out a revision in the middle. **Test** (e.g. run simulation or build).
5. **Mark result:** `git bisect good` or `git bisect bad`
6. Repeat until Git reports: “The first bad commit is <hash>”
7. **End bisect:** `git bisect reset`

**Automating with a script:**

```bash
git bisect start
git bisect bad
git bisect good abc1234
git bisect run ./scripts/test.sh
git bisect reset
```

`test.sh` should exit 0 for good, non-zero for bad.

**Digital design use:** Finding when a regression entered RTL or a testbench (e.g. a simulation that used to pass now fails).

See `commands_to_try.txt` for a compact list.
