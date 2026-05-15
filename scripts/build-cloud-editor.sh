#!/usr/bin/env sh
set -eu

COMFY_WEB="${1:-../runebender-comfy/web}"

if [ ! -d "$COMFY_WEB" ]; then
  printf 'Missing Runebender Comfy web directory: %s\n' "$COMFY_WEB" >&2
  exit 1
fi

if [ ! -d "$COMFY_WEB/node_modules" ]; then
  printf 'Missing node_modules in %s. Run pnpm install there first.\n' "$COMFY_WEB" >&2
  exit 1
fi

VITE_RUNEBENDER_LOAD_TEST_FONT=1 pnpm --dir "$COMFY_WEB" exec vite build --config ../../runebender-dot-org/scripts/vite.comfy-standalone.config.mjs
