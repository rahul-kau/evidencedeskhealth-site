# Guided demo provenance — 8 October 2026

The prepared example was captured from the actual local Claude API prototype on the integration branch, using the question “Does magnesium help sleep?”. This page does not send visitor questions to an API.

Models: `claude-haiku-4-5` for routing/support checking; `claude-sonnet-5-5` for extraction/explanation. Library version: `bb8945416f35`. Both published source excerpts were confirmed as exact substrings of library section `D034-4`; semantic verification returned `ok`. Two of eight proposed findings survived the prototype's checks.

The landing page shows selected verified findings, the prototype's “Mixed” verdict, and manually edited context/limitations. It is an HTML recreation, not a screenshot, unedited model transcript, live chat, clinical evaluation or universal recommendation. The prototype's generated catch fell back to a generic message; the prepared walkthrough instead explains the limits of the two selected papers. The unedited teacher response and unrelated papers returned by the source matcher are not published.

## Citation 1

The original verified finding concerned bias and low evidence quality in the underlying trials. The displayed library excerpt is a shorter exact substring of its quotation. It refers specifically to the older-adult review, not the newer trial.

Original research: [Mah and Pitre, 2021](https://pubmed.ncbi.nlm.nih.gov/33865376/), DOI 10.1186/s12906-021-03297-z. The PubMed abstract supports the quality assessment. The [2024 correction](https://pmc.ncbi.nlm.nih.gov/articles/PMC11660779/) was also reviewed: it changes search-reporting details and wording, not the cited evidence-quality assessment. The demo links the correction alongside the original paper.

## Citation 2

The claim sentence is retained from the verified prototype finding. Its displayed passage is the exact library quotation, including the source DOI and study effect size.

Original research: [Schuster et al., 2025](https://pubmed.ncbi.nlm.nih.gov/40918053/), DOI 10.2147/NSS.S524348. Its abstract reports four-week follow-up, adults reporting poor sleep, and a small effect on insomnia questionnaire scores. The demo keeps the population and time limitation visible.

All public example content is educational and explicitly marked prepared/not clinically reviewed. The founder story comes from Rahul's account in this conversation. No personal questions, health records, key material or full-library files are published.
