/* Shared disclosure presentation for the live app and saved demo. No requests. */
(function (root) {
  "use strict";
  function safeUrl(value) { try { const u = new URL(String(value || "")); return /^(https?:)$/.test(u.protocol) ? u.href : ""; } catch (_) { return ""; } }
  function entries(citations) {
    return Object.entries(citations || {}).map(([n, c]) => {
      const checked = (c.funding || []).map(f => ({ ...f, checked: f.checked === true, url: safeUrl(f.url), stake: ["yes", "no", "unknown"].includes(f.stake) ? f.stake : "unknown" }));
      const known = checked.filter(f => f.checked);
      const studies = (c.studies || []).filter(st => !known.some(f => (f.study_ids || []).includes(String(st.key || "").toLowerCase()) || [st.doi_url, st.full_text_url, st.pubmed_url].some(u => safeUrl(u) && safeUrl(u) === f.url) || (st.title && f.study && f.study.toLowerCase().includes(st.title.toLowerCase()))));
      const unchecked = studies.map(st => ({ study: st.title || "Study cited in this passage", funder: "Not checked", stake: "unknown", stake_detail: "Funding and financial interests have not been checked for this study.", checked: false, url: safeUrl(st.doi_url || st.pubmed_url || st.full_text_url) }));
      if (!checked.length && !unchecked.length) unchecked.push({ study: "Specific study not identified for this passage", funder: "Not checked", stake: "unknown", stake_detail: "No matched funding record. This is not evidence of independence.", checked: false, url: safeUrl(c.url) });
      return { n, title: c.doc_title || c.doc || "Cited source", records: [...checked, ...unchecked] };
    });
  }
  function summary(citations) {
    const sources = entries(citations), unique = new Map();
    sources.forEach(s => s.records.filter(f => f.checked).forEach(f => unique.set(f.id || f.url + f.study, f)));
    const checked = [...unique.values()], counts = { independent: 0, industry: 0, mixed: 0, not_stated: 0 };
    checked.forEach(f => { const k = Object.prototype.hasOwnProperty.call(counts, f.cls) ? f.cls : "not_stated"; counts[k]++; });
    const unreviewed = sources.filter(s => s.records.some(f => !f.checked)).length;
    const parts = [];
    if (checked.length) parts.push("Funding check: " + checked.length + (checked.length === 1 ? " study" : " studies"));
    const industryTies = counts.industry + counts.mixed;
    if (industryTies) parts.push(industryTies + " with industry ties");
    if (counts.not_stated) parts.push(counts.not_stated + (counts.not_stated === 1 ? " doesn’t state funding" : " don’t state funding"));
    if (unreviewed) parts.push(unreviewed + (unreviewed === 1 ? " source unchecked" : " sources unchecked"));
    const text = sources.length ? (checked.length ? parts.join(" · ") : "Funding not checked yet · " + parts.join(" · ")) : "No studies cited · Funding not checked";
    return { text, sources, checked: checked.length };
  }
  const note = "Stake means reported industry sponsorship, product supply or author financial ties. No means none declared in the checked disclosure; it is not a guarantee. Funding does not establish bias or independent replication. For reviews, these are the review’s own disclosures, not a funding check of every included trial.";
  const api = { safeUrl, entries, summary, note };
  root.EvidenceFunding = api;
  if (typeof module !== "undefined" && module.exports) module.exports = api;
})(typeof window !== "undefined" ? window : globalThis);
