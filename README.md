# git-poule 🐔

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![CI](https://github.com/Boblebol/git-poule/actions/workflows/ci.yml/badge.svg)](https://github.com/Boblebol/git-poule/actions/workflows/ci.yml)
[![GitHub Pages](https://github.com/Boblebol/git-poule/actions/workflows/pages.yml/badge.svg)](https://github.com/Boblebol/git-poule/actions/workflows/pages.yml)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)

> **Unicorn? Non. Poule.**
> Le wrapper Git national qui chante quand tout va bien et qui glousse quand Git dit non.

`git poule`, c'est `git pull` avec un retour sonore et aviaire.  
`git picore`, c'est `git cherry-pick` avec la même cérémonie.

---

## 🏗️ Architecture & Fonctionnement

```mermaid
graph TD
    A[Commande: git poule / git picore] --> B[Exécution du vrai binaire git avec tous les arguments]
    B --> C{Statut de sortie (exit code)}
    C -->|Succès: 0| D[🔊 Joue coq.wav / cot cot]
    D --> E[Affiche l'art ASCII de la poule en forme]
    C -->|Échec: != 0| F[🔊 Joue poule.wav / poule KO]
    F --> G[Affiche l'art ASCII de la poule KO]
    E --> H[Rend le code de sortie exact à votre terminal]
    G --> H
```

Chaque commande lance le vrai Git, transmet tes arguments, conserve le code de sortie, puis ajoute la cérémonie nationale :
- `git poule` OK : son `coq.wav` + poulet content ;
- `git poule` KO : son `poule.wav` + poulet KO ;
- `git picore` OK : son `coq.wav` + poulet content ;
- `git picore` KO : son `poule.wav` + poulet KO ;
- Fallback automatique si les WAV ne peuvent pas être joués : `say "cot cot cot"`, puis cloche terminal.

```sh
git poule --rebase
git picore abc123
```

---

## 📦 Installation

```sh
./install.sh
```

L'installateur copie :
- `git-poule` et `git-picore` dans `/usr/local/bin` si possible, sinon `$HOME/.local/bin` ;
- les sons dans un dossier `share/git-poule` associé.

Installation personnalisée :
```sh
INSTALL_DIR="$HOME/.local/bin" ./install.sh
```

Assure-toi que le dossier d'installation est présent dans ton `PATH`.

---

## 🚀 Utilisation

```sh
git poule
git poule --rebase
git poule --ff-only origin main
git picore abc123
git picore --continue
git picore --abort
```

Git découvre automatiquement les commandes nommées `git-*` dans le `PATH` : les exécutables `git-poule` et `git-picore` deviennent ainsi accessibles via `git poule` et `git picore`.

---

## 💀 Mode KO

Quand `git pull` échoue, `git-poule` conserve le même code d'erreur et affiche :

```text
     pull rate
        __
      <(x )___
       ( ._> /
        `---'  KO
```

Quand `git cherry-pick` échoue, `git-picore` conserve également le même code d'erreur :

```text
     picorage rate
        __
      <(x )___
       ( ._> /
        `---'  KO
```

---

## 🧪 Tests

```sh
bash test/git-poule-test.sh && bash test/install-test.sh && bash test/site-test.sh
```

---

## 🌐 GitHub Pages

La landing page est un site statique déployé par GitHub Actions :
- `index.html`
- `styles.css`
- `assets/git-poule-mascot.png`
- `assets/sounds/coq.wav`
- `assets/sounds/poule.wav`

Le workflow `.github/workflows/pages.yml` exécute la suite de validation avant de déployer sur GitHub Pages à chaque commit sur `main`.

---

## 🗑️ Désinstallation

```sh
rm "$HOME/.local/bin/git-poule"
rm "$HOME/.local/bin/git-picore"
```

---

## 🤝 Contribution & Gouvernance

Les contributions sont les bienvenues ! Consultez [CONTRIBUTING.md](CONTRIBUTING.md) et notre [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) pour démarrer.

---

## 📄 Licence

Distribué sous licence MIT. Voir [LICENSE](LICENSE) pour plus d'informations.
