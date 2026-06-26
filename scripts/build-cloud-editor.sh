#!/usr/bin/env sh
# Rebuild the embedded cloud editor from a runebender-web checkout and
# refresh public/cloud/editor/ with the output.
#
# The editor lives at https://github.com/eliheuer/runebender-web — a
# standalone Vite app whose wasm artifacts are committed, so this needs
# pnpm but no Rust toolchain.
#
# Usage:
#   sh scripts/build-cloud-editor.sh                 # sibling ../runebender-web
#   sh scripts/build-cloud-editor.sh /path/to/runebender-web
set -eu

SITE_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
WEB="${1:-$SITE_ROOT/../runebender-web}"
DEST="$SITE_ROOT/public/cloud/editor"

if [ ! -f "$WEB/package.json" ]; then
  printf 'Missing runebender-web checkout at %s\n' "$WEB" >&2
  printf 'Clone it: git clone git@github.com:eliheuer/runebender-web.git\n' >&2
  exit 1
fi

if [ ! -d "$WEB/node_modules" ]; then
  printf 'Missing node_modules in %s. Run pnpm install there first.\n' "$WEB" >&2
  exit 1
fi

# Build into a throwaway dir, not the editor's own dist/. The cloud
# build uses base=/cloud/editor/, so writing it to $WEB/dist would
# leave a sub-path build there and break local dev (run-app.sh serves
# dist/ at the root, where /cloud/editor/ assets 404). vite needs
# --emptyOutDir to write to a dir outside its project root.
TMP_OUT="$(mktemp -d)"
trap 'rm -rf "$TMP_OUT"' EXIT
RUNEBENDER_BASE=/cloud/editor/ pnpm --dir "$WEB" exec vite build \
  --outDir "$TMP_OUT" --emptyOutDir

rm -rf "$DEST"
mkdir -p "$DEST"
cp -R "$TMP_OUT/." "$DEST"

echo "Embedded editor refreshed at public/cloud/editor/"
echo "Review with: git status public/cloud/editor"
