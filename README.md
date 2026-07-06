# git-poule

`git poule`, c'est `git pull` avec un retour sonore et aviaire.
`git picore`, c'est `git cherry-pick` avec la même cérémonie.

Chaque commande lance le vrai Git, transmet tes arguments, conserve le code de sortie, puis ajoute la cérémonie nationale:

- `git poule` OK: son `coq.wav` + poulet content;
- `git poule` KO: son `poule.wav` + poulet KO;
- `git picore` OK: son `coq.wav` + poulet content;
- `git picore` KO: son `poule.wav` + poulet KO;
- si les WAV ne peuvent pas être joués: fallback `say "cot cot cot"`, puis cloche terminal.

```sh
git poule --rebase
git picore abc123
```

## Installation

```sh
./install.sh
```

L'installateur copie:

- `git-poule` et `git-picore` dans `/usr/local/bin` si possible, sinon `$HOME/.local/bin`;
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
git picore abc123
git picore --continue
git picore --abort
```

Git découvre les commandes nommées `git-*` dans le `PATH`: les exécutables `git-poule` et `git-picore` deviennent donc disponibles via `git poule` et `git picore`.

## Mode KO

Quand `git pull` échoue, `git-poule` garde le même code de sortie et affiche:

```text
     pull rate
        __
      <(x )___
       ( ._> /
        `---'  KO
```

Quand `git cherry-pick` échoue, `git-picore` garde aussi le même code de sortie et affiche:

```text
     picorage rate
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
rm "$HOME/.local/bin/git-picore"
```

Si tu as installé ailleurs, supprime `git-poule`, `git-picore` et les sons du dossier `share/git-poule` correspondant.
