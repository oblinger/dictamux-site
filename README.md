# dictamux-site

The umbrella site (placeholder name UMBRELLA) and the **DictaMux** alpha splash. Jekyll, built natively by GitHub Pages: key pages are hand-written HTML inside `_layouts/chrome.html`; essays come from the vault via `scripts/publish.sh` into `_posts/`. `index.html` has no front matter, so Jekyll copies it verbatim.

Planning, copy, and rollout live in the **TAP** anchor (`~/ob/kmr/prj/ClaudiMux/MuxUX/The Anchor Press/`). This repo holds only the deployed page.

## Status

**M-Alpha.1 — invited alpha splash (unlisted).** Built to the Stage-A work order via [[TAP]] F002 step 1: wedge tagline, demo-video slot, plain requirements, private download slot, invited-alpha framing, feedback-channel pointer. Deliberately absent — pricing, waitlist, testimonials, share buttons, OG/social cards, analytics; those arrive at M3.

Unlisted means unlisted: `noindex` in the page head, `Disallow: /` in `robots.txt`, and nothing public links here. Shared by direct URL with invited alpha users only.

Three placeholders remain, each visibly marked in the rendered page so a half-finished version cannot be sent by accident. Grep `PLACEHOLDER` in `index.html`.

| # | Placeholder | Blocked on |
|---|---|---|
| 1 | Demo video | Dan records it — TAP F002 step 2 |
| 2 | Download link | the signed, notarized alpha DMG |
| 3 | Feedback channel | Dan picks email alias vs small private Discord — TAP F002 step 4 |

See `TAP Rollout Plan` for the milestone path (M1 `oblinger.github.io/dictamux-site` → M3 `dictamux.com`).

## Deploy

Pushing to `main` auto-publishes via GitHub Pages.

- Live URL: `https://oblinger.github.io/dictamux-site/`
- Source: `main` branch, root.

## Local preview

```
jekyll serve           # localhost:4000/dictamux-site/
scripts/publish.sh     # vault TAP Essays/ -> _posts/
scripts/check-chrome.sh
scripts/check-home.sh
```

## TODO

- [ ] Fill the three placeholders above.
- [ ] M3: custom domain `dictamux.com` via CNAME, plus SEO/OG tags — and delete `robots.txt` at the same time, or the public site launches invisible.
