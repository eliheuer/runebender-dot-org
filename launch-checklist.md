# Launch Checklist

This checklist is for publishing `runebender.org`.

## Repository

- [ ] Decide whether `eliheuer/runebender-dot-org` should become public.
- [ ] Confirm repo description and topics on GitHub.
- [ ] Confirm README says this is the website, not the editor source.
- [ ] Confirm `AGENTS.md`, `llms.txt`, and `llms-full.txt` are current.

## Site Content

- [ ] Homepage clearly links to `eliheuer/runebender-xilem`.
- [ ] Homepage clearly distinguishes current Xilem editor from original Druid Runebender.
- [ ] Docs describe Runebender Xilem as very alpha.
- [ ] Current Facts page is accurate.
- [ ] Alpha Limits page is accurate.
- [ ] Hyperbezier page links to the canonical source-repo spec.
- [ ] QuiverAI notes mention network/API key/API credits.
- [ ] Screenshots are local assets and reflect the current app well enough.

## Technical

- [ ] `CNAME` contains `runebender.org`.
- [ ] `.nojekyll` is present.
- [ ] `robots.txt` points to `sitemap-index.xml`.
- [ ] `sitemap-index.xml` and `sitemap-0.xml` list all public pages.
- [ ] `llms.txt` and `llms-full.txt` serve as plain text.
- [ ] Favicon loads.
- [ ] Open Graph image path is correct after publish.

## GitHub Pages

- [ ] Enable GitHub Pages from `main` branch, repository root.
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

- [ ] Desktop layout pass.
- [ ] Tablet layout pass.
- [ ] Mobile layout pass.
- [ ] Check long tables and code blocks.
- [ ] Check all internal links.
- [ ] Check external links.
- [ ] Decide what happens to `runebender.app`: leave historical, redirect, or cross-link.
