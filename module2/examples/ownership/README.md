# Ownership example

Practice **reading** the **owner** and **group** columns in `ls -l` and understanding who can read, write, or execute files.

## Layout

```
ownership/
├── README.md       # this file
├── myfile.txt      # regular file — you own it
└── explain_ls.sh  # script that runs ls -l and explains columns (chmod u+x to run)
```

## Try these (from repo root)

```bash
cd module2/examples/ownership
ls -l
ls -l myfile.txt
# Run the helper script to see annotated ls -l output:
chmod u+x explain_ls.sh
./explain_ls.sh
```

Then try in other directories:

```bash
ls -l ~
ls -l module2/examples/permissions
ls -l module2/examples/file_types
```

Compare the **owner** and **group** columns (3rd and 4th in `ls -l`). Files you create are owned by your user; the group is often your primary group.

## Interpreting ls -l

Example line:

```
-rw-r--r-- 1 alice devs 120 Feb  3 10:00 myfile.txt
```

| Column        | Meaning        | Example  |
|---------------|----------------|----------|
| Permissions   | rwx for user, group, others | -rw-r--r-- |
| Link count    | Number of hard links        | 1        |
| Owner         | User who owns the file      | alice    |
| Group         | Group that has group perms  | devs     |
| Size          | Size in bytes               | 120      |
| Date/time     | Last modification           | Feb 3 10:00 |
| Name          | File or directory name      | myfile.txt |

**Why it matters**: Permissions are checked as "owner first, then group, then others". If you are the owner, the **user** bits apply to you. If you're in the group but not the owner, the **group** bits apply. Otherwise the **others** bits apply. You normally cannot change ownership of files you don't own (that requires `chown`, often as root).
