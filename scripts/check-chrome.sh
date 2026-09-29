#!/usr/bin/env bash
# Every chrome page in the built site carries the chrome v1 block: marker, the three
# subject links in the header, and exactly one current mark. Builds _site with jekyll
# when available; otherwise checks the source pages. index.html (the alpha splash) is
# exempt until the root moves under the chrome (M-Home.2).
set -uo pipefail
cd "$(dirname "$0")/.."
exempt=" index.html "
if command -v jekyll >/dev/null && jekyll build -q >/dev/null 2>&1; then
  root=_site; pages=$(cd _site && find . -name '*.html' | sed 's#^\./##' | sort)
else
  echo "check-chrome: jekyll unavailable, checking source pages" >&2
  root=.; pages="$(ls design/*.html) _layouts/chrome.html"
fi
fail=0
for p in $pages; do
  case "$exempt" in *" $p "*) continue;; esac
  f="$root/$p"; bad=""
  if [ "$p" = _layouts/chrome.html ]; then   # source mode: the layout draws names from _config.yml
    grep -q '<!-- chrome v1 -->' "$f" || bad="$bad marker"
    grep -q 'for s in site.subjects' "$f" || bad="$bad no-subject-loop"
    for s in 'The Anchor System' 'DictaMux' 'HookAnchor'; do grep -q "name: $s\$" _config.yml || bad="$bad config:$s"; done
    if [ -n "$bad" ]; then echo "FAIL $p:$bad"; fail=1; else echo "ok   $p"; fi
    continue
  fi
  grep -q '<!-- chrome v1 -->' "$f" || bad="$bad marker"
  head=$(sed -n '/<header class="chrome-head">/,/<\/header>/p' "$f")
  for s in 'The Anchor System' 'DictaMux' 'HookAnchor'; do
    printf '%s' "$head" | grep -q ">$s</a>" || bad="$bad link:$s"
  done
  [ "$root" = "." ] || { n=$(printf '%s' "$head" | grep -o 'aria-current="page"' | wc -l | tr -d ' '); [ "$n" = 1 ] || bad="$bad current:$n"; }
  if [ -n "$bad" ]; then echo "FAIL $p:$bad"; fail=1; else echo "ok   $p"; fi
done
[ $fail = 0 ] && echo "check-chrome: PASS" || echo "check-chrome: FAIL"
exit $fail
