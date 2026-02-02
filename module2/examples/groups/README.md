# Groups example

Practice **viewing your user and groups** with `id` and `groups`, and understanding group membership in `ls -l`.

## Layout

```
groups/
├── README.md       # this file
└── show_id.sh      # run with ./show_id.sh (chmod u+x) to print id and groups
```

## Try these (from repo root)

```bash
cd module2/examples/groups
id
id -un
id -Gn
groups
chmod u+x show_id.sh
./show_id.sh
ls -l ..
```

## 1. Who am I?

- **`id`** — print user ID (uid), primary group (gid), and all groups.
- **`id -un`** — print only your username.
- **`id -Gn`** — print all group names you belong to.

## 2. groups command

- **`groups`** — list group names for the current user (simpler than `id -Gn`).

## 3. Why it matters

- **Ownership**: Files you create are owned by you (uid) and your primary group (gid).
- **Permissions**: Group bits (e.g. `rw-` in `rwxr-xr-x`) apply to users who are in the file’s group.
- **Shared dirs**: In course or team dirs, the directory is often setgid and group-writable so everyone in the group can create/edit files. Use `id` and `groups` to confirm you’re in the right group.

## 4. ls -l and groups

In `ls -l`, the **fourth column** is the group. If you’re in that group, the group permission bits apply to you. Use `groups` to see your memberships and compare with the group shown in `ls -l`.
