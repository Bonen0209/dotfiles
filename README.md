Bo-Run's Dotfiles
=================

This is a template repository for bootstrapping your dotfiles with [Dotbot][dotbot].

Inspiration
-----------

If you're looking for inspiration for how to structure your dotfiles or what
kinds of things you can include, you could take a look at some repos using
Dotbot.

* [anishathalye's dotfiles][anishathalye_dotfiles]
* [csivanich's dotfiles][csivanich_dotfiles]
* [m45t3r's dotfiles][m45t3r_dotfiles]
* [alexwh's dotfiles][alexwh_dotfiles]
* [azd325's dotfiles][azd325_dotfiles]
* [bluekeys' dotfiles][bluekeys_dotfiles]
* [wazery's dotfiles][wazery_dotfiles]
* [thirtythreeforty's dotfiles][thirtythreeforty_dotfiles]

And there are about [700 more here][dotbot-users].

If you're using Dotbot and you'd like to include a link to your dotfiles here
as an inspiration to others, please submit a pull request.

Zim Installation
----------------
Installing Zim is easy:

  * With curl:

          curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
  
  * With wget:

          wget -nv -O - https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh

Pyenv Installation
------------------
### Basic GitHub Checkout

This will get you going with the latest version of pyenv and make it
easy to fork and contribute any changes back upstream.

1. **Check out pyenv where you want it installed.**
   A good place to choose is `$HOME/.pyenv` (but you can install it somewhere else).

        $ git clone https://github.com/pyenv/pyenv.git ~/.pyenv


2. **Define environment variable `PYENV_ROOT`** to point to the path where
   pyenv repo is cloned and add `$PYENV_ROOT/bin` to your `$PATH` for access
   to the `pyenv` command-line utility.

    ```sh
    $ echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
    $ echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
    ```
    - **Zsh note**: Modify your `~/.zshrc` file instead of `~/.bash_profile`.
    - **Ubuntu and Fedora note**: Modify your `~/.bashrc` file instead of `~/.bash_profile`.
    - **Proxy note**: If you use a proxy, export `http_proxy` and `HTTPS_PROXY` too.

3. **Add `pyenv init` to your shell** to enable shims and autocompletion.
   Please make sure `eval "$(pyenv init -)"` is placed toward the end of the shell
   configuration file since it manipulates `PATH` during the initialization.
    ```sh
    $ echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bash_profile
    ```
    - **Zsh note**: Modify your `~/.zshrc` file instead of `~/.bash_profile`.
    - **fish note**: Use `pyenv init - | source` instead of `eval (pyenv init -)`.
    - **Ubuntu and Fedora note**: Modify your `~/.bashrc` file instead of `~/.bash_profile`.

    **General warning**: There are some systems where the `BASH_ENV` variable is configured
    to point to `.bashrc`. On such systems you should almost certainly put the above mentioned line
    `eval "$(pyenv init -)"` into `.bash_profile`, and **not** into `.bashrc`. Otherwise you
    may observe strange behaviour, such as `pyenv` getting into an infinite loop.
    See [#264](https://github.com/pyenv/pyenv/issues/264) for details.

4. **Restart your shell so the path changes take effect.**
   You can now begin using pyenv.
    ```sh
    $ exec "$SHELL"
    ```

5. **Install Python build dependencies** before attempting to install a new Python version.  The
   [pyenv wiki](https://github.com/pyenv/pyenv/wiki) provides suggested installation packages
   and commands for various operating systems.

6. **Install Python versions into `$(pyenv root)/versions`.**
   For example, to download and install Python 2.7.8, run:
    ```sh
    $ pyenv install 2.7.8
    ```
   **NOTE:** If you need to pass configure option to build, please use
   ```CONFIGURE_OPTS``` environment variable.

   **NOTE:** If you want to use proxy to download, please use `http_proxy` and `https_proxy`
   environment variable.

   **NOTE:** If you are having trouble installing a python version,
   please visit the wiki page about
   [Common Build Problems](https://github.com/pyenv/pyenv/wiki/Common-build-problems)


#### Upgrading

If you've installed pyenv using the instructions above, you can
upgrade your installation at any time using git.

To upgrade to the latest development version of pyenv, use `git pull`:

```sh
$ cd $(pyenv root)
$ git pull
```

To upgrade to a specific release of pyenv, check out the corresponding tag:

```sh
$ cd $(pyenv root)
$ git fetch
$ git tag
v0.1.0
$ git checkout v0.1.0
```

### Uninstalling pyenv

The simplicity of pyenv makes it easy to temporarily disable it, or
uninstall from the system.

1. To **disable** pyenv managing your Python versions, simply remove the
  `pyenv init` line from your shell startup configuration. This will
  remove pyenv shims directory from PATH, and future invocations like
  `python` will execute the system Python version, as before pyenv.

  `pyenv` will still be accessible on the command line, but your Python
  apps won't be affected by version switching.

2. To completely **uninstall** pyenv, perform step (1) and then remove
   its root directory. This will **delete all Python versions** that were
   installed under `` $(pyenv root)/versions/ `` directory:
    ```sh
    rm -rf $(pyenv root)
    ```
   If you've installed pyenv using a package manager, as a final step
   perform the pyenv package removal. For instance, for Homebrew:

        brew uninstall pyenv

Pyenv Virtualenv Installation
-----------------------------
## Installation

### Installing as a pyenv plugin

This will install the latest development version of pyenv-virtualenv into
the `$(pyenv root)/plugins/pyenv-virtualenv` directory.

**Important note:**  If you installed pyenv into a non-standard directory, make
sure that you clone this repo into the 'plugins' directory of wherever you
installed into.

From inside that directory you can:
 - Check out a specific release tag.
 - Get the latest development release by running `git pull` to download the
   latest changes.

1. **Check out pyenv-virtualenv into plugin directory**

    ```sh
    $ git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
    ```

2. (OPTIONAL) **Add `pyenv virtualenv-init` to your shell** to enable auto-activation of virtualenvs. This is entirely optional but pretty useful. See "Activate virtualenv" below.

    ```sh
    $ echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bash_profile
    ```

    **Fish shell note**:  Add this to your `~/.config/fish/config.fish`

    ```sh
    status --is-interactive; and pyenv init - | source
    status --is-interactive; and pyenv virtualenv-init - | source
    ```

    **Zsh note**: Modify your `~/.zshenv` file instead of `~/.bash_profile`.
    
    **Pyenv note**: You may also need to add `eval "$(pyenv init -)"` to your profile if you haven't done so already.

3. **Restart your shell to enable pyenv-virtualenv**

    ```sh
    $ exec "$SHELL"
    ```

License
-------

This software is hereby released into the public domain. That means you can do
whatever you want with it without restriction. See `LICENSE.md` for details.

That being said, I would appreciate it if you could maintain a link back to
Dotbot (or this repository) to help other people discover Dotbot.

[dotbot]: https://github.com/anishathalye/dotbot
[fork]: https://github.com/anishathalye/dotfiles_template/fork
[template]: https://github.com/anishathalye/dotfiles_template/generate
[anishathalye_dotfiles]: https://github.com/anishathalye/dotfiles
[csivanich_dotfiles]: https://github.com/csivanich/dotfiles
[m45t3r_dotfiles]: https://github.com/m45t3r/dotfiles
[alexwh_dotfiles]: https://github.com/alexwh/dotfiles
[azd325_dotfiles]: https://github.com/Azd325/dotfiles
[bluekeys_dotfiles]: https://github.com/bluekeys/.dotfiles
[wazery_dotfiles]: https://github.com/wazery/dotfiles
[thirtythreeforty_dotfiles]: https://github.com/thirtythreeforty/dotfiles
[dotbot-users]: https://github.com/anishathalye/dotbot/wiki/Users
