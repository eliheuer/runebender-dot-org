# AGENTS.md

Guidance for coding agents working on this repository.

## Project

This repository is the website and documentation source for `runebender.org`.

It is not the main Runebender application source. Current application source lives in the sibling repos:

- https://github.com/eliheuer/runebender-xilem — native Rust/Xilem editor
- https://github.com/eliheuer/runebender-comfy — ComfyUI/Vue/WASM editor and standalone browser build source

The earlier Druid-based Runebender source is:

- https://github.com/linebender/runebender

## Technical shape

- Astro static site, deployed to GitHub Pages via the workflow in `.github/workflows/deploy.yml`.
- Page content lives in `src/content/docs/*.mdx` (collection) and `src/pages/*.astro` (routes).
- Shared layout and chrome live in `src/layouts/` and `src/components/` — there is one header, one footer, one sidebar, and one source of truth for each.
- Global CSS in `src/styles/global.css`. The Swiss/brutalist visual direction is preserved.
- Build output goes to `dist/`. URLs preserve the legacy `.html` suffix via `build.format: "preserve"` so existing external links continue to work.
- `public/` holds raw static files copied verbatim into the build (favicon, og-image, CNAME, `.nojekyll`, robots.txt, llms.txt, llms-full.txt, and the cloud editor build artifact at `public/cloud/editor/`).
- `/cloud/editor/index.html` is a checked-in static artifact built from `../runebender-comfy/web` by `scripts/build-cloud-editor.sh`; Astro should treat it as opaque release output, not source to refactor during website work.

## Local workflow

```sh
pnpm install
pnpm run dev       # http://127.0.0.1:4321
pnpm run build     # outputs dist/
pnpm run preview -- --host 127.0.0.1 --port 4322
```

After building and starting preview, link-check the generated site:

```sh
pnpm run check-links
```

Before a website release that should include the latest browser editor, rebuild the editor artifact first:

```sh
pnpm run build-cloud-editor
```

Keep the website launch on this static artifact path. Editor package extraction or monorepo work belongs after launch, once the website needs real host-specific behavior beyond linking to `/cloud/editor/index.html`.

## Adding or editing a docs page

1. Create or edit `src/content/docs/<slug>.mdx`.
2. Set the frontmatter: `title`, `navLabel`, `eyebrow`, `lede`, `status`, `audience`, `source`, `stability`, `order`, optional `description`.
3. Use the components in `src/components/` for repeated patterns: `DocSection`, `MiniIndex`, `Callout`, `CommandList`.
4. The docs route regenerates from the collection; the sidebar uses explicit grouped navigation in `src/components/Sidebar.astro`, so add the page there if it should appear in the nav.
5. Update `scripts/check-local-links.sh`, `public/llms.txt`, and `public/llms-full.txt` when the public docs map changes.

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

- `public/llms.txt` — short AI-readable map.
- `public/llms-full.txt` — consolidated Markdown context.
- `public/robots.txt` — sitemap pointer.

The sitemap (`/sitemap-index.xml` and `/sitemap-0.xml`) is generated automatically by `@astrojs/sitemap` from the routes that Astro builds.

## Design constraints

Preserve the current visual direction unless explicitly asked to change it:

- mid-gray backgrounds,
- dark gray text,
- hard borders,
- raw HTML/CSS feel,
- Swiss / brutalist / design-engineering tone,
- dense but legible documentation layout.

Do not add generic SaaS styling, gradients, decorative blobs, or card-heavy marketing sections.
