# dotfiles

Hi, I'm Matthew.  Welcome to my dotfiles.

My personal shell, Git, and tool configuration managed with [GNU Stow](https://www.gnu.org/software/stow/). Each top-level directory is a **stow package**: its contents are symlinked into your home directory (or another target) so this repo stays the single source of truth.

## What is Stow?

Stow installs a package by creating symlinks from a **target** tree (usually `$HOME`) into files under this repository. Conflicts are reported instead of overwritten; options like `--adopt` and `--restow` help when you already have local dotfiles.

### Documentation and source

| Resource | URL |
| ---------- | ----- |
| Manual (full reference) | [GNU Stow manual](https://www.gnu.org/software/stow/manual/stow.html) |
| Project overview | [GNU Stow](https://www.gnu.org/software/stow/) |
| Official Git repository | [Savannah: `stow.git`](https://git.savannah.gnu.org/cgit/stow.git/) |
| Maintainer mirror (GitHub) | [aspiers/stow](https://github.com/aspiers/stow) |

## Install Stow

- **macOS (Homebrew):** `brew install stow`
- **Debian / Ubuntu:** `sudo apt install stow`
- **Fedora:** `sudo dnf install stow`

Other systems: see the [manual — Obtaining GNU Stow](https://www.gnu.org/software/stow/manual/stow.html#Obtaining-GNU-Stow).

## Use this repository

Clone wherever you like (example: `~/github/matthewadowns/dotfiles`), then run `stow` from the **repository root** so it can see the package directories.

### First-time install (typical)

Symlink chosen packages into your home directory:

```bash
cd /path/to/dotfiles
stow -t "$HOME" zshrc git profile claude
```

- **`-t "$HOME"`** — install into your home directory (default target layout matches the package names: `zshrc/` supplies `~/.zshrc`, etc.).

Pick only the packages you want; omit any you do not use.

### If you already have conflicting dotfiles

Stow will refuse to link over existing **regular files**. Either move them aside or let Stow move them into the package and replace them with symlinks:

```bash
stow -t "$HOME" --adopt zshrc git profile
```

Read the manual section on [`--adopt`](https://www.gnu.org/software/stow/manual/stow.html#Invoking-Stow) before using it; it rewrites the tree under the repository.

### Update after editing the repo

**Restow** (delete stow-created links for those packages, then link again):

```bash
cd /path/to/dotfiles
stow -t "$HOME" -R zshrc git profile claude
```

Combine with `--adopt` if you need it for a given machine.

### Remove a package from your home directory

**Unstow** (remove symlinks for that package only):

```bash
stow -t "$HOME" -D claude
```

This does not delete the files in this repository.

### Repository settings

This repo includes a [`.stowrc`](.stowrc) in the root (for example `--ignore=.DS_Store`). Stow reads `.stowrc` from the current directory when you run it from here.

## Packages (layout)

| Package | Role |
| --------- | ------ |
| `zshrc` | Zsh config (e.g. `~/.zshrc`, `~/.zprofile`) |
| `git` | Git user config (e.g. `~/.gitconfig`, `~/.gitignore`) |
| `profile` | Shell login profile (e.g. `~/.profile`) |
| `claude` | [Claude Code](https://claude.ai/code): `setting.json`, `hooks/`, `commands/` |
| `anaconda`, `npm`, `nvm` | Placeholders / optional; stow only if you add files there |

Stow mirrors each package’s directory tree under `-t` (usually `$HOME`). If you want Claude files under `~/.claude/` instead of loose names under `$HOME`, nest them inside a `.claude/` directory within the `claude` package.

Adjust the package list in the commands above to match what you actually use.
