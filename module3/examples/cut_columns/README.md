# cut (columns) example

Practice **extracting columns** from lines with `cut` (by delimiter or by character position).

## Layout

```
cut_columns/
├── README.md       # this file
├── csv_like.txt    # comma-separated
├── log_like.txt    # space/tab separated
└── fixed.txt       # fixed-width style
```

## Try these (from repo root)

```bash
cd module3/examples/cut_columns
cut -d',' -f1 csv_like.txt
cut -d',' -f2 csv_like.txt
cut -d',' -f1,3 csv_like.txt
cut -d' ' -f2 log_like.txt
cut -c1-5 fixed.txt
cut -c6-10 fixed.txt
cat csv_like.txt | cut -d',' -f1
```

## 1. cut by delimiter

- **`cut -d',' -f1 file`** — use comma as delimiter; print field 1 (first column).
- **`cut -d',' -f2,4 file`** — print fields 2 and 4.
- **`cut -d' ' -f2 file`** — space-delimited; second field. For tab use `-d$'\t'` in bash.

## 2. cut by character position

- **`cut -c1-5 file`** — characters 1 through 5 of each line.
- **`cut -c6- file`** — from character 6 to end of line.

## 3. With pipes

- **`cat file | cut -d',' -f1`** — same as `cut -d',' -f1 file`.
- **`grep ERROR run.log | cut -d' ' -f3`** — third field of each ERROR line.

## 4. Practical use

- **CSV**: extract one column: `cut -d',' -f1 data.csv`.
- **Logs**: extract timestamp or level: `cut -d' ' -f1-2 run.log`.
- **Fixed-width**: legacy output with columns at fixed positions: use `-c`.

Fields are 1-based. Delimiter is single character; for complex CSV use dedicated tools (e.g. awk, csvkit).
