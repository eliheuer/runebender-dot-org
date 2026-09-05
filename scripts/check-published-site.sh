#!/usr/bin/env sh
set -eu

BASE_URL="${1:-https://runebender.org}"

paths="
/
/gpui/index.html
/cloud/editor/index.html
/docs
/docs/install.html
/docs/opening.html
/docs/concepts.html
/docs/interface.html
/docs/tools.html
/docs/glyphs.html
/docs/paths.html
/docs/components.html
/docs/masters.html
/docs/spacing.html
/docs/features.html
/docs/color.html
/docs/text.html
/docs/font-info.html
/docs/checking.html
/docs/local-models.html
/docs/agents.html
/docs/mcp.html
/docs/tutorial-first-glyph.html
/docs/workflows.html
/docs/shortcuts.html
/docs/format.html
/docs/exporting.html
/docs/scripting.html
/docs/troubleshooting.html
/docs/development.html
/docs/faq.html
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
