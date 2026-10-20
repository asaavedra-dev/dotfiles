#!/usr/bin/env bash
set -e
DIR="$(cd "$(dirname "$0")" && pwd)"
BACKUP="$HOME/.config-backup/$(date +%Y%m%d-%H%M%S)"
mkdir -p "$BACKUP"

for item in "$DIR"/.config/*; do
  name="$(basename "$item")"
  if [ -e "$HOME/.config/$name" ]; then
    mv "$HOME/.config/$name" "$BACKUP/"
    echo "Respaldo: $name"
  fi
  cp -r "$item" "$HOME/.config/"
  echo "Instalado: $name"
done

[ -f "$HOME/.bashrc" ] && cp "$HOME/.bashrc" "$BACKUP/"
cp "$DIR/.bashrc" "$HOME/.bashrc"

echo "Listo. Respaldo guardado en $BACKUP"
