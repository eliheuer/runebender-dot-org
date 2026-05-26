# Runebender site design brief

Working target for the next design and copyediting pass.

## Goal

Bring `runebender.org` closer to the maturity and clarity of the RoboFont site:
calm, useful, technically credible, and easy to navigate without making the
project sound more finished than it is.

## Positioning

Runebender is a project family, not one application.

- Core is the headless Rust crate and CLI direction.
- Xilem is the native desktop editor.
- Comfy is the ComfyUI graph and browser-hosted editor path.
- Druid is historical project lineage.
- Future front-ends should have room without inheriting Xilem-specific docs.

The site should make that structure obvious before asking anyone to install,
read a manual, or choose a repository.

## Design Direction

Keep the current Swiss/brutalist direction, but make it feel more deliberate.

- Mid-gray backgrounds, dark gray text, hard borders.
- Dense but legible documentation layout.
- Raw HTML/CSS feel, not generic SaaS polish.
- Restrained hierarchy, strong alignment, fewer decorative moves.
- No gradients, blobs, soft cards, marketing sections, or fake product gloss.

The site should feel like a serious tool and documentation archive, not a launch
page for a finished commercial app.

## Copy Direction

Keep the writing plain, concrete, and conservative.

- Prefer orientation over promotion.
- Say "Xilem" when behavior is Xilem-specific.
- Say "Comfy" when behavior belongs to the ComfyUI path.
- Say "Core" when describing headless, scripted, CLI, or shared-library work.
- Keep alpha caveats visible without repeating them in every paragraph.
- Avoid implying stable APIs, stable shortcuts, or finished release packaging.

## Design Pass Order

1. Homepage composition and rhythm.
2. Shared header and footer.
3. Docs index and sidebar readability.
4. Core, Xilem, and Comfy landing page consistency.
5. Screenshot and Open Graph image treatment.

## Not This Pass

- GitHub Pages deployment.
- DNS setup.
- More verification scripts.
- Rust dependency or `kurbo` migration work.
- Deep new docs for workflows that are not ready yet.

