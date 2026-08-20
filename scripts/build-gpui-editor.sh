#!/usr/bin/env sh
# Build the experimental GPUI editor (runebender-gpui) as wasm and
# refresh public/gpui/ with the output, served live at
# https://runebender.org/gpui/.
#
# Unlike the cloud editor, this needs the Rust wasm toolchain: the
# pinned nightly plus build-std (see runebender-gpui's README). GitHub
# Pages cannot send the COOP/COEP headers the build's SharedArrayBuffer
# needs, so coi-serviceworker (MIT, vendored by this script) installs a
# service worker that adds them client-side; the first visit reloads
# once.
#
# Usage:
#   sh scripts/build-gpui-editor.sh                 # sibling ../runebender-gpui
#   sh scripts/build-gpui-editor.sh /path/to/runebender-gpui
set -eu

SITE_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
GPUI="${1:-$SITE_ROOT/../runebender-gpui}"
DEST="$SITE_ROOT/public/gpui"

if [ ! -f "$GPUI/Trunk.toml" ]; then
  printf 'Missing runebender-gpui checkout at %s\n' "$GPUI" >&2
  exit 1
fi

(cd "$GPUI" && RUSTUP_TOOLCHAIN=nightly-2026-08-01 \
  CARGO_UNSTABLE_BUILD_STD=std,panic_abort \
  trunk build --release --public-url /gpui/)

rm -rf "$DEST"
mkdir -p "$DEST"
cp -R "$GPUI/dist/." "$DEST/"

# Vendor the cross-origin-isolation shim and load it first.
curl -sL https://raw.githubusercontent.com/gzuidhof/coi-serviceworker/master/coi-serviceworker.min.js \
  -o "$DEST/coi-serviceworker.min.js"
perl -0pi -e 's{<head>}{<head><script src="/gpui/coi-serviceworker.min.js"></script>}' "$DEST/index.html"

printf 'Built %s\n' "$DEST"
