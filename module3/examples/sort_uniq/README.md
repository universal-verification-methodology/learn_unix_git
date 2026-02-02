# Sort and uniq example

Practice **sorting** lines with `sort`, **deduplicating** with `uniq`, and **counting** with `wc`.

## Layout

```
sort_uniq/
├── README.md       # this file
├── names.txt       # list with duplicates
├── numbers.txt     # numbers for numeric sort
└── sample.log      # log snippets for sorting
```

## Try these (from repo root)

```bash
cd module3/examples/sort_uniq
cat names.txt
sort names.txt
sort names.txt | uniq
sort names.txt | uniq -c
sort -n numbers.txt
wc -l names.txt
wc -l names.txt sample.log
```

## 1. sort

- **`sort file`** — sort lines alphabetically (stdout).
- **`sort -n file`** — numeric sort (e.g. 2, 10, 100).
- **`sort -r file`** — reverse order.
- **`sort -u file`** — sort and remove duplicates (like sort | uniq).

## 2. uniq

**`uniq`** removes **adjacent** duplicate lines. So use **`sort | uniq`** to deduplicate the whole file.

- **`sort file | uniq`** — unique lines.
- **`sort file | uniq -c`** — unique lines with count (how many times each appeared).

## 3. wc (word count)

- **`wc -l file`** — count lines.
- **`wc -l file1 file2`** — line counts per file and total.
- **`command | wc -l`** — count lines of command output (e.g. `grep ERROR run.log | wc -l`).

## 4. Practical use

- **Logs**: `grep ERROR run.log | sort | uniq -c` — count each unique error line.
- **Lists**: `sort names.txt | uniq` — deduplicate a list.
- **Numeric**: `sort -n numbers.txt` — correct order for version or line numbers.

Use sort/uniq/wc together with pipes and grep when analyzing logs or lists.
