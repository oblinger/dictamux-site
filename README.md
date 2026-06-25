# dictamux-site

Public marketing site for **DictaMux**. Static, single-page, served via GitHub Pages.

Planning, copy, and rollout live in the **DMP** anchor (`~/ob/kmr/prj/ClaudiMux/MuxUX/DictaMux Pub/`). This repo holds only the deployed site.

## Status

**M1 — Friends Alpha (unlisted).** Single bare page: name, one-line pitch, download link (placeholder until the beta DMG ships). Not posted publicly yet — shared by URL only.

See `DMP Rollout Plan` for the milestone path (M1 `dictamux.github.io` → M3 `dictamux.com`).

## Deploy

Pushing to `main` auto-publishes via GitHub Pages.

- Live URL: `https://oblinger.github.io/dictamux-site/`
- Source: `main` branch, root.

## Local preview

```
open index.html          # quick look
python3 -m http.server 8000   # or serve at http://localhost:8000
```

## TODO

- [ ] Add the beta DMG download link (swap the disabled button in `index.html`).
- [ ] M3: custom domain `dictamux.com` via CNAME + SEO/OG tags.
