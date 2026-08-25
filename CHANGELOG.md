# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- Google Analytics GA4 with build-time secret injection (`GA_MEASUREMENT_ID`) in Cookieless / RGPD compliant mode.
- Universal custom event tracking (`window.trackEvent`) on CTAs, install commands, sound demos, and outbound links.
- CI & Quality Gates workflow (`.github/workflows/ci.yml`) running test suites on push and PR.
- Automated Mobile & Desktop Lighthouse CI audits with strict budgets (>=90/95) and automated rich PR summaries.
- Standard Open Source governance (`CONTRIBUTING.md`, `CODE_OF_CONDUCT.md`, PR & Issue templates).
- Unified Alexandre Enouf cross-portfolio footer.
- SEO & Social metadata (Open Graph, Twitter Card, `robots.txt`, `sitemap.xml`).
- Visual architecture diagram and badges in `README.md`.

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
