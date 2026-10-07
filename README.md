# Evidence Desk website

Public information page for Evidence Desk, an India-first health Q&A product in private preview.

`index.html` is self-contained: inline CSS, system fonts, no external assets, scripts, build tools, tracking, or forms. Contact links open an email client.

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
