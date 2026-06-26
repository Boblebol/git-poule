# git-poule

`git poule`, c'est `git pull` avec un retour sonore et aviaire.

Il lance le vrai `git pull`, transmet tes arguments, conserve le code de sortie de Git, puis ajoute la cérémonie nationale:

- pull OK: son `coq.wav` + poulet content;
- pull KO: son `poule.wav` + poulet KO;
- si les WAV ne peuvent pas être joués: fallback `say "cot cot cot"`, puis cloche terminal.

```sh
git poule --rebase
```

## Installation

```sh
./install.sh
```

L'installateur copie:

- `git-poule` dans `/usr/local/bin` si possible, sinon `$HOME/.local/bin`;
- les sons dans un dossier `share/git-poule` associé.

Installation explicite:

```sh
INSTALL_DIR="$HOME/.local/bin" ./install.sh
```

Assure-toi que le dossier d'installation est dans ton `PATH`.

## Utilisation

```sh
git poule
git poule --rebase
git poule --ff-only origin main
```

Git découvre les commandes nommées `git-*` dans le `PATH`: un exécutable `git-poule` devient donc disponible via `git poule`.

## Mode KO

Quand `git pull` échoue, `git-poule` garde le même code de sortie et affiche:

```text
     pull rate
        __
      <(x )___
       ( ._> /
        `---'  KO
```

## Tests

```sh
bash test/git-poule-test.sh && bash test/install-test.sh && bash test/site-test.sh
```

## GitHub Pages

La landing page est un site statique déployé par GitHub Actions:

- `index.html`
- `styles.css`
- `assets/git-poule-mascot.png`
- `assets/sounds/coq.wav`
- `assets/sounds/poule.wav`

Dans les réglages du dépôt GitHub, configure Pages avec:

- Source: `GitHub Actions`

Le workflow `.github/workflows/pages.yml` lance `bash test/site-test.sh`, prépare GitHub Pages, puis publie la racine du dépôt à chaque push sur `main`.

## Désinstallation

Supprime l'exécutable installé:

```sh
rm "$HOME/.local/bin/git-poule"
```

Si tu as installé ailleurs, supprime `git-poule` de ce dossier et les sons du dossier `share/git-poule` correspondant.
