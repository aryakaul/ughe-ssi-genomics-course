# L4 · Typing, Trees and Outbreaks
**Day 2 · 10:45–11:30 · 45 min**
**Objective:** LO5 — Type isolates and interpret a phylogeny to support or rule out an outbreak

---

### Slide 1 — The core question
- "We have had 5 *Klebsiella* SSIs on Ward B in 6 weeks. **Is this an outbreak?**"
- An outbreak means **transmission**: the same strain passing between patients (directly, via staff, equipment or the environment)
- Same species ≠ same strain. Same AST pattern ≠ same strain.

### Slide 2 — Typing: giving bacteria names at different resolutions
| Method | Resolution | Analogy | Use |
|---|---|---|---|
| Species | Very coarse | Country | Clinical ID |
| **MLST** (7 genes) → "ST" | Coarse | City | Is it a known high-risk clone? (e.g. *K. pneumoniae* ST258, ST307; MRSA ST8, ST22) |
| **cgMLST** (~1,000–3,000 genes) | Fine | Street | Clustering within an ST |
| **SNPs** (single letters across the genome) | Finest | House number | Outbreak and transmission |
- *Figure idea:* zoom-in map analogy

### Slide 3 — MLST in one slide
- Seven "housekeeping" genes are sequenced; each version (allele) gets a number
- The combination of 7 numbers gives the **Sequence Type (ST)**
- For *K. pneumoniae* the 7 genes are *gapA, infB, mdh, pgi, phoE, rpoB, tonB*. The allele numbers are looked up in the BIGSdb-Pasteur database, which returns the ST.
- You never do this by hand: the `mlst` tool (Lab 4) and Pathogenwatch (Lab 5) do it automatically
- Same ST = possibly related. **Different ST = not a recent outbreak.**

### Slide 4 — SNP distances
- Align genomes to a reference, then count positions where they differ
- **Few SNPs** → recently shared ancestor → possibly linked transmission
- **Many SNPs** → not recent transmission
- Approximate rules of thumb (they vary by species and study):
  - *S. aureus*: ≤ ~15–25 SNPs suggests possible transmission
  - *K. pneumoniae* / *E. coli*: ≤ ~10–25 SNPs is often used
- **Thresholds are guides, not laws.** Always combine them with epidemiology.

### Slide 5 — Reading a phylogenetic tree
- **Tips (leaves)** = isolates
- **Branch length** = genetic change (often SNPs)
- **Clade** = a group sharing a common ancestor
- Isolates that cluster tightly on short branches are closely related
- Common mistakes:
  - Reading tip order top-to-bottom as meaningful (it isn't; branches can rotate)
  - Ignoring the **scale bar**
- *Figure idea:* a 10-tip tree with one tight 4-isolate cluster. Ask "which are the outbreak isolates?"

### Slide 6 — Time, place and person: genomics + epidemiology
- A genomic cluster is only an outbreak if the **epidemiology fits**:
  - Were the patients on the same ward or in the same theatre at overlapping times?
  - The same surgeon, procedure, equipment, or staff?
- Genomics can:
  - **Confirm** a suspected outbreak (same strain, few SNPs, overlapping stays)
  - **Refute** one (different STs, so no need to close the ward)
  - **Find hidden links** (cases on different wards linked through shared equipment)

### Slide 7 — Strain outbreak vs plasmid outbreak
- **Strain outbreak:** the same clone in many patients (tree shows one tight cluster)
- **Plasmid outbreak:** *different* strains or species, but the **same resistance plasmid**
  - The tree shows unrelated isolates, yet they all carry the same carbapenemase on the same plasmid
  - Needs long-read (Nanopore) or hybrid data to confirm
- Message: if the tree says "unrelated" but the resistance is unusual and identical, think **plasmid**.

### Slide 8 — Worked example (3 scenarios, vote with cards A/B/C)
1. 4 MRSA, all ST22, 2–5 SNPs apart, same ward over 3 weeks → **likely outbreak**
2. 4 *Klebsiella*, ST15, ST307, ST14, ST101 → **not a single-strain outbreak** (check for a shared plasmid?)
3. 3 *E. coli*, all ST131, 80–150 SNPs apart, 3 different hospitals → **common circulating clone, not recent transmission**

### Slide 9 — From result to action
| Finding | Possible IPC action |
|---|---|
| Confirmed cluster | Enhanced cleaning, cohorting, contact screening, audit of theatre practice, staff screening if indicated |
| Refuted cluster | Avoid unnecessary ward closure; look at other causes (e.g. surgical prophylaxis timing) |
| High-risk clone or new carbapenemase | Notify the national reference lab / public-health authority |
- Communicate results in **plain language** to clinicians and managers (practised in Lab 6)

### Slide 10 — Tools for the next lab
- **Pathogenwatch**: upload assemblies → species, ST, AMR, cgMLST clustering, tree
- **Microreact**: tree + map + timeline + metadata in one interactive view
- Both are free, used by national public-health labs, and need **no coding**
