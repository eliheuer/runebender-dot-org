#!/usr/bin/env python3
"""Package a browser build from a frozen source tree and its full git revision."""
import hashlib
import json
import pathlib
import re
import shutil
import sys

source, site = map(pathlib.Path, sys.argv[1:3])
commit = sys.argv[3]
if not re.fullmatch(r'[0-9a-f]{40}', commit):
    raise SystemExit('Expected the full source commit SHA')
web = source / 'web'
dest = site / 'public/app'
dest.mkdir(parents=True, exist_ok=True)
wasm = (web / 'pkg/runebender_browser_bg.wasm').read_bytes()
html = (web / 'index.html').read_text()
app = (web / 'app.js').read_text()
bindings = (web / 'pkg/runebender_browser.js').read_text()
release = hashlib.sha256(wasm + html.encode() + app.encode() + bindings.encode()).hexdigest()[:16]
for name in ('pkg', 'licenses'):
    shutil.copytree(web / name, dest / name, dirs_exist_ok=True)
# Version all three requests, so a cached loader cannot load an incompatible WASM ABI.
html = html.replace('./app.js', f'./app.js?v={release}')
app = app.replace('./pkg/runebender_browser.js', f'./pkg/runebender_browser.js?v={release}')
bindings = bindings.replace("'runebender_browser_bg.wasm'", f"'runebender_browser_bg.wasm?v={release}'")
(dest / 'index.html').write_text(html)
(dest / 'app.js').write_text(app)
(dest / 'pkg/runebender_browser.js').write_text(bindings)
(dest / 'build-info.json').write_text(json.dumps({
    'repository': 'https://github.com/eliheuer/runebender-xilem',
    'commit': commit,
    'wasm_sha256': hashlib.sha256(wasm).hexdigest(),
    'release': release,
}, indent=2) + '\n')
print(f'Packaged Runebender {commit[:7]} as {release}')
