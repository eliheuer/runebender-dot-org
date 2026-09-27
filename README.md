# runebender-dot-org

Website and documentation source for `runebender.org`.

Built with [Astro](https://astro.build/). Pages are `.astro` routes or `.md`/`.mdx` docs. The build output is static HTML, deployed to GitHub Pages via `.github/workflows/deploy.yml`.

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
  content/docs/   Maintained Markdown and MDX documentation.
  content.config.ts
  pages/          Route entries, including the homepage and generated docs routes
  styles/         global.css
  assets/         Source images processed by Astro <Image>
public/           Raw static files copied verbatim into the build:
                    favicon, CNAME, .nojekyll,
                    robots.txt, llms.txt, llms-full.txt,
                    cloud/editor/ (Vite build artifact, see below)
scripts/
  check-local-links.sh         HTTP 200 sweep against built preview output
  check-external-links.sh      HTTP sweep for public off-site links
  check-published-site.sh      HTTP sweep for live runebender.org after deploy
  build-cloud-editor.sh        Maintains a historical browser artifact; not the current product entry point
  vite.comfy-standalone.config.mjs
.github/workflows/deploy.yml   Build and deploy to GitHub Pages
AGENTS.md                      Agent guidance for editing this repo
launch-checklist.md            Pre-publication checklist
```

## Adding a docs page

1. Create `src/content/docs/<slug>.md` or `<slug>.mdx` with `title`, `lede`, `status`, `stability`, and `order` frontmatter. Use MDX when components are needed.
2. Use the shared components for repeated patterns: `DocSection`, `MiniIndex`, `Callout`, `CommandList`.
3. The docs route is generated from the collection. Add visible pages to the grouped navigation in `src/lib/doc-nav.ts`.
4. If the public docs map changes, update `scripts/check-local-links.sh` and `public/llms.txt`. The build regenerates `public/llms-full.txt` from the docs pages.

## Deployment

GitHub Pages must be configured to deploy from "GitHub Actions" rather than from a branch. The workflow in `.github/workflows/deploy.yml` builds `dist/` and uploads it as the Pages artifact. `CNAME` (in `public/`) keeps `runebender.org` as the custom domain.

The workflow publishes on pushes to `main` and can also be run manually.
After publishing, run `pnpm run check-published-site` to verify the live routes.

## Browser editor

Launch Application at `/wasm-editor/` embeds the actual Xilem/Masonry interface,
compiled to WebAssembly from runebender-xilem. The bundled font can be browsed
and edited in memory. Saving files and local AI execution require the desktop.

Update the checked-in release artifacts in `public/app/` with:

```sh
scripts/build-xilem-editor.sh /path/to/runebender-xilem
pnpm run build
```

The application repository's `web/README.md` covers prerequisites and browser
interaction checks. `public/app/build-info.json` records the source commit and
WASM checksum. Builds use a committed source snapshot, so concurrent desktop
edits are excluded. Loader, bindings, and WASM requests share a release identifier
to prevent incompatible cached files from being mixed. Historical bundles under
`public/cloud/` remain opaque artifacts;
they are not the Launch Application entry point. Homepage screenshots are independent.
