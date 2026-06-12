# Temporary: the editor is serving at the site root

Since 2026-06-12 (commit `165e289`), runebender.org lands straight in
the cloud editor so the working web editor can be shared before the
full site is ready. This is meant to last a few weeks.

What that commit changed:

- `src/pages/index.astro` — replaced with a page that inlines
  `public/cloud/editor/index.html` at build time (so the root always
  matches the embedded editor build, hashed assets included)
- `src/pages/home.astro` — the real homepage, moved aside verbatim;
  still live at <https://runebender.org/home.html>
- `public/rb.png` — copy of the editor's social-card image so the
  root page's `og:image` resolves

Nothing else moved: `/docs/...` and `/cloud/...` are untouched.

## To switch the full site back

Either revert the takeover commit:

```sh
git revert 165e289   # then resolve trivially if the embed was rebuilt
git push             # deploys via GitHub Actions
```

…or do it by hand (equivalent):

```sh
git rm src/pages/index.astro
git mv src/pages/home.astro src/pages/index.astro
git rm TEMPORARY-EDITOR-AT-ROOT.md     # this note
# keep public/rb.png — harmless, and useful if anything links it
git commit -m "Restore the full site at the root"
git push
```

Then check <https://runebender.org/> shows the homepage and
<https://runebender.org/cloud/editor/index.html> still opens the
editor.
