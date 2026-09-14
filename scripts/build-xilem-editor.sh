#!/usr/bin/env sh
# Publish only the runtime output from an explicitly selected app checkout.
set -eu
app_checkout=${1:?Usage: scripts/build-xilem-editor.sh /path/to/runebender-xilem}
app_checkout=$(cd "$app_checkout" && pwd)
site_root=$(CDPATH= cd -- "$(dirname "$0")/.." && pwd)
"$app_checkout/web/build.sh"
python3 - "$app_checkout" "$site_root" <<'PYTHON'
import hashlib, json, pathlib, shutil, subprocess, sys
app, site = map(pathlib.Path, sys.argv[1:])
if subprocess.check_output(['git', 'diff', 'HEAD', '--', 'src', 'web', 'Cargo.toml', 'Cargo.lock'], cwd=app):
    raise SystemExit('Commit application source before publishing its browser artifact')
dest = site / 'public/app'
dest.mkdir(parents=True, exist_ok=True)
for name in ('index.html', 'app.js'):
    shutil.copy2(app / 'web' / name, dest / name)
for name in ('pkg', 'licenses'):
    shutil.copytree(app / 'web' / name, dest / name, dirs_exist_ok=True)
info = {
    'repository': 'https://github.com/eliheuer/runebender-xilem',
    'commit': subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=app, text=True).strip(),
    'wasm_sha256': hashlib.sha256((dest / 'pkg/runebender_browser_bg.wasm').read_bytes()).hexdigest(),
}
(dest / 'build-info.json').write_text(json.dumps(info, indent=2) + '\n')
PYTHON
