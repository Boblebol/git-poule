#!/bin/sh
set -eu

script_dir=$(CDPATH= cd "$(dirname "$0")" && pwd)
source_file="$script_dir/git-poule"

if [ ! -f "$source_file" ]; then
  echo "git-poule source script not found at $source_file" >&2
  exit 1
fi

if [ -n "${INSTALL_DIR:-}" ]; then
  install_dir="$INSTALL_DIR"
elif [ -d /usr/local/bin ] && [ -w /usr/local/bin ]; then
  install_dir="/usr/local/bin"
else
  install_dir="$HOME/.local/bin"
fi

mkdir -p "$install_dir"
install_path="$install_dir/git-poule"

cp "$source_file" "$install_path"
chmod 755 "$install_path"

case ":$PATH:" in
  *":$install_dir:"*) ;;
  *)
    echo "Warning: $install_dir is not in PATH." >&2
    echo "Add it to PATH before running git poule." >&2
    ;;
esac

echo "Installed git-poule to $install_path"
echo "Run: git poule"
