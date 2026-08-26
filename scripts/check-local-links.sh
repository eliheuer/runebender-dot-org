#!/usr/bin/env sh
set -eu

BASE_URL="${1:-http://127.0.0.1:4321}"

paths="
/
/cloud
/cloud/editor/index.html
/gpui/index.html
/docs
/docs/install.html
/docs/first-steps.html
/docs/interface.html
/docs/tools.html
/docs/glyphs.html
/docs/paths.html
/docs/components.html
/docs/masters.html
/docs/text.html
/docs/shortcuts.html
/docs/format.html
/docs/exporting.html
/docs/troubleshooting.html
/docs/development.html
/docs/glossary.html
/llms.txt
/llms-full.txt
/robots.txt
/sitemap-index.xml
/assets/favicon.png
/assets/og-image.svg
"

for path in $paths; do
  url="${BASE_URL}${path}"
  code="$(curl -L -s -o /dev/null -w '%{http_code}' "$url")"
  if [ "$code" != "200" ]; then
    printf 'FAIL %s %s\n' "$code" "$url" >&2
    exit 1
  fi
  printf 'OK   %s %s\n' "$code" "$url"
done
