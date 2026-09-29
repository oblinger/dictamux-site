#!/usr/bin/env bash
# Every page has its own non-empty, unique <title> and a robots noindex meta;
# robots.txt still disallows everything. Checks _site when jekyll can build it,
# otherwise the hand-written source pages.
set -uo pipefail
cd "$(dirname "$0")/.."
if command -v jekyll >/dev/null && jekyll build -q >/dev/null 2>&1; then
  root=_site; pages=$(cd _site && find . -name '*.html' | sed 's#^\./##' | sort)
else
  echo "check-home: jekyll unavailable, checking source pages" >&2
  root=.; pages=$(ls index.html design/*.html | sort)
fi
fail=0; titles=""
for p in $pages; do
  f="$root/$p"; bad=""
  t=$(tr '\n' ' ' < "$f" | sed -n 's#.*<title>\([^<]*\)</title>.*#\1#p' | sed 's/^ *//;s/ *$//')
  [ -n "$t" ] || bad="$bad no-title"
  grep -Eq '<meta name="robots" content="[^"]*noindex' "$f" || bad="$bad no-noindex"
  if [ -n "$t" ] && printf '%s\n' "$titles" | grep -Fxq -- "$t"; then bad="$bad dup-title"; fi
  titles="$titles
$t"
  if [ -n "$bad" ]; then echo "FAIL $p:$bad"; fail=1; else echo "ok   $p — $t"; fi
done
grep -q '^Disallow: /$' robots.txt && echo "ok   robots.txt Disallow: /" || { echo "FAIL robots.txt"; fail=1; }
[ $fail = 0 ] && echo "check-home: PASS" || echo "check-home: FAIL"
exit $fail
