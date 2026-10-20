# Evidence Desk website

Public information page for Evidence Desk, an India-first health Q&A product with public saved sample answers and a full app still in private testing.

`index.html` uses inline CSS, embedded Source Serif 4 headings and system body fonts, and local image assets. There are no scripts, build tools, tracking, or forms. Contact links open an email client.

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

The problem illustration is AI-generated and labeled as such. The how-it-works section uses unmodified captures of the saved creatine answer card and source panel from `evidence-desk/site/demo`, captured 12 October 2026. The screenshots show the evidence label, answer and catch, highlighted library passage, and funding disclosure. They are not clinically reviewed. Both screens display at equal widths of no more than 420 pixels, below or at their natural size; the source frame scrolls to reveal its funding disclosure.

Boundary cards illustrate library gaps, clinician routing, and why lab findings alone do not establish benefits in people. The page does not present these diagrams as actual answer screenshots.

## Cloudflare upload

Upload these files together, preserving the asset directories:

- `index.html`
- `assets/illustrations/conflicting-health-advice.webp`
- `assets/screens/creatine-card-2026-10-12.webp`
- `assets/screens/creatine-source-2026-10-12.webp`

The HTML embeds the font, so no font upload is needed. `CNAME` and `.nojekyll` are GitHub Pages configuration, not Cloudflare upload files. Remove the obsolete solution illustration files from the deployment bundle when replacing it.

## Saved-demo funding disclosures

Sync the reviewed app demo into `demo/` with:

```sh
scripts/sync-demo.sh /path/to/evidence-desk/site/demo
```

The source can also be set with `EVIDENCE_DESK_DEMO_DIR`; the original sibling
checkout remains the default. The sync copies `index.html`, `data.js`,
`funding.js` and `funding-data.js`, preserves this site's existing question display
labels, and embeds the app's current script CSP hash. The two funding files must
ship with the demo page. Only the public demo changes; landing-page sections and
saved answers are unaffected.
