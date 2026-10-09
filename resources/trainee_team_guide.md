# Trainee Team Guide
### Literature review · Workshop documentation · Needs assessment

*For trainees (e.g. research assistants, junior faculty, MGHD and medical students at UGHE, and students or postdocs at HMS) who contribute to the planning grant's three workstreams. Trainee team members also take the workshop as participants.*

---

## Grant alignment
This guide puts the following planning-grant commitment into practice:

> *"The proposal envisages shared UGHE–HMS ownership and trainee involvement in literature reviews, workshop documentation and the needs-assessment process."*

| Commitment | How it is met | Section |
|---|---|---|
| **Shared UGHE–HMS ownership** | Co-leads from both institutions; joint trainee team; co-maintained repository; joint credit and authorship | §1 |
| **Trainee involvement in literature reviews** | Trainees maintain a living literature review and the course reading list, and present updates at the monthly journal club | §3 |
| **Trainee involvement in workshop documentation** | Trainees join the dry run, document the workshop, and release updated materials after a documentation sprint | §4 |
| **Trainee involvement in the needs assessment** | Trainees support interview analysis (under the approved protocol) and analyse workshop needs data: survey, action plans and evaluations | §5 |

Report progress on each row in grant updates. §7 lists the evidence to keep for each.

---

## 1. Shared UGHE–HMS ownership
- **Co-leadership:** the workshop and the trainee team are co-led by **one UGHE lead and one HMS lead**. Decisions about the materials (what changes, what is released) are made jointly at the documentation sprint.
- **Joint trainee team:** aim for trainees from **both** institutions. HMS trainees can contribute remotely to the literature review, to reviewing GitHub pull requests, and to analysing workshop data.
- **Mentoring:** each trainee has a named mentor. Where possible, pair UGHE trainees with HMS mentors and vice versa for at least one workstream.
- **Repository:** the course materials should be co-maintained, with at least one maintainer from each institution. *Recommended:* move the repository from a personal account to a shared GitHub organisation (e.g. "ughe-hms-genomics") so ownership doesn't depend on one person.
- **Licence and credit:** materials are released under CC-BY 4.0 as "© UGHE and HMS contributors". Outputs (cohort report, literature review updates, any papers) carry joint UGHE–HMS authorship following standard authorship criteria.

## 2. Team, roles and time
- **Team size:** 4–6 trainees, plus a **trainee lead** who coordinates the workstreams
- Each trainee takes **one primary workstream** (§3–§5) and helps with workshop documentation during the course
- **Time commitment:**

| When | What | Time |
|---|---|---|
| Before the course | Literature review tasks (§3); onboarding + facilitator dry run (§4) | ~1 day in total |
| Course days | Take part in all labs; document 1–2 assigned labs; daily huddle | 2 days + 20 min/day |
| ≤ 2 weeks after | Documentation sprint (§4); workshop needs-data analysis (§5) | ~1 day |
| Ongoing (optional) | Quarterly literature update; monthly journal club / data clinic | ~2 h/month |

---

## 3. Workstream 1: Literature review
The grant's literature review (October 2026) summarises the evidence on AMR, SSIs in Rwanda, and genomic surveillance. Trainees keep it current and connect it to the course.

