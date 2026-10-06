# Genomic Surveillance of Surgical Site Infections & Antimicrobial Resistance
### A 2-day faculty course — University of Global Health Equity (UGHE)

## Why this course exists
Surgical site infections (SSIs) are among the most common healthcare-associated infections in low- and middle-income countries, and more and more of them are caused by antibiotic-resistant bacteria. Whole-genome sequencing (WGS) can answer questions that culture and susceptibility testing alone cannot:

- *Which resistance genes does this isolate carry, and are they on mobile plasmids?*
- *Are these five infections on the surgical ward one outbreak or five unrelated events?*
- *Is a high-risk resistant clone spreading between hospitals?*

**You do not need a sequencer to do genomic surveillance.** Isolates can be sent to a reference lab or a sequencing service. The skills that stay with an institution are knowing **what to sequence, how to analyse the data, and how to act on the results**. That is what this course teaches.

## Who it's for
UGHE faculty (clinicians, nurses, microbiologists, public-health and IPC staff). **No coding experience is assumed.** About half the course is hands-on, and the first day spends a lot of time on the basics (files, formats, Galaxy).

## How the course is built
| Layer | Tool | Why |
|---|---|---|
| Main analysis | **Galaxy** (usegalaxy.org / usegalaxy.eu) | Free, browser-based, nothing to install, reproducible; lifelong self-study through the Galaxy Training Network |
| Interpretation | **Pathogenwatch, Microreact, ResFinder, CARD, PubMLST** | Free web tools that public-health labs use worldwide |
| Literacy | **Command line taster** | So participants know what is "under the hood" and have a clear next step |

Both **Illumina** (short-read) and **Oxford Nanopore** (long-read) data are analysed side by side, because a sequencing partner might use either.

## Folder contents
```
syllabus.md                 Full 2-day schedule, objectives, assessment  ← start here
00_pre-course/              Setup checklist, datasets, pre/post quiz
slides/                     Lecture outlines (L1–L5) with speaker notes
labs/                       Step-by-step hands-on handouts (Lab 1–6)
resources/                  Glossary, further learning, facilitator guide
```

## How to use these materials
1. **Facilitators:** read `resources/facilitator_guide.md` first, then do the **dry run** described there at least one week before the course.
2. Send `00_pre-course/setup_checklist.md` to participants **two weeks** before the course.
3. Convert the `slides/*.md` outlines into your slide software of choice. Each outline lists slide titles, key points, speaker notes and suggested figures.
4. Print `labs/*.md` and `resources/glossary.md` for each participant, or share them as PDFs.

## Licence & attribution
Labs adapt material from the **Galaxy Training Network** and **The Carpentries** (both CC-BY 4.0). Please keep the attributions in each handout. UGHE-authored content may be reused under CC-BY 4.0.
