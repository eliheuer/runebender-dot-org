#!/usr/bin/env sh
set -eu

BASE_URL="${1:-https://runebender.org}"

paths="
/
/docs/index.html
/docs/project-map.html
/docs/current-facts.html
/cloud/index.html
/cloud/editor/index.html
/llms.txt
/llms-full.txt
/robots.txt
/sitemap-index.xml
/assets/favicon.svg
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
