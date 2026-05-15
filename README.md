# runebender-dot-org

Local draft website for `runebender.org`.

This is intentionally dependency-free for now: `index.html` and `styles.css` can be opened directly in a browser or published as a static site.

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

## Run locally

Open `index.html` in a browser.

Or serve the folder:

```sh
python3 -m http.server 5173
```

Then visit `http://localhost:5173`.
