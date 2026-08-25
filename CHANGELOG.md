# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.2.0] - 2026-08-25

### Added
- **Production Web Release & Ship Checklist** :
  - Pages statiques et légales standardisées : `404.html` custom avec retour d'erreur stylisé et `legal.html` (mentions légales & politique de confidentialité conforme RGPD / CNIL).
  - SEO & Social Graph complets : balises Open Graph, Twitter Cards, canonical link `https://boblebol.github.io/git-poule/`, et favicon vectoriel `favicon.svg`.
  - Indexation moteurs de recherche : `robots.txt` et `sitemap.xml` configurés.
  - Mobile UX : barre d'action CTA sticky mobile avec `backdrop-blur`.
  - Footer unifié Alexandre Enouf connecté à l'écosystème portfolio (Lab, Blog, GitHub, LinkedIn).
- **Google Analytics GA4** : intégration sécurisée via secret GitHub (`GA_MEASUREMENT_ID`) injecté au build en mode Cookieless.
- **Universal Custom Event Tracking** : dispatch d'événements (`window.trackEvent`) pour les interactions clés.
- **CI & Quality Gates** : pipeline GitHub Actions (`.github/workflows/ci.yml`) exécutant l'ensemble de la suite de tests.
- **Lighthouse CI** : audits de performance et qualité automatisés Mobile & Desktop avec budgets stricts (>=90/95).
- **Gouvernance Open-Source** : ajout de `CONTRIBUTING.md`, `CODE_OF_CONDUCT.md`, templates d'Issues et de PR.

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
