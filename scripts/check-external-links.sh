#!/usr/bin/env sh
set -eu

urls="
https://astro.build/
https://github.com/eliheuer/runebender-comfy
https://github.com/eliheuer/runebender-core
https://github.com/fontgarden/runebender
https://github.com/fontgarden/runebender.git
https://github.com/fontgarden/runebender/issues
https://github.com/fontgarden/runebender/pulls
https://github.com/linebender/runebender
https://runebender.app/
https://rust-lang.org/
https://xi.zulipchat.com/#narrow/channel/197075-runebender
"

for url in $urls; do
  code="$(curl -L -s -o /dev/null -w '%{http_code}' "$url")"
  case "$code" in
    2*|3*)
      printf 'OK   %s %s\n' "$code" "$url"
      ;;
    *)
      printf 'FAIL %s %s\n' "$code" "$url" >&2
      exit 1
      ;;
  esac
done
