# runebender-dot-org

Website and documentation source for `runebender.org`.

Built with [Astro](https://astro.build/). Pages are written as `.astro` route files or as `.mdx` docs in the content collection. The build output is plain static HTML, deployed to GitHub Pages via `.github/workflows/deploy.yml`.

## Run locally

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

## Project layout

```
src/
  layouts/        BaseLayout, DocLayout
  components/     Header, Footer, Sidebar, DocSection, MiniIndex, Callout, CommandList
  content/docs/   Docs collection (one .mdx per page). The sidebar regenerates from this.
  content.config.ts
  pages/          Route entries: index.astro, docs/index.astro, docs/[slug].astro, cloud/index.astro
  styles/         global.css
  assets/         Source images processed by Astro <Image>
public/           Raw static files copied verbatim into the build:
                    favicon, og-image, CNAME, .nojekyll,
                    robots.txt, llms.txt, llms-full.txt,
                    cloud/editor/ (Vite build artifact, see below)
scripts/
  check-local-links.sh         HTTP 200 sweep against built preview output
  build-cloud-editor.sh        Builds the standalone Comfy/Vue editor into public/cloud/editor/
  vite.comfy-standalone.config.mjs
  sync-comfy-web.sh            Local-only mirror of ~/GH/repos/runebender-comfy/web
.github/workflows/deploy.yml   Build and deploy to GitHub Pages
AGENTS.md                      Agent guidance for editing this repo
launch-checklist.md            Pre-publication checklist
```

## Adding a docs page

1. Create `src/content/docs/<slug>.mdx` with frontmatter (`title`, `navLabel`, `eyebrow`, `lede`, `status`, `audience`, `source`, `stability`, `order`).
2. Use the shared components for repeated patterns: `DocSection`, `MiniIndex`, `Callout`, `CommandList`.
3. The docs route is generated from the collection. If the new page belongs in the visible sidebar, add it to the grouped nav in `src/components/Sidebar.astro`.
4. If the public docs map changes, also update `scripts/check-local-links.sh`, `public/llms.txt`, and `public/llms-full.txt`.

## Deployment

GitHub Pages must be configured to deploy from "GitHub Actions" rather than from a branch. The workflow in `.github/workflows/deploy.yml` builds `dist/` and uploads it as the Pages artifact. `CNAME` (in `public/`) keeps `runebender.org` as the custom domain.

## Cloud editor

The standalone Vue/WASM editor at `/cloud/editor/` is built from `~/GH/repos/runebender-comfy/web` by `scripts/build-cloud-editor.sh`. The output lands in `public/cloud/editor/` so the Astro build picks it up unchanged.
