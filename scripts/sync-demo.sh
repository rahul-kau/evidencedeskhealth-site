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
meta+=('<meta property="og:title" content="Evidence Desk sample answers">\n<meta property="og:description" content="Real health questions, answered from checked research: verdict, the catch, sources and who paid for the studies.">\n'
       '<meta property="og:type" content="website">\n<meta property="og:url" content="https://evidencedeskhealth.com/demo/">\n<meta property="og:site_name" content="Evidence Desk">\n'
       '<meta property="og:image" content="https://evidencedeskhealth.com/assets/og-image.png">\n<meta property="og:image:width" content="1200">\n<meta property="og:image:height" content="630">\n'
       '<meta name="twitter:card" content="summary_large_image">\n<meta name="twitter:image" content="https://evidencedeskhealth.com/assets/og-image.png">\n'
       '<link rel="apple-touch-icon" href="/apple-touch-icon.png">\n')
h=h.replace('<head>','<head>\n'+meta,1)
# Version each script link by its content so browsers never pair a new page with an old cached script.
import hashlib, os, re
d=os.path.dirname(dst)
h=re.sub(r'src="([\w.-]+\.js)"', lambda m: 'src="%s?v=%s"'%(m.group(1), hashlib.sha256(open(os.path.join(d,m.group(1)),'rb').read()).hexdigest()[:10]), h)
open(dst,'w').write(h)
P
echo "demo synced into $SITE/demo"
