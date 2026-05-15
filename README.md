# runebender-dot-org

Local draft website for `runebender.org`.

This is intentionally dependency-free for now: `index.html`, `docs/*.html`, and `styles.css` can be opened directly in a browser or published as a static site.

## Research direction

The first pass is based on current public sites for major font editor projects:

- Glyphs: product tiers, direct downloads, feature areas, tutorials, handbook, forum, resources.
- RoboFont: documentation-first structure, scripting, tutorials, how-tos, reference, extensions, community.
- FontLab: product catalog, prices, video/product media, detailed feature positioning.
- FontForge: open-source framing, download/docs/development links, community help.
- Fontra: minimal landing page with docs, GitHub, release downloads, and social/community links.
- Runebender Xilem/current site/repo: early-stage Rust font editor, source-first, build locally, screenshots, Zulip for development discussion.

See `research.md` for links and notes.

## Assets

- `assets/runebender-xilem-screenshot.png` is downloaded from the Runebender Xilem GitHub README attachments so the site does not depend on a GitHub user-attachment hotlink.
- `assets/favicon.svg` and `assets/og-image.svg` are simple launch placeholders.

## Site structure

- `index.html` — home page and documentation index.
- `docs/index.html` — documentation map inspired by RoboFont’s topics/tutorials/how-tos/reference split.
- `docs/current-facts.html` — compact source of truth for humans and AI agents.
- `docs/alpha-limits.html` — public alpha caveats and unstable areas.
- `docs/capabilities.html` — alpha capability matrix.
- `docs/glossary.html` — concept reference for font source and editor terms.
- `docs/workflows.html` — task paths through the docs for early users and contributors.
- `docs/tutorials.html` — learning paths for first run, editing, tracing, formats, and development.
- `docs/how-tos.html` — short task recipes for common alpha workflows.
- `docs/examples.html` — included UFO examples and what to inspect in them.
- `docs/troubleshooting.html` — alpha diagnostic checks for setup, files, tracing, and formats.
- `docs/source-map.html` — high-level map of the Runebender Xilem source tree.
- `docs/install.html` — build and first-run notes.
- `docs/manual.html` — early user manual structure.
- `docs/tracing.html` — background image and autotrace workflow.
- `docs/format.html` — UFO and hyperbezier format notes.
- `docs/reference.html` — keyboard shortcut reference.
- `docs/development.html` — contributor and architecture notes.
- `CNAME` — GitHub Pages custom domain placeholder for `runebender.org`.
- `robots.txt` and `sitemap.xml` — basic search-engine metadata.
- `llms.txt` and `llms-full.txt` — AI-readable documentation maps.
- `AGENTS.md` — guidance for coding agents working in this repository.
- `launch-checklist.md` — pre-publication checklist for GitHub Pages, DNS, content, and QA.
- `scripts/check-local-links.sh` — simple local HTTP 200 check for key pages and assets.

## Run locally

Open `index.html` in a browser.

Or serve the folder:

```sh
python3 -m http.server 5173
```

Then visit `http://localhost:5173`.

## Verify local preview

With a local server running:

```sh
scripts/check-local-links.sh http://127.0.0.1:5173
```
