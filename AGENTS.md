# AGENTS.md

Guidance for coding agents working on this repository.

## Project

This repository is the website and documentation source for `runebender.org`.

The application source is https://github.com/eliheuer/runebender-xilem.
Public product copy describes one Runebender application. Do not restore a
frontend comparison or separate library product listing.

## Technical shape

- Astro static site, deployed to GitHub Pages via the workflow in `.github/workflows/deploy.yml`.
- Page content lives in `src/content/docs/*.md` and `*.mdx` (collection), with routes in `src/pages/*.astro`.
- Shared layout and chrome live in `src/layouts/` and `src/components/` — there is one header, one footer, one sidebar, and one source of truth for each.
- Global CSS in `src/styles/global.css`. The Swiss/brutalist visual direction is preserved.
- Build output goes to `dist/`. URLs preserve the legacy `.html` suffix via `build.format: "preserve"` so existing external links continue to work.
- `public/` holds raw static files copied verbatim into the build (favicon, CNAME, `.nojekyll`, robots.txt, llms.txt, llms-full.txt, and the cloud editor build artifact at `public/cloud/editor/`).
- `/cloud/editor/index.html` is a checked-in static artifact built from `../runebender-web` by `scripts/build-cloud-editor.sh`; Astro should treat it as opaque release output, not source to refactor during website work.

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

The primary action is Launch Application, linking to `/wasm-editor/`.
Keep the homepage compact: one launch button, a short install command, and the
full GitHub URL. Keep the existing screenshot files and rotation.
`/wasm-editor/` embeds the real Xilem WebAssembly editor from `public/app/`.
Its source and interaction test live in runebender-xilem's `web/` directory.
Use `scripts/build-xilem-editor.sh /path/to/runebender-xilem` to update these
release artifacts. Verify actual browser interactions before publishing.
Browser edits stay in memory; desktop work remains the priority.

## Adding or editing a docs page

1. Create or edit `src/content/docs/<slug>.md` or `<slug>.mdx` (use MDX only when components are needed).
2. Set `title`, `lede`, `status`, `stability`, and `order` in frontmatter; add other metadata when useful.
3. Use the components in `src/components/` for repeated patterns: `DocSection`, `MiniIndex`, `Callout`, `CommandList`.
4. The docs route regenerates from the collection; add public pages to the grouped navigation in `src/lib/doc-nav.ts`.
5. Update `scripts/check-local-links.sh` and `public/llms.txt` when the public docs map changes. `public/llms-full.txt` is generated during the build.

## Documentation stance

Runebender Xilem is alpha software. Keep docs map-level and conservative.

Prefer:

- orientation over exhaustive details,
- current facts over promises,
- one maintained explanation for each topic,
- short command examples,
- explicit alpha-status caveats,
- clear separation between current behavior and future work.

Avoid:

- implying a stable public API,
- importing dated work logs or screenshot evidence into the public manual,
- over-documenting UI behavior that may change,
- marketing language that makes the app sound finished.

## Source of truth

The pages in `src/content/docs/` are the maintained documentation.
Verify implementation claims against the current `runebender-xilem` source and CLI help.
If a local checkout is unavailable, use the source repository on GitHub.

## Agent-readable files

Keep these files updated when documentation structure changes:

- `public/llms.txt` — short AI-readable map.
- `public/llms-full.txt` — generated consolidated Markdown context; do not edit it by hand.
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
