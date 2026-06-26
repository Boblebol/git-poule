# git-poule

`git poule` is a playful wrapper around `git pull`.

It runs `git pull` with the arguments you pass, then, if the pull succeeds, makes a chicken-like sound and prints a chicken in ASCII art.

## Install

```sh
./install.sh
```

The installer copies `git-poule` into `/usr/local/bin` when writable. Otherwise it uses `$HOME/.local/bin`.

To choose a directory explicitly:

```sh
INSTALL_DIR="$HOME/.local/bin" ./install.sh
```

Make sure the install directory is in your `PATH`.

## Usage

```sh
git poule
git poule --rebase
git poule --ff-only origin main
```

Git discovers commands named `git-*` on `PATH`, so an executable named `git-poule` can be run as `git poule`.

## Uninstall

Remove the installed executable:

```sh
rm "$HOME/.local/bin/git-poule"
```

If you installed to another directory, remove `git-poule` from that directory instead.
