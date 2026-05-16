# AGENTS.md

Guidance for coding agents working on this repository.

## Project

This repository is the website and documentation source for `runebender.org`.

It is not the Runebender application source. The current application source is:

- https://github.com/eliheuer/runebender-xilem

The earlier Druid-based Runebender source is:

- https://github.com/linebender/runebender

## Technical shape

- Astro static site, deployed to GitHub Pages via the workflow in `.github/workflows/deploy.yml`.
- Page content lives in `src/content/docs/*.mdx` (collection) and `src/pages/*.astro` (routes).
- Shared layout and chrome live in `src/layouts/` and `src/components/` — there is one header, one footer, one sidebar, and one source of truth for each.
- Global CSS in `src/styles/global.css`. The Swiss/brutalist visual direction is preserved.
- Build output goes to `dist/`. URLs preserve the legacy `.html` suffix via `build.format: "preserve"` so existing external links continue to work.
- `public/` holds raw static files copied verbatim into the build (favicon, og-image, CNAME, `.nojekyll`, robots.txt, llms.txt, llms-full.txt, and the cloud editor build artifact at `public/cloud/editor/`).

## Local workflow

```sh
pnpm install
pnpm run dev       # http://127.0.0.1:4321
pnpm run build     # outputs dist/
pnpm run preview   # serves dist/ for verification
```

After running `pnpm run dev`, link-check the site:

```sh
scripts/check-local-links.sh http://127.0.0.1:4321
```

## Adding or editing a docs page

1. Create or edit `src/content/docs/<slug>.mdx`.
2. Set the frontmatter: `title`, `navLabel`, `eyebrow`, `lede`, `status`, `audience`, `source`, `stability`, `order`, optional `description`.
3. Use the components in `src/components/` for repeated patterns: `DocSection`, `MiniIndex`, `Callout`, `CommandList`.
4. The sidebar regenerates from the collection sorted by `order`; no manual nav edits needed.
5. Update `public/llms.txt` and `public/llms-full.txt` when the public docs map changes.

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
