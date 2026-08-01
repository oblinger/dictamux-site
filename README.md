# dictamux-site

The **DictaMux** site. Static, single-page, no build step, served via GitHub Pages.

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
open index.html               # quick look
python3 -m http.server 8000   # or serve at http://localhost:8000
```

## TODO

- [ ] Fill the three placeholders above.
- [ ] M3: custom domain `dictamux.com` via CNAME, plus SEO/OG tags — and delete `robots.txt` at the same time, or the public site launches invisible.
