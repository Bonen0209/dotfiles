Bo-Run's Dotfiles
=================

This repository holds the shared parts of Bo-Run's dotfiles and is deployed with
[GNU Stow][]. Each package below is a top-level directory whose contents mirror
`$HOME`:

| Package | Configures |
| --- | --- |
| `git` | Git |
| `nvim` | Neovim |
| `readline` | Readline |
| `tmux` | tmux |
| `vim` | Vim |
| `zsh` | Zsh |

Machine-specific settings live outside this repository. The base configs load
the following local files by name, if they exist:

| Base config | Loads |
| --- | --- |
| `~/.gitconfig` | `~/.gitconfig_local` |
| `~/.tmux.conf` | `~/.tmux_local.conf` |
| `~/.zshrc` | `~/.zshrc_local_before`, `~/.zshrc_local_after` |

[GNU Stow]: https://www.gnu.org/software/stow/

Prerequisites
-------------

  * GNU Stow
  * git, curl and unzip
  * zsh and tmux
  * Vim 8.0 or later
  * Neovim 0.12 or later
  * tree-sitter CLI 0.26.1 or later
  * A C compiler and make
  * ripgrep and fd
  * Python 3.10 or later with venv
  * Node.js 22.13 or later with npm

### macOS

Install [Homebrew][], which also installs the Xcode Command Line Tools if they
are missing. Then install the packages and link Homebrew's zimfw into `~/.zim`:

```sh
brew install fd neovim node python ripgrep stow tmux tree-sitter-cli zimfw
mkdir -p ~/.zim
ln -sf "$(brew --prefix zimfw)/share/zimfw.zsh" ~/.zim/zimfw.zsh
```

### Ubuntu

Install curl and add the [NodeSource][] repository, whose `nodejs` includes
npm. Then install the packages, link fd's `fdfind` command as `fd` and run the
Zim Framework installer, which also makes zsh your login shell:

```sh
sudo apt update
sudo apt install curl
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt install build-essential fd-find git nodejs python3-venv ripgrep stow tmux unzip vim zsh
sudo ln -sf "$(command -v fdfind)" /usr/local/bin/fd
curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
```

The Zim Framework installer writes its own `~/.zshrc` and moves any existing one
to `~/.zshrc.pre-zim`. Remove `~/.zshrc` before linking `zsh`, since Stow does
not replace existing files.

Ubuntu's Neovim package is older than 0.12 and there is no tree-sitter CLI
package, so install [Neovim][nvim-release] from its release tarball. Then
install Rust with [rustup][] and the [tree-sitter CLI][tree-sitter-cli] with
Cargo.

[Homebrew]: https://brew.sh/
[NodeSource]: https://github.com/nodesource/distributions
[nvim-release]: https://github.com/neovim/neovim/releases/latest
[rustup]: https://rustup.rs/
[tree-sitter-cli]: https://github.com/tree-sitter/tree-sitter/blob/master/crates/cli/README.md

Installation
------------

You need an SSH key with access to GitHub. Clone this repository to any `<path>`
and link each `<package>` you want into `$HOME`:

```sh
git clone git@github.com:Bonen0209/dotfiles.git <path>
cd <path>
stow --no-folding -v -t ~ <package>
```

Always pass `-t ~`, because Stow's default target is the repository's parent
directory, which is `$HOME` only if you cloned it directly into `$HOME`.
Also pass `--no-folding`, because Stow otherwise links whole directories, and
files that programs create in them end up in this repository.

Before starting a new shell, make sure the local files listed above are in
place, so they are loaded on first start.

Then start each program to install its plugins:

  * Start a new `zsh`. It installs the modules listed in `~/.zimrc`.
  * Start `vim`. It installs vim-plug and then waits at a "Press ENTER" prompt.
    Press Enter to install its plugins.
  * Start `nvim`. It installs vim-plug, but it shows errors and installs no
    plugins. Quit, start `nvim` again and run `:PlugInstall` to install its
    plugins. After the next restart, it installs its language servers and
    tree-sitter parsers in the background.
  * Start `tmux`. It installs tpm but none of the other plugins, so press
    `prefix + I` to install them.

To unlink a package, run the link command with `-D`:

```sh
stow --no-folding -v -D -t ~ <package>
```

Stow only links and unlinks the files that are in the package when it runs.
After pulling a change that adds a file, run the link command again. Before
pulling a change that deletes or renames a file, unlink its package first;
otherwise the old link is left dangling in `$HOME`.

License
-------

This software is hereby released into the public domain. That means you can do
whatever you want with it without restriction. See `LICENSE.md` for details.
