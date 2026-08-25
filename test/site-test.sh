#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

assert_file() {
  local file="$1"
  if [ ! -f "$repo_root/$file" ]; then
    echo "Expected $file to exist" >&2
    exit 1
  fi
}

assert_contains() {
  local file="$1"
  local text="$2"
  if ! grep -Fq "$text" "$repo_root/$file"; then
    echo "Expected $file to contain: $text" >&2
    exit 1
  fi
}

assert_file "index.html"
assert_file "styles.css"
assert_file "favicon.svg"
assert_file "assets/git-poule-mascot.webp"
assert_file "assets/git-poule-mascot-opt.png"
assert_file "robots.txt"
assert_file "sitemap.xml"
assert_file ".lighthouserc.mobile.json"
assert_file ".lighthouserc.desktop.json"
assert_file "scripts/lighthouse_summary.py"
assert_file "scripts/inject_analytics.py"
assert_file ".github/workflows/pages.yml"
assert_file ".github/workflows/ci.yml"

assert_contains "index.html" "styles.css"
assert_contains "index.html" "favicon.svg"
assert_contains "index.html" "Unicorn? Non. Poule."
assert_contains "index.html" "Le pull qui chante, le cherry-pick qui picore"
assert_contains "index.html" "Installer la bête"
assert_contains "index.html" "Mode KO"
assert_contains "index.html" "git poule"
assert_contains "index.html" "git picore"
assert_contains "index.html" "cherry-pick"
assert_contains "index.html" "KO"
assert_contains "index.html" "Alexandre Enouf"
assert_contains "index.html" "https://alexandre-enouf.fr"
assert_contains "index.html" "assets/git-poule-mascot.webp"
assert_contains "index.html" "og:title"
assert_contains "index.html" "twitter:card"
assert_contains "index.html" "ae-cross-footer"
assert_contains "index.html" "trackEvent"
assert_contains "index.html" "__GA_MEASUREMENT_ID__"
assert_contains ".github/workflows/pages.yml" "Deploy GitHub Pages"
assert_contains ".github/workflows/pages.yml" "Inject Google Analytics GA4 ID"
assert_contains ".github/workflows/pages.yml" "actions/configure-pages@v5"
assert_contains ".github/workflows/pages.yml" "actions/upload-pages-artifact@v3"
assert_contains ".github/workflows/pages.yml" "actions/deploy-pages@v4"
assert_contains ".github/workflows/ci.yml" "Lighthouse CI"

echo "site tests passed"
