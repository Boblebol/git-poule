#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
tmp_dir="$(mktemp -d)"
trap 'rm -rf "$tmp_dir"' EXIT

install_dir="$tmp_dir/bin"

INSTALL_DIR="$install_dir" "$repo_root/install.sh" > "$tmp_dir/stdout" 2> "$tmp_dir/stderr"

if [ ! -x "$install_dir/git-poule" ]; then
  echo "Expected installed git-poule to be executable" >&2
  exit 1
fi

if ! cmp -s "$repo_root/git-poule" "$install_dir/git-poule"; then
  echo "Expected installed git-poule to match source script" >&2
  exit 1
fi

if ! grep -Fq "git poule" "$tmp_dir/stdout"; then
  echo "Expected installer output to mention git poule" >&2
  exit 1
fi

echo "install tests passed"
