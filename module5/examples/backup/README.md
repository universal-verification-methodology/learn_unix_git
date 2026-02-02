# Backup example

Practice **timestamped archives** for backups and **what to exclude** so archives stay small and safe.

## Layout

```
backup/
├── README.md       # this file
└── backup_demo.sh  # creates a timestamped tar.gz (chmod u+x to run)
```

## Try these (from repo root)

**1. Timestamped archive (manual)**

```bash
cd module5/examples
# Replace PROJECT with a dir you want to back up (e.g. project_structure/sample_project)
tar czf "backup_$(date +%Y%m%d_%H%M%S).tar.gz" project_structure/sample_project
ls -la backup_*.tar.gz
```

**2. Using the demo script**

```bash
cd module5/examples/backup
chmod u+x backup_demo.sh
./backup_demo.sh
ls -la *.tar.gz
```

**3. Extract and verify**

```bash
tar tzf backup_YYYYMMDD_HHMMSS.tar.gz
mkdir -p /tmp/restore
tar xzf backup_YYYYMMDD_HHMMSS.tar.gz -C /tmp/restore
ls -la /tmp/restore
```

## 1. Local backups

- **Copy** project dirs to another drive or backup folder.
- **Timestamped archives** — e.g. `project_20240203.tar.gz` or `project_20240203_143022.tar.gz` so you can keep several versions without overwriting.

## 2. What to exclude

Exclude build artifacts and generated files so backups are smaller and portable:

- **build/**, **out/**, **obj/**, **dist/**
- **\*.log**, **\*.o**, **\*.vcd**, **\*.vcd**
- **.cache/**, **__pycache__/**

Align with `.gitignore` so the same patterns work for archives and (later) version control.

## 3. Transferring and preparing for Git

- Use **archives** for offline sharing (USB, upload). Zip is often expected on Windows.
- **Clean before archiving** — remove `build/`, temp files, and large generated data so the archive is small and ready to share or later put under Git.
