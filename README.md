# Evidence Desk website

Public information page for Evidence Desk, an India-first health Q&A product in private preview.

`index.html` is self-contained: inline CSS, embedded Source Serif 4 headings and system body fonts, no external assets, scripts, build tools, tracking, or forms. Contact links open an email client.

GitHub Pages serves the root of `main`. `CNAME` sets `evidencedeskhealth.com`; `.nojekyll` disables Jekyll processing.

## Domain setup

In Namecheap Advanced DNS, set these host records with Automatic TTL:

| Type | Host | Value |
| --- | --- | --- |
| A | @ | 185.199.108.153 |
| A | @ | 185.199.109.153 |
| A | @ | 185.199.110.153 |
| A | @ | 185.199.111.153 |
| CNAME | www | rahul-kau.github.io |

Replace conflicting parking or URL redirect records at `@` and `www`. Preserve Zoho MX, SPF, DKIM, and other mail-related records. After DNS resolves and GitHub provisions the certificate, enable Enforce HTTPS in repository Settings > Pages.

GitHub documentation: https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site/managing-a-custom-domain-for-your-github-pages-site

## Visual identity

Shares the product’s parchment background (`#F6F1E7`), cream surfaces (`#FFFDF8`), rust accent (`#8A2D1C`), Source Serif 4 headings, system body font stack, and E brand mark. The unmodified Source Serif 4 regular WOFF2 from Adobe is embedded in the HTML; its SIL Open Font License and copyright are included in a CSS comment. No font network request is needed.

## Guided product demo

The primary action opens an interactive, prepared walkthrough. Native HTML `details`/`summary` disclosures let visitors collapse the answer and open each numbered source. No scripts, external assets, tracking, visitor input, backend connection or API key are used. Both source panels link to the original PubMed records; the older review also links its correction.

The example is based on a real local API answer captured on 8 October 2026. The page displays selected checked findings, with edited context and limitations, rather than an unedited model transcript. Its prepared status and lack of clinical review are visible in the hero and walkthrough. See [provenance](docs/guided-demo-provenance.md) for the library version, model use and source checks. The earlier scripted screenshot and illustrative comparison have been replaced with an HTML recreation of the answer/verdict/source pattern, so the interaction itself is usable at narrow widths.

The four-tier pyramid retains the prototype classification and clinical-review caveat. The library-gap and clinician-routing scenarios remain labeled illustrations. The founder story uses Rahul's own account of investigating omega-3 claims; it makes no efficacy claim about omega-3 supplements. No personal questions, private logs or full-library files are published.

## Preview and validation

```sh
python3 -m http.server 8765 --bind 127.0.0.1
```

Open `http://127.0.0.1:8765/`. Check the hero CTA, answer disclosure, both citation disclosures, external research links and founder navigation. Native disclosures support keyboard interaction without JavaScript. The page retains visible focus outlines and respects reduced-motion preferences for anchor scrolling.
