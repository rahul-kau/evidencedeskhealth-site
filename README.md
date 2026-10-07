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

## Product visuals

The citation-panel screenshot is embedded as a PNG data URI, unmodified, from the owner-provided `Health SaaS/screens/citation-panel.png`. Its accompanying screen-tour README identifies it as a scripted demo, captured 2026-10-05, with real library passages; that provenance is disclosed on the page. The four-tier graphic uses accessible HTML/CSS and reproduces the prototype’s current classification from `web/tiers.js`; it is labeled as prototype methodology awaiting clinical review. No private question history or logs are published.

## Illustrative comparison

The hero compares a claim without context with a sourced explanation format. Neither panel is represented as a real competitor response, live output, or accuracy benchmark. The example references the 2025 magnesium bisglycinate trial (PMID 40918053), with short follow-up and self-reported outcomes made explicit. The lower scenario panels illustrate library gaps and clinician routing without giving personal medical advice.