**Tasks**
1. **Annotated reading list (before the course):** each trainee summarises 1–2 key papers in 3–4 plain-language sentences for participants. Use the background references in `00_pre-course/datasets.md`.
2. **Quarterly literature update:** re-run the saved searches below in Europe PMC (https://europepmc.org). Screen new results and add relevant studies to `00_pre-course/datasets.md` → *Background references*, with a 1-line summary.
3. **Journal club:** present one new paper at the monthly journal club / data clinic.
4. **Check numbers before reuse:** when a figure from a paper goes into slides or a report, confirm it against the abstract or full text and note where it came from.

**Saved searches** (used for the October 2026 review; paste each into the Europe PMC search box)
```
(Rwanda) AND ("surgical site infection") AND (sequencing OR genomic)
TITLE_ABS:"Rwanda" AND ("whole genome sequencing" OR "whole-genome sequencing" OR "genome sequencing") AND (hospital OR clinical OR patients) AND (resistance OR resistant)
(Rwanda) AND ("whole genome sequencing" OR genomic) AND (resistance) AND (Klebsiella OR "Escherichia coli" OR Staphylococcus OR Enterobacterales)
```
Record each run in a short log: date, search, number of hits, number of new relevant papers, and who screened.

**Key gap to watch:** as of October 2026 we found **no published genomic study of SSI isolates from Rwanda**. Flag immediately if one appears.

---

## 4. Workstream 2: Workshop documentation
Course materials stay accurate only if someone records what *actually* happens: Galaxy menus change, tools get new versions, and real participants hit errors no handout anticipated.

### Roles during the workshop
Everyone is a **participant first**. Each trainee documents **one or two labs** and takes part fully in the rest.

| Role | Responsibility | Output |
|---|---|---|
| **Lab scribe** (one per lab) | Follow the handout alongside participants; note every step that differs from the handout, every error and its fix, and actual timings | Lab log (template A) |
| **Troubleshooting logger** | Collect problems from helpers during labs | Rows in `troubleshooting_log.csv` |
| **FAQ curator** | Capture participant questions and the answers given | FAQ entries (template C) |
| **Screenshot lead** | Capture current screens to replace handout placeholders | Images named `labN_stepX.png` |
| **Language lead** (optional) | Collect Kinyarwanda equivalents for key terms; note confusing wording | Additions to `resources/glossary.md` |

**Suggested allocation for 5 trainees:**

| Trainee | Day 1 | Day 2 |
|---|---|---|
| 1 (lead) | Lab 1 scribe | Lab 6 scribe |
| 2 | Lab 2 scribe | FAQ curator |
| 3 | Lab 3 scribe | Lab 5 scribe |
| 4 | Troubleshooting logger | Lab 4 scribe |
| 5 | Screenshot lead | Screenshot lead |

### Before: onboarding and dry run (½ day, ~1 week before)
1. **Onboarding (1 h):**
   - Read this guide
   - Agree on roles
   - Create GitHub accounts and get added to the course repo
   - Go through the templates below
2. **Dry run (3 h):** join the facilitator dry run (`resources/facilitator_guide.md` §2)
   - Each scribe runs **their** lab end-to-end
   - Log baseline timings and every mismatch with the handout
   - Facilitators fix the handouts *before* the course where possible
3. **Set up** a shared folder (or `docs/cohort-YYYY-MM/` in the repo) for logs and screenshots

### During
- Sit with a pair of participants and follow along. Write things down as they happen.
- **Don't fix handouts live.** Just record; changes happen in the sprint, where they can be checked.
- **Privacy:** no participant names in logs or screenshots. Crop out user names and emails.
- **Daily huddle (17:00–17:20, trainee team + leads):**
  1. Top 3 problems today
  2. Any urgent fixes for tomorrow's handouts
  3. Check that logs and screenshots are saved

### After: documentation sprint (½ day, within 2 weeks)
Goal: release an improved version of the materials, e.g. **v1.1 – November 2026 cohort**.

| Step | Who | Time |
|---|---|---|
| Review lab logs, troubleshooting log and FAQ entries; agree on changes | Trainee team + both leads | 45 min |
| Update handouts: fix steps, add screenshots, add "Common problems" boxes | Each scribe, their lab | 90 min |
| Move recurring issues into the facilitator guide; add a FAQ section | Troubleshooting logger + FAQ curator | 45 min |
| Submit GitHub pull requests; a lead from each institution reviews and merges | Each trainee / leads | 30 min |

> **Learning GitHub:** for most trainees this will be their first pull request. The GitHub web interface ("Edit this file" → "Propose changes") is enough; no command line is needed. Pair each person with someone experienced for their first one.

---

## 5. Workstream 3: Needs assessment
The grant's needs assessment asks what Butaro and UGHE need for sustainable genomic surveillance. Trainees contribute in two ways.

### 5a. Stakeholder interviews (with surgeons, health workers and lab staff)
Under PI supervision, trainees can help with:
- checking transcripts and translations against recordings for accuracy
- **thematic coding** of transcripts with an agreed codebook, with double-coding of a subset to check agreement
- summarising themes for the needs-assessment report

> ⚠️ **Ethics first.** Before a trainee handles interview data, confirm they are **listed on the approved study protocol** (or an amendment is approved) and have completed **human-subjects research training**. Work only with de-identified transcripts, on approved storage.

### 5b. Workshop needs data
The workshop itself generates needs-assessment evidence about training and capacity. Trainees collect and analyse it:

| Source | What it tells us | Trainee task |
|---|---|---|
| **Pre-course questionnaire** (needs section of `00_pre-course/pre-assessment.md`) | Participants' roles, current access to lab and data resources, biggest barriers | Administer; tabulate responses |
| **Pre/post quiz and self-ratings** | Knowledge and confidence gained, and what remains hard | Summarise with the facilitators |
| **One-page action plans** (L5) | Which surveillance questions participants want to answer, and the barriers they foresee | Code recurring needs and barriers |
| **Exit tickets and course evaluation** | What was unclear; what further training is wanted | Group into themes |

**Output:** a 1–2 page *Workshop needs summary* that feeds into the grant's needs-assessment report, written jointly by a UGHE and an HMS trainee.

> Workshop data are anonymous and collected for course improvement and programme planning. If they will be **published** (e.g. in a paper) rather than used in internal and grant reports, check with the IRB whether approval or an exemption is needed **before** the workshop.

---

## 6. Quality checklist for any change to the materials
- [ ] Every step tested on the current version of Galaxy or the web tool
- [ ] Tool names and versions match what is on screen
- [ ] Screenshots recent, cropped and free of personal information
- [ ] Plain language; new terms added to the glossary
- [ ] Figures and citations checked against their source
- [ ] Reviewed by a lead before merging

## 7. Recognition and evidence for grant reporting
**Recognition**
- Named as **contributors** in the course `README.md`, with cohort, institution and workstream
- **Certificate of contribution** in addition to the participation certificate
- Joint UGHE–HMS **authorship** on the cohort report, the workshop needs summary, and any education or surveillance paper that uses this work
- First option to serve as **helpers or co-facilitators** at future cohorts, where funding allows

**Evidence to keep for grant reports**

| Workstream | Evidence |
|---|---|
| Shared ownership | List of co-leads, mentors and maintainers by institution; repo contributors |
| Literature review | Search log; annotated reading list; journal club presentations |
| Workshop documentation | Lab logs, troubleshooting log, merged pull requests, release notes, cohort report |
| Needs assessment | Trainee roles on the protocol; coding log; workshop needs summary |

---

## Templates

### A. Lab log (one per lab)
```
Lab: ____    Scribe: ____    Date: ____    Galaxy server: usegalaxy.eu
Planned time: ___ min    Actual time: ___ min (first pair finished at ___ / last pair at ___)

Step | What the handout says | What actually happened | Fix / suggestion
-----|-----------------------|------------------------|-----------------
C3   | ...                   | ...                    | ...

Tool versions seen on screen: ____________________
Steps where most participants got stuck: ____________________
Questions participants asked: ____________________
Screenshots taken (file names): ____________________
```

### B. Troubleshooting log
One row per problem in `resources/troubleshooting_log.csv`.

### C. FAQ entry
```
Q: (the participant's question, in their words)
A: (the answer given, checked by a facilitator)
Lab / topic: ____    Asked by how many people: ____
```

### D. Cohort report outline (1–2 pages)
1. Cohort details: dates, number of participants, roles, institutions
2. What worked well
3. Top problems and how they were fixed
4. Changes made in this release (link to the GitHub release or pull requests)
5. Pre/post quiz summary
6. Recommendations for the next cohort
7. Contributors (by institution and workstream)
