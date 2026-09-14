#!/usr/bin/env sh
# Build a committed snapshot so ongoing desktop edits cannot enter the release.
set -eu
app_checkout=${1:?Usage: scripts/build-xilem-editor.sh /path/to/runebender-xilem}
app_checkout=$(cd "$app_checkout" && pwd)
site_root=$(CDPATH= cd -- "$(dirname "$0")/.." && pwd)
source_commit=$(git -C "$app_checkout" rev-parse HEAD)
source_snapshot=$(mktemp -d "${TMPDIR:-/tmp}/runebender-browser-release.XXXXXX")
trap 'rm -rf "$source_snapshot"' EXIT HUP INT TERM
printf 'Building committed Runebender revision %s\n' "$source_commit"
git -C "$app_checkout" archive "$source_commit" | tar -x -C "$source_snapshot"
mkdir -p "$app_checkout/web/target"
ln -s "$app_checkout/web/target" "$source_snapshot/web/target"
"$source_snapshot/web/build.sh"
python3 "$site_root/scripts/package-xilem-editor.py" "$source_snapshot" "$site_root" "$source_commit"
