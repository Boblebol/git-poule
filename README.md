# git-poule

`git poule` is `git pull` with poultry-grade feedback.

It runs the real `git pull`, forwards your arguments, keeps Git's exit code, and adds just enough barnyard ceremony to make dependency updates feel less corporate.

```sh
git poule --rebase
```

On success: chicken sound plus happy chicken.

On failure: no sound, same non-zero exit code, KO chicken.

```text
     pull rate
        __
      <(x )___
       ( ._> /
        `---'  KO
```

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

## Test

```sh
bash test/git-poule-test.sh && bash test/install-test.sh && bash test/site-test.sh
```

## GitHub Pages

The landing page is a no-build static site:

- `index.html`
- `styles.css`
- `assets/git-poule-mascot.png`

Serve it directly from the repository root with GitHub Pages.

## Uninstall

Remove the installed executable:

```sh
rm "$HOME/.local/bin/git-poule"
```

If you installed to another directory, remove `git-poule` from that directory instead.
