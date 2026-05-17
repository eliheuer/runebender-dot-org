# Launch Checklist

This checklist is for publishing `runebender.org`.

## Repository

- [ ] Decide whether `eliheuer/runebender-dot-org` should become public.
- [ ] Confirm repo description and topics on GitHub.
- [x] Confirm README says this is the website, not the editor source.
- [x] Confirm `AGENTS.md`, `llms.txt`, and `llms-full.txt` are current.

## Site Content

- [x] Homepage presents Runebender as a project family, not one app.
- [x] Homepage clearly distinguishes Core, Xilem, Comfy, future front-ends, and historical Druid.
- [x] Docs home separates shared concepts from editor-specific docs.
- [x] Xilem-specific pages are labeled as Xilem-specific.
- [x] Comfy and Core landing pages exist even if detailed docs are still thin.
- [x] Docs describe the Runebender project family as very alpha.
- [x] Current Facts page is accurate.
- [x] Alpha Limits page is accurate.
- [x] Hyperbezier page links to the canonical source-repo spec.
- [x] QuiverAI notes mention network/API key/API credits.
- [x] Screenshots are local assets and reflect the current app well enough.
- [x] `llms.txt` and `llms-full.txt` explain the project family and do not collapse all front-ends into Xilem.

## Technical

- [x] `CNAME` contains `runebender.org`.
- [x] `.nojekyll` is present.
- [x] `robots.txt` points to `sitemap-index.xml`.
- [x] `sitemap-index.xml` and `sitemap-0.xml` list all public pages.
- [x] `llms.txt` and `llms-full.txt` serve as plain text.
- [x] Favicon loads.
- [x] Open Graph image path is correct after publish.

## GitHub Pages

- [ ] Enable GitHub Pages from GitHub Actions.
- [ ] Confirm Pages build succeeds.
- [ ] Confirm `https://runebender.org/` returns 200.
- [ ] Confirm `https://runebender.org/docs/index.html` returns 200.
- [ ] Confirm `https://runebender.org/llms.txt` returns 200.
- [ ] Confirm HTTPS is enforced after DNS settles.

## DNS

- [ ] Add GitHub Pages apex records for `runebender.org`.
- [ ] Decide whether `www.runebender.org` should redirect or resolve.
- [ ] Verify DNS with `dig runebender.org`.
- [ ] Confirm GitHub Pages custom domain check passes.

## Final Review

- [x] Desktop layout pass.
- [x] Tablet layout pass.
- [x] Mobile layout pass.
- [x] Check long tables and code blocks.
- [x] Check all internal links.
- [x] Check external links.
- [ ] Decide what happens to `runebender.app`: leave historical, redirect, or cross-link.
