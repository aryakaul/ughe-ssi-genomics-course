# Lab 6 · Case Study: A Cluster on the Surgical Ward
**Day 2 · 13:15–15:00 · 105 min · Groups of 4**
**Objective:** LO3–LO5 — Combine genomic and epidemiological evidence to decide whether an outbreak is happening, and communicate the decision

> ⚠️ **About this case:** the genomes are **real**: MRSA isolates from a published hospital outbreak investigation. The hospitals, wards, patients and dates are **fictional**, written so the case feels like our setting. The real story is revealed at the end.

---

## The situation
**District Hospital A (fictional)** · Monday, 16 March 2026

The infection prevention and control (IPC) nurse writes to you:

> "Since early February we've had **more MRSA wound infections than usual on Surgical Ward B**. The surgeons say it's bad luck. Theatre staff say it's the ward. The ward says it's the theatre. The hospital director asks whether we should **close Ward B to admissions**. Closing it would cancel about 40 operations a week. The lab stored all MRSA isolates since September, and we got genomes back from our sequencing partner last week. **Can you tell us what's going on by Wednesday's IPC meeting?**"

## Your evidence
1. **Microreact project** from Lab 5 (tree + timeline + metadata), or the `koser_tree.nwk` and `lab6_metadata.csv` files
2. **SNP distance matrix**: `koser_snp_matrix.tsv` (in the shared Galaxy history). Open it in Galaxy (👁) or download it and open it in Excel.
3. **Pathogenwatch results** from Lab 5 (ST and AMR per isolate)
4. **Metadata table** (`lab6_metadata.csv`): patient code, ward, procedure, theatre, surgery date, sample date

---

## Group roles (rotate if time allows)
| Role | Job |
|---|---|
| **Genomics lead** | Reads the tree and SNP matrix |
| **Epidemiologist** | Builds the timeline: who was where, when |
| **Clinician / IPC** | Thinks through transmission routes and actions |
| **Communicator** | Writes and delivers the 5-minute briefing |

---

## Part A — Describe the cases (15 min)
Using the metadata, build an **epidemic curve**: sketch it on paper, with weeks along the x-axis and the number of cases on the y-axis.

| Week starting | Ward B cases | Other ward/hospital cases |
|---|---|---|
| | | |
| | | |

✍️ Questions:
1. How many MRSA isolates in total? How many from Ward B since 1 February?
2. Do **all** Ward B cases look the same from the **lab** report (species + cefoxitin)? Does that mean they are one outbreak?

---

## Part B — What does the genome say? (25 min)

### B1. Sequence types
From Pathogenwatch, list each isolate's ST. Group the isolates by ST.

### B2. SNP distances
Open the SNP matrix. Each cell is the number of single-letter differences between two isolates.

- Highlight all pairs with **≤ 15 SNPs** (a common working threshold for possible recent *S. aureus* transmission; see L4)
- Which isolates form a **cluster** (all closely related to each other)?

| Cluster | Isolates (patient codes) | SNP range within cluster | Closest outside isolate (SNPs) |
|---|---|---|---|
| | | | |

### B3. Tree
In Microreact, colour the tree by **ward**, then by **theatre**. Does the cluster from B2 appear as a tight group on short branches?

---

## Part C — Put genomics and epidemiology together (20 min)
For **each** Ward B case since February, decide:

| Patient | In genomic cluster? | Epi link (ward/theatre/time overlap)? | Conclusion: **linked / not linked / uncertain** |
|---|---|---|---|
| | | | |
| | | | |
| | | | |
| | | | |
| | | | |
| | | | |
| | | | |
| | | | |

✍️ Discussion questions:
1. Is there an outbreak? How confident are you?
2. Is there a Ward B patient who is **not** part of the cluster even though they were on the ward at the same time? What does that tell you?
3. Is there a cluster patient who was **not** on Ward B? What do they have in common with the others? → **What is the likely source or route?**
4. Do any isolates from **other hospitals** belong to the cluster?
5. What **other information** would you want? (e.g. staff screening, environmental swabs, theatre logs)

---

## Part D — Prepare the briefing (25 min)
Prepare a **5-minute briefing** for the IPC committee (director, chief surgeon, nursing lead, lab head). They are **not** genomics experts.

Use this template (one flip-chart page or 3 slides):

> **1. Bottom line (1 sentence):** "We found / did not find evidence of an outbreak of ______ linked to ______."
> **2. What we did:** "We sequenced __ MRSA isolates from __ to __ and compared them genetically."
> **3. What we found:** one visual (screenshot of the Microreact tree + timeline) and 2–3 bullet points
> **4. What this means:** which cases are linked, and the likely route
> **5. Recommendations:** 3 concrete actions, with who does them and by when
> **6. What we don't know yet:** limitations and next steps

**Rules:** no jargon without explanation ("SNP" → "genetic differences"), and no more than **one** figure.

---

## Part E — Briefings (15 min, plenary)
Each group gets **5 minutes** to present to the "IPC committee" (facilitators + one participant group acting as committee members). The committee must ask at least one question:
- *"Should we close Ward B?"*
- *"Is it the surgeons' fault?"*
- *"How sure are you?"*
- *"What will this cost?"*

---

## The reveal (facilitator, 5 min)
The genomes come from **Köser et al., *N Engl J Med* 2012**: an investigation of a suspected MRSA outbreak in a **special care baby unit** (neonatal unit) in Cambridge, UK. Rapid whole-genome sequencing distinguished the outbreak isolates from unrelated MRSA that looked identical on routine lab tests, and showed transmission that conventional methods had not resolved. A follow-up study (Harris et al., *Lancet Infect Dis* 2013) used genomics to trace transmission into the community and identify a **staff carrier**, which ended the outbreak.

**Take-home messages:**
1. **Same species + same antibiogram ≠ same outbreak.** Genomics separates linked from unlinked cases.
2. **Genomics finds hidden links** (shared theatre, staff, equipment) that ward-based thinking misses.
3. **Genomics can prevent unnecessary actions** (closing a ward) as well as trigger necessary ones.
4. Genomic results are only useful **with good metadata** and **clear communication**.

---
*Genomic data: ENA project PRJEB2912 (Köser et al. 2012). Scenario metadata are fictional and created for teaching.*
