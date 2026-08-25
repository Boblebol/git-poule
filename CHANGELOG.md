# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.2.0] - 2026-08-25

### Added
- **Google Analytics GA4** : intégration sécurisée via secret GitHub (`GA_MEASUREMENT_ID`) injecté au build en mode Cookieless (respect RGPD/CNIL sans bandeau cookie intrusif).
- **Universal Custom Event Tracking** : dispatch d'événements (`window.trackEvent`) pour les interactions clés (clics CTAs, commande d'installation, démo sonore, liens sortants).
- **CI & Quality Gates** : pipeline GitHub Actions (`.github/workflows/ci.yml`) exécutant l'ensemble de la suite de tests unitaires et d'intégration sur `push` et `pull_request`.
- **Lighthouse CI** : audits de performance et qualité automatisés Mobile & Desktop avec budgets stricts (>=90/95) et publication automatique de rapports Markdown enrichis en commentaire des Pull Requests.
- **Gouvernance Open-Source** : ajout de `CONTRIBUTING.md`, `CODE_OF_CONDUCT.md` (Contributor Covenant v2.1), templates d'Issues (Bug & Feature) et template de Pull Request avec diagrammes Mermaid.
- **Cross-Portfolio Footer** : intégration du footer unifié Alexandre Enouf avec liens écosystème Lab, Blog, LinkedIn et GitHub.
- **Web & SEO Standards** : balises Open Graph (Facebook, LinkedIn), Twitter Cards, canonical link, `robots.txt`, `sitemap.xml`, et attributs de dimensions/priorité (`fetchpriority="high"`) sur la mascotte.

### Fixed
- Découverte et résolution du chemin des fichiers sons WAV lorsque la variable `GIT_POULE_SOUND_DIR` est explicitement définie.

## [1.1.0] - 2026-07-03

### Added
- `git picore`: wrapper aviaire autour de `git cherry-pick`.
- Support d'installation conjointe pour `git-poule` et `git-picore` avec les sons embarqués.
- Tests et documentation de `git picore`.

## [1.0.0] - 2026-06-20

### Added
- Initial release of `git-poule` wrapper around `git pull`.
- Sons WAV `coq.wav` et `poule.wav` avec fallbacks.
- Script d'installation `install.sh`.
- Landing page statique avec GitHub Pages CI.
