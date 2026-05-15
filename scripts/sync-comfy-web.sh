#!/usr/bin/env sh
set -eu

SRC="${1:-../runebender-comfy/web}"
DEST="${2:-cloud/runebender-comfy-web}"

if [ ! -d "$SRC" ]; then
  printf 'Missing source web directory: %s\n' "$SRC" >&2
  exit 1
fi

rm -rf "$DEST"
mkdir -p "$DEST"

for item in README.md package.json pnpm-lock.yaml pnpm-workspace.yaml vite.config.ts index.html .npmrc; do
  if [ -e "$SRC/$item" ]; then
    cp "$SRC/$item" "$DEST/$item"
  fi
done

for dir in src wasm dist assets public; do
  if [ -d "$SRC/$dir" ]; then
    cp -R "$SRC/$dir" "$DEST/$dir"
  fi
done

printf 'Copied Runebender Comfy web from %s to %s\n' "$SRC" "$DEST"
