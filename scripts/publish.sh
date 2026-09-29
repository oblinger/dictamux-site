#!/usr/bin/env bash
# Publish vault essays into _posts/ as YYYY-MM-DD-slug.md.
#   scripts/publish.sh                 # every "YYYY-MM-DD Title.md" in the essays folder
#   scripts/publish.sh <file.md> ...   # just these
# Source folder: $TAP_ESSAYS, default the TAP Essays folder in the vault (read only).
# Per file: drop the vault frontmatter, the ":>>" breadcrumb and the H1; title = the H1
# minus its date prefix; date = the filename prefix; [[wiki|alias]] -> alias, [[page#sec]] -> page.
# If the draft holds an H2 equal to the title, only that section is published (headings
# promoted one level) — drafting notes, demo beats and the draft preamble stay in the vault.
set -euo pipefail
here="$(cd "$(dirname "$0")/.." && pwd)"
src="${TAP_ESSAYS:-/Users/oblinger/ob/kmr/prj/ClaudiMux/DMX/The Anchor Press/TAP Essays}"
site_url="https://oblinger.github.io/dictamux-site"

if [ $# -eq 0 ]; then
  [ -d "$src" ] || { echo "publish: essays folder not found: $src" >&2; exit 1; }
  shopt -s nullglob
  set -- "$src"/*.md
  [ $# -gt 0 ] || { echo "publish: no .md files in $src" >&2; exit 1; }
fi

mkdir -p "$here/_posts"
python3 - "$here/_posts" "$site_url" "$@" <<'PY'
import os, re, sys
out_dir, site_url, files = sys.argv[1], sys.argv[2], sys.argv[3:]
fail = 0
for path in files:
    name = os.path.basename(path)
    m = re.match(r'^(\d{4}-\d{2}-\d{2}) (.+)\.md$', name)
    if not m:
        print(f"publish: skip {name}: filename is not 'YYYY-MM-DD Title.md'", file=sys.stderr); fail = 1; continue
    date = m.group(1)
    lines = open(path, encoding='utf-8').read().split('\n')
    if lines and lines[0].strip() == '---':
        end = next((i for i in range(1, len(lines)) if lines[i].strip() == '---'), None)
        if end is None:
            print(f"publish: {name}: unterminated frontmatter", file=sys.stderr); fail = 1; continue
        lines = lines[end + 1:]
    lines = [l for l in lines if not l.startswith(':>>')]
    h1 = next((i for i, l in enumerate(lines) if l.startswith('# ')), None)
    if h1 is None:
        print(f"publish: {name}: no H1", file=sys.stderr); fail = 1; continue
    title = re.sub(r'^\d{4}-\d{2}-\d{2}\s+', '', lines[h1][2:].strip())
    del lines[h1]
    sec = next((i for i, l in enumerate(lines) if l.startswith('## ') and l[3:].strip() == title), None)
    if sec is not None:
        end = next((i for i in range(sec + 1, len(lines)) if lines[i].startswith('## ')), len(lines))
        lines = [l[1:] if re.match(r'^#{3,6} ', l) else l for l in lines[sec + 1:end]]
    body = '\n'.join(lines).strip('\n')
    body = re.sub(r'\[\[([^\]|#]*)(?:#[^\]|]*)?(?:\|([^\]]*))?\]\]', lambda w: (w.group(2) or w.group(1)).strip(), body)
    slug = re.sub(r'[^a-z0-9]+', '-', title.lower()).strip('-')
    esc = title.replace('\\', '\\\\').replace('"', '\\"')
    post = (f'---\nlayout: essay\ntitle: "{esc}"\ndate: {date}\n'
            f'canonical_url: "{site_url}/essays/{slug}/"\n---\n'
            '{% raw %}\n' + body + '\n{% endraw %}\n')
    dest = os.path.join(out_dir, f'{date}-{slug}.md')
    open(dest, 'w', encoding='utf-8').write(post)
    print(f"publish: {name} -> _posts/{date}-{slug}.md")
sys.exit(fail)
PY
