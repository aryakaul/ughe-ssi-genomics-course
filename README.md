# Genomic Surveillance of Surgical Site Infections & Antimicrobial Resistance
### A 2-day faculty course — University of Global Health Equity (UGHE)

## Participants: where to find your files
- **Lab handouts (PDF):** [`labs/pdf/`](labs/pdf/)
- **All slides for each day, in order:** [Day 1](slides/pdf/Day1.pdf) · [Day 2](slides/pdf/Day2.pdf)
- **Single lectures and labs (PDF):** [`slides/pdf/`](slides/pdf/) · [`labs/slides/pdf/`](labs/slides/pdf/)
- **Data for Labs 5–6:** [`labs/data/`](labs/data/)
- **Everything at once:** green **Code** button → **Download ZIP**

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
slides/                     Lecture outlines (L1–L5, .md) with speaker notes,
                            slide sources (.typ) and PDFs in slides/pdf/
labs/                       Step-by-step hands-on handouts (Lab 1–6, .md);
                            handout PDFs in labs/pdf/
labs/slides/                Lab slide sources (.typ); PDFs in labs/slides/pdf/
resources/                  Glossary, further learning, instructor guide,
                            trainee team guide + troubleshooting log
build_slides.sh             Rebuilds every slide PDF (needs Typst)
build_handouts.sh           Rebuilds the handout PDFs (needs pandoc + Typst)
```

## How to use these materials
1. **Instructor:** read `resources/instructor_guide.md` first, then do the **dry run** described there at least one week before the course.
2. Send `00_pre-course/setup_checklist.md` to participants **two weeks** before the course.
3. Present each day from one file: `slides/pdf/Day1.pdf` and `slides/pdf/Day2.pdf` (every lecture, lab, break and logistics slide in timetable order; built from `slides/Day1.typ` / `Day2.typ`, which include the individual decks). Single lecture decks are also in `slides/pdf/`. Speaker notes and figure ideas are in the matching `slides/*.md` outline.
4. Print the handouts from `labs/pdf/` and `resources/glossary.md` for each participant, **and** share the handout PDFs digitally: participants copy reads, URLs and commands from them. After editing a handout, run `./build_handouts.sh` (needs `brew install pandoc typst`).
5. Project `labs/slides/pdf/LabN_*.pdf` during each lab. They show the plan, the key settings, the "Check yourself" questions and the swap points; the handout keeps the full steps.
6. **Editing slides:** change the `.typ` file next to the outline or handout, then run `./build_slides.sh` (needs Typst: `brew install typst`). Keep slides simple: one idea per slide, short phrases, large text. If the script warns that a slide overflowed, split it rather than shrinking the text.

## Ownership, trainees & contributing
These materials are **jointly owned by the University of Global Health Equity (UGHE) and Harvard Medical School (HMS)**. They were developed under a planning grant that commits to *"shared UGHE–HMS ownership and trainee involvement in literature reviews, workshop documentation and the needs-assessment process."*

Each cohort includes a **trainee team** from both institutions. Trainees take the course, keep the literature review current, document what actually happens in the workshop, and analyse workshop needs data. They update these materials through GitHub pull requests, reviewed by a UGHE and an HMS maintainer. See `resources/trainee_team_guide.md`.

### Contributors
| Cohort | Name | Institution | Workstream / role |
|---|---|---|---|
| *November 2026* | *(to be added after the documentation sprint)* | | |

## Licence & attribution
Labs adapt material from the **Galaxy Training Network** and **The Carpentries** (both CC-BY 4.0). Please keep the attributions in each handout. Original content © UGHE and HMS contributors, reusable under CC-BY 4.0.
