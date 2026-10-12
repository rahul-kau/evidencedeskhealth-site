#!/bin/bash
# Copies the latest sample-answers demo into this repo at demo/.
# The site is served by GitHub Pages, so pushing main publishes it.
set -e
SITE="$(cd "$(dirname "$0")/.." && pwd)"
DEMO="$SITE/../Health SaaS/evidence-desk/site/demo"
mkdir -p "$SITE/demo"
cp "$DEMO/data.js" "$SITE/demo/"
CSP=$(grep -m1 'Content-Security-Policy:' "$DEMO/_headers" | sed 's/^ *Content-Security-Policy: //; s/ *frame-ancestors [^;]*;//')
python3 - "$DEMO/index.html" "$SITE/demo/index.html" "$CSP" <<'P'
import sys
src,dst,csp=sys.argv[1:]
h=open(src).read()
meta='<meta http-equiv="Content-Security-Policy" content="%s">\n<meta name="referrer" content="no-referrer">\n'%csp
h=h.replace('<head>','<head>\n'+meta,1)
open(dst,'w').write(h)
P
echo "demo synced into $SITE/demo"
