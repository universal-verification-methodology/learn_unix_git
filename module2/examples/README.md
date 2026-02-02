# Module 2 Examples

Hands-on examples for **Filesystem, Permissions & Environment**: file types, permissions, ownership, PATH/which/env, why `./` is needed, and hidden files.

---

## 1. File types (`file_types/`)

Practice **ls -l** and **symbolic links**: regular files (`-`), directories (`d`), symlinks (`l`), and broken symlinks.

**Layout**: `sample.txt`, `subdir/`, `my_symlink` → sample.txt, `broken_link` → missing target.

**Try these** (from repo root):

```bash
cd module2/examples/file_types
ls -l
ls -l my_symlink
readlink my_symlink
cat my_symlink
readlink broken_link
```

See `file_types/README.md` for creating your own symlinks and interpreting `ls -l`.

---

## 2. Permissions (`permissions/`)

Practice **chmod** and running an **executable script**; optional chmod on a data file.

**Layout**: `hello.sh` (script), `config.txt` (data file).

**Try these**:

```bash
cd module2/examples/permissions
ls -l hello.sh
chmod u+x hello.sh
ls -l hello.sh
./hello.sh
chmod 644 config.txt
ls -l config.txt
```

See `permissions/README.md` for why `./` is needed and chmod quick reference (644, 755, u+x).

---

## 3. Ownership (`ownership/`)

Practice **reading owner and group** in `ls -l` and comparing across directories.

**Layout**: `myfile.txt`, `explain_ls.sh` (runnable helper).

**Try these**:

```bash
cd module2/examples/ownership
ls -l
chmod u+x explain_ls.sh
./explain_ls.sh
ls -l ~
ls -l module2/examples/permissions
```

See `ownership/README.md` for column-by-column interpretation of `ls -l`.

---

## 4. Environment (`environment/`)

Practice **PATH**, **which**, and **env** with a runnable script and a command cheat sheet.

**Layout**: `inspect_env.sh` (run after chmod u+x), `commands_to_try.txt` (copy-paste list).

**Try these**:

```bash
cd module2/examples/environment
chmod u+x inspect_env.sh
./inspect_env.sh
echo $PATH
which bash
which git
env | head -10
```

See `environment/README.md` and `commands_to_try.txt` for one-shot/export variables and toolchain context.

---

## 5. PATH and scripts (`path_and_script/`)

See **why you must use ./script.sh** to run a script in the current directory.

**Layout**: `local_cmd.sh` (already executable).

**Try these**:

```bash
cd module2/examples/path_and_script
./local_cmd.sh
local_cmd.sh
echo $PATH
```

The second command typically fails with "command not found" because the current directory is not in PATH. See `path_and_script/README.md` for the full explanation.

---

## 6. Hidden files / dotfiles (`dotfiles/`)

Practice **ls -a** and recognizing **dotfiles** and **dot-directories**.

**Layout**: `visible.txt`, `.hidden_file`, `.sample_rc`, `.gitignore`, `.hidden_dir/`.

**Try these**:

```bash
cd module2/examples/dotfiles
ls
ls -a
ls -la
cat .hidden_file
cat .sample_rc
ls -a ~ | head -15
```

See `dotfiles/README.md` for common dotfiles (`.git/`, `.bashrc`, `.gitignore`, etc.).
