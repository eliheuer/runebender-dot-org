# AGENTS.md

Guidance for coding agents working on this repository.

## Project

This repository is the static website and documentation draft for `runebender.org`.

It is not the Runebender application source. The current application source is:

- https://github.com/eliheuer/runebender-xilem

The earlier Druid-based Runebender source is:

- https://github.com/linebender/runebender

## Technical shape

- Static site only: plain HTML, CSS, SVG, text files, and PNG assets.
- No build system.
- No package manager.
- GitHub Pages-ready from the repository root.
- `CNAME` is set to `runebender.org`.

## Documentation stance

Runebender Xilem is alpha software. Keep docs map-level and conservative.

Prefer:

- orientation over exhaustive details,
- current facts over promises,
- source links over copied specifications,
- short command examples,
- explicit alpha-status caveats,
- clear separation between current behavior and future work.

Avoid:

- implying a stable public API,
- duplicating long canonical specs from `runebender-xilem`,
- over-documenting UI behavior that may change,
- marketing language that makes the app sound finished.

## Source of truth

When updating docs, verify durable facts against:

- `/Users/eli/GH/repos/runebender-xilem/README.md`
- `/Users/eli/GH/repos/runebender-xilem/docs/hyperbezier-ufo-extension.md`
- relevant source files in `/Users/eli/GH/repos/runebender-xilem/src/`

If local source is unavailable, use the GitHub repo as the canonical source.

## Agent-readable files

Keep these files updated when documentation structure changes:

- `llms.txt` — short AI-readable map.
- `llms-full.txt` — consolidated Markdown context.
- `sitemap.xml` — public URL map.
- `robots.txt` — sitemap pointer.

## Design constraints

Preserve the current visual direction unless explicitly asked to change it:

- mid-gray backgrounds,
- dark gray text,
- hard borders,
- raw HTML/CSS feel,
- Swiss / brutalist / design-engineering tone,
- dense but legible documentation layout.

Do not add generic SaaS styling, gradients, decorative blobs, or card-heavy marketing sections.
