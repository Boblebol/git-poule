#!/bin/sh
set -eu

script_dir=$(CDPATH= cd "$(dirname "$0")" && pwd)
source_file="$script_dir/git-poule"
sound_source_dir="$script_dir/assets/sounds"

if [ ! -f "$source_file" ]; then
  echo "Script source git-poule introuvable: $source_file" >&2
  exit 1
fi

if [ ! -f "$sound_source_dir/coq.wav" ] || [ ! -f "$sound_source_dir/poule.wav" ]; then
  echo "Sons git-poule introuvables dans $sound_source_dir" >&2
  exit 1
fi

if [ -n "${INSTALL_DIR:-}" ]; then
  install_dir="$INSTALL_DIR"
elif [ -d /usr/local/bin ] && [ -w /usr/local/bin ]; then
  install_dir="/usr/local/bin"
else
  install_dir="$HOME/.local/bin"
fi

if [ -n "${SHARE_DIR:-}" ]; then
  share_dir="$SHARE_DIR"
else
  install_parent=$(dirname "$install_dir")
  if [ "$(basename "$install_dir")" = "bin" ]; then
    share_dir="$install_parent/share/git-poule"
  else
    share_dir="$install_dir/share/git-poule"
  fi
fi

mkdir -p "$install_dir"
mkdir -p "$share_dir"
install_path="$install_dir/git-poule"

cp "$source_file" "$install_path"
chmod 755 "$install_path"
cp "$sound_source_dir/coq.wav" "$share_dir/coq.wav"
cp "$sound_source_dir/poule.wav" "$share_dir/poule.wav"

case ":$PATH:" in
  *":$install_dir:"*) ;;
  *)
    echo "Warning: $install_dir is not in PATH." >&2
    echo "Ajoute ce dossier a PATH avant de lancer git poule." >&2
    ;;
esac

echo "Installe git-poule dans $install_path"
echo "Installe les sons dans $share_dir"
echo "Lance : git poule"
