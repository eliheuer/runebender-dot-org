#!/usr/bin/env sh
set -eu

BASE_URL="${1:-http://127.0.0.1:5173}"

paths="
/
/docs/index.html
/docs/current-facts.html
/docs/alpha-limits.html
/docs/capabilities.html
/docs/glossary.html
/docs/workflows.html
/docs/tutorials.html
/docs/how-tos.html
/docs/examples.html
/docs/troubleshooting.html
/docs/support.html
/docs/source-map.html
/docs/install.html
/docs/manual.html
/docs/tracing.html
/docs/format.html
/docs/reference.html
/docs/development.html
/llms.txt
/llms-full.txt
/robots.txt
/sitemap.xml
/assets/favicon.svg
/assets/og-image.svg
/assets/runebender-xilem-screenshot.png
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
