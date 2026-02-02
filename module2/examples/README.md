# Module 2 Examples

Hands-on examples for **Filesystem, Permissions & Environment**: file types, permissions, PATH/which/env, and hidden files.

---

## 1. File types (`file_types/`)

Practice **ls -l** and **symbolic links**: regular files (`-`), directories (`d`), symlinks (`l`).

**Try these** (from repo root):

```bash
cd module2/examples/file_types
ls -l
ls -l my_symlink
readlink my_symlink
cat my_symlink
```

Optional: create a symlink with `ln -s sample.txt my_copy_link`, then `rm my_copy_link`. See `file_types/README.md` for details.

---

## 2. Permissions (`permissions/`)

Practice **chmod** and running an **executable script**.

**Try these**:

```bash
cd module2/examples/permissions
ls -l hello.sh
chmod u+x hello.sh
ls -l hello.sh
./hello.sh
```

See `permissions/README.md` for why `./` is needed and what not to do with chmod.

---

## 3. Environment (`environment/`)

Practice **PATH**, **which**, and **env**.

**Try these**:

```bash
echo $HOME
echo $PATH
which bash
which git
which python
env | head -15
```

See `environment/README.md` for one-shot and exported variables and toolchain context.

---

## 4. Hidden files / dotfiles (`dotfiles/`)

Practice **ls -a** and recognizing **dotfiles** and **dot-directories**.

**Try these**:

```bash
cd module2/examples/dotfiles
ls
ls -a
ls -la
cat .hidden_file
ls -a ~
```

See `dotfiles/README.md` for common dotfiles (`.git/`, `.bashrc`, `.gitignore`, etc.).
