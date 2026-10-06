# L5 · Building a Sustainable Genomic Surveillance Programme
**Day 2 · 15:15–16:00 · 45 min (≈ 25 min talk + 20 min discussion)**
**Objective:** LO6 — Design a sustainable, outsourced genomic surveillance workflow for your own setting

---

### Slide 1 — What we can do on Monday
- We now know the full pathway: **collect → store → send → analyse → act**
- No sequencer is needed to start. What we need is **a plan, stored isolates, good metadata, a partner, and people who can analyse the data**.

### Slide 2 — Choose a surveillance question first
| Question type | Example | What to sequence |
|---|---|---|
| **Outbreak investigation** (reactive) | "Is this ward cluster one strain?" | All cluster isolates + a few unrelated controls |
| **Routine surveillance** (proactive) | "Which ESBL/carbapenemase genes cause SSIs in our hospitals?" | Systematic sample, e.g. all resistant SSI isolates for 6 months |
| **Research** | "Are post-caesarean SSI *E. coli* from the community or the hospital?" | Designed sample with matched community isolates |
- *Speaker note:* Start small. 50–100 well-chosen isolates with complete metadata beat 1,000 random ones.

### Slide 3 — Sampling & biobanking
- Store **every** SSI isolate with resistance of interest (at least ESBL, carbapenem-resistant, MRSA)
- −80 °C freezer, or glycerol stocks; a backup at a second site if possible
- Track it with a simple **isolate register** (spreadsheet): study ID, organism, date, ward, specimen, AST, freezer location
- Agree on labelling **before** you start

### Slide 4 — Metadata & data management
- Use a template aligned with **PHA4GE** fields
- Coded IDs only: keep the linking key (ID → patient) secure and separate
- File-naming convention: `UGHE-SSI-0001_R1.fastq.gz`
- Back up raw data in two places; raw reads are irreplaceable
- Galaxy histories are a free, reproducible record of every analysis

### Slide 5 — Ethics, consent & data sharing
- Isolate sequencing for surveillance and IPC is usually covered by routine public-health practice. **Research** needs IRB/ethics approval (e.g. Rwanda National Ethics Committee and the institutional IRB).
- Material transfer agreements (MTAs) are needed when sending isolates abroad. Data-sharing agreements should state who owns the data and how it is published.
- Share genomes publicly (**ENA / NCBI SRA**) with non-identifying metadata: it helps the region and is often required by journals and funders
- **Equity:** local investigators should lead analysis and authorship

### Slide 6 — Partners in the region
- **Rwanda Biomedical Centre (RBC)** / National Reference Laboratory
- **Africa CDC Pathogen Genomics Initiative (PGI)**: regional sequencing and training network
- **ASLM** (African Society for Laboratory Medicine): AMR surveillance programmes such as MAAP
- **Academic and NGO collaborators**: university genomics cores, Fleming Fund–supported projects
- **Commercial services**: per-isolate pricing, useful for small projects
- *Speaker note:* Ask the room which of these partners we already have relationships with.

### Slide 7 — Reporting results so they change practice
- Audience-specific outputs:
  - **Clinicians:** "This isolate carries an NDM carbapenemase. Avoid carbapenems; consult ID."
  - **IPC committee:** cluster summary, tree, timeline, recommended actions
  - **Ministry / RBC:** quarterly summary of resistance genes and clones
- Use simple visuals (Microreact) and a one-page template
- Close the loop: did the action reduce SSIs?

### Slide 8 — People: keeping the skills alive
- Identify **2–3 "genomics champions"** per department
- Monthly **data clinic / journal club** for course graduates
- Self-paced learning: Galaxy Training Network, The Carpentries, Africa CDC / Africa PGI training, Wellcome Connecting Science (see `resources/further_learning.md`)
- Build genomics into **student teaching** (MGHD, MBBS research projects)

### Slide 9 — Funding
- Embed sequencing costs in grants (AMR, surgery, maternal health)
- Funders active in AMR and genomics in Africa: Fleming Fund, Wellcome, Gates Foundation, Africa CDC, NIH/Fogarty, EDCTP
- Budget per isolate: sequencing + shipping + staff time + data storage

### Slide 10 — Action plan template (used in the next session)
> **My one-page genomic surveillance plan**
> 1. **Question:** What do I want to know?
> 2. **Isolates:** Which, how many, from where, over what time? Are they already stored?
> 3. **Metadata:** Which fields? Who collects them? Where are they stored?
> 4. **Sequencing partner:** Who? Which platform? Cost? Timeline?
> 5. **Analysis:** Which tools from this course? Who will do it?
> 6. **Ethics & agreements:** IRB? MTA? Data sharing?
> 7. **Action & communication:** Who receives the results, in what format?
> 8. **First step next week:** ______________________

### Discussion (20 min, small groups → plenary)
1. What is the single biggest barrier to starting genomic surveillance at our institution? How could we overcome it?
2. Which question from Slide 2 would be most valuable to answer first?
