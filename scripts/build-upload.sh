#!/bin/bash
# Builds ONE folder to drag into Cloudflare's landing-page project.
# Landing page at /, sample-answers demo at /demo/.
set -e
SITE="$(cd "$(dirname "$0")/.." && pwd)"
DEMO="$SITE/../Health SaaS/evidence-desk/site/demo"
OUT="$SITE/../upload-evidencedeskhealth"
rm -rf "$OUT"; mkdir -p "$OUT/demo"
cp "$SITE/index.html" "$OUT/"; cp -R "$SITE/assets" "$OUT/"
cp "$DEMO/index.html" "$DEMO/data.js" "$OUT/demo/"
# demo security headers apply only under /demo/
sed 's#^/\*$#/demo/*#' "$DEMO/_headers" > "$OUT/_headers"
echo "Ready: drag this ONE folder into Cloudflare -> $OUT"
find "$OUT" -type f | sed "s#$OUT/#  #"
