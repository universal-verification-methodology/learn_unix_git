# Exit codes example

Practice **returning** and **checking** exit codes in scripts (`exit 0`, `exit 1`) and with `$?`.

## Layout

```
exit_codes/
├── README.md       # this file
├── success.sh      # exits 0 (chmod u+x)
├── failure.sh      # exits 1 (chmod u+x)
└── check_file.sh   # exits 0 if file exists, 1 otherwise (chmod u+x)
```

## Try these (from repo root)

```bash
cd module4/examples/exit_codes
chmod u+x success.sh failure.sh check_file.sh
./success.sh
echo $?
./failure.sh
echo $?
./check_file.sh README.md
echo $?
./check_file.sh missing.txt
echo $?
if ./success.sh; then echo "OK"; fi
if ./failure.sh; then echo "OK"; else echo "Failed"; fi
```

## 1. Exit codes

- **0** — success (convention).
- **Non-zero** (e.g. 1, 2) — failure or specific error. Scripts and programs set this with **`exit 0`** or **`exit 1`**.

## 2. Checking $?

- **`$?`** — exit code of the **last** command. Check immediately; the next command overwrites it.
- **`if command; then ...; else ...; fi`** — run command and branch on its exit code (0 = true, non-zero = false).

## 3. In scripts

- **`exit 0`** — script finished successfully.
- **`exit 1`** (or other non-zero) — script failed; callers (e.g. CI, other scripts) can check `$?` or use `if ./script.sh`.

## 4. set -e

With **`set -e`**, the script exits as soon as any command fails (non-zero). Use so you don’t have to check `$?` after every command; combine with explicit `exit 1` for invalid arguments.

Use exit codes so scripts and pipelines can detect success or failure reliably.
