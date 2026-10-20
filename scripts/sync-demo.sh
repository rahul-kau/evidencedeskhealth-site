#!/bin/bash
# Copies the latest sample-answers demo into this repo at demo/.
# The site is served by GitHub Pages, so pushing main publishes it.
set -e
SITE="$(cd "$(dirname "$0")/.." && pwd)"
DEMO="${1:-${EVIDENCE_DESK_DEMO_DIR:-$SITE/../Health SaaS/evidence-desk/site/demo}}"
mkdir -p "$SITE/demo"
# Keep the website's reviewed display labels; the app's bank-safe labels may be redacted.
python3 - "$DEMO/data.js" "$SITE/demo/data.js" <<'LABELS'
import json, sys
from pathlib import Path
src,dst=map(Path,sys.argv[1:])
def read(path):
    return json.loads(path.read_text().removeprefix("window.DEMO = ").strip().removesuffix(";"))
answers=read(src)
labels={a["id"]:a["question"] for a in read(dst)} if dst.exists() else {}
for answer in answers:
    if answer["id"] in labels:
        answer["question"]=labels[answer["id"]]
dst.write_text("window.DEMO = " + json.dumps(answers,ensure_ascii=False,indent=1) + ";\n")
LABELS
for file in funding.js funding-data.js; do
  cp "$DEMO/$file" "$SITE/demo/"
done
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
