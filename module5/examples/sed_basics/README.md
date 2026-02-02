# sed basics example

Practice **simple substitution** and **line printing** with `sed` (stream editor).

## Layout

```
sed_basics/
├── README.md       # this file
├── sample.txt      # text to modify (copy before in-place)
└── config_like.txt # key=value style
```

## Try these (from repo root)

```bash
cd module5/examples/sed_basics
sed 's/old/new/' sample.txt
sed 's/old/new/g' sample.txt
sed 's/foo/bar/' sample.txt
sed -n '2p' sample.txt
sed '2d' sample.txt
cp sample.txt sample.bak
sed -i 's/old/NEW/' sample.txt   # GNU sed in-place
cat sample.txt
mv sample.bak sample.txt
```

## 1. Substitute (s/old/new/)

- **`sed 's/old/new/' file`** — replace **first** occurrence of `old` with `new` on each line (output only; file unchanged).
- **`sed 's/old/new/g' file`** — replace **all** occurrences on each line (global).
- **`sed -i 's/old/new/' file`** — in-place edit (GNU sed; backup with `sed -i.bak`).

## 2. Delimiter

Use another delimiter if pattern contains `/`: **`sed 's|/path/|/new/|' file`**.

## 3. Print and delete lines

- **`sed -n '2p' file`** — print only line 2 (`-n` = no default print).
- **`sed '2d' file`** — delete line 2 (output without that line).

## 4. Practical use

- **Config**: `sed 's/^KEY=.*/KEY=newvalue/' config.txt` — replace a line (careful with in-place).
- **Logs**: `sed 's/ERROR/CRITICAL/' run.log` — change string in stream.
- **One-off**: Prefer `sed` for simple substitutions; for complex edits use a script or editor.

Always test without `-i` first; use `cp file file.bak` before in-place edits.
