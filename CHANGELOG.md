# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.2.0] - 2026-08-25

### Added
- Standard production static pages: custom styled 404 error page (`404.html`) and legal/privacy policy page (`legal.html`).
- Complete SEO & Social metadata: Open Graph, Twitter Cards, canonical link, and vector favicon (`favicon.svg`).
- Search engine discoverability: `robots.txt` and `sitemap.xml` configured for `https://boblebol.github.io/git-poule/`.
- Mobile UX enhancements: sticky quick action bar on smartphone screens.
- Unified portfolio cross-footer connecting Alexandre Enouf's identity, Lab, Blog, and social links.

### Changed
- Refactored landing page styles to prevent Cumulative Layout Shift (CLS) on mascot image.
- Updated automated site test suite (`test/site-test.sh`) to assert all release criteria.

## [0.1.0] - 2026-07-03

### Added
- Add `git picore` wrapper for `git cherry-pick` with avian sound and mascot feedback.
- Package bundled audio files (`coq.wav`, `poule.wav`) with `install.sh`.
- Responsive GitHub Pages landing page and test suite.

