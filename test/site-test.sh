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
assert_file "assets/git-poule-mascot.png"

assert_contains "index.html" "styles.css"
assert_contains "index.html" "Unicorn? Non. Poule."
assert_contains "index.html" "Le pull qui finit en cocorico"
assert_contains "index.html" "Installer la bête"
assert_contains "index.html" "Mode KO"
assert_contains "index.html" "git poule"
assert_contains "index.html" "KO"
assert_contains "index.html" "Alexandre Enouf"
assert_contains "index.html" "https://alexandre-enouf.fr"
assert_contains "index.html" "assets/git-poule-mascot.png"

echo "site tests passed"
