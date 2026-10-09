# Facilitator Guide
*Read this first. It covers the dry run, building the pre-computed history, mapping the case-study metadata, timing, troubleshooting and answer keys.*

---

## 1. Teaching team & principles
- **Co-leads from UGHE and HMS** (lectures + live demos, shared between them) and **≥ 1 helper per 6 participants** for labs
- **Trainee team** (4–6 trainees from UGHE and HMS): participants who also contribute to the literature review, workshop documentation and needs assessment, as committed in the planning grant. Each has a named mentor. See `resources/trainee_team_guide.md`. Treat them as colleagues: they join the dry run, can help during labs, and their logs drive the next version of the materials.
- Helpers use **sticky notes**: participants put a **red** note on their laptop lid when stuck and a **green** one when finished (Carpentries practice)
- **Live-code / live-click:** the instructor does each step on the projector *at participant pace*. Don't show slides of screenshots.
- **Pair programming:** driver/navigator; swap at the points marked in each lab
- Expect beginners to need **~25% more time** than the timings suggest. Every lab has optional "extension" tasks for fast pairs and a fallback (pre-computed results) for slow ones.
- It is normal for Galaxy jobs to queue. Use the waiting time to discuss interpretation.

---

## 2. Dry run (≥ 1 week before the course): REQUIRED
Do the whole course yourself on **usegalaxy.eu** with the participants' setup (venue Wi-Fi if possible). Record actual run times.

**Run the dry run together with the trainee team.** Each lab scribe runs their assigned lab end-to-end and fills in a lab log (template A in the trainee team guide). Fix handout errors they find *before* the course.

| Check | Done |
|---|---|
| All URLs in `00_pre-course/datasets.md` still resolve | ☐ |
| Lab 1 complete; tool names match the current Galaxy interface | ☐ |
| Lab 2 Illumina: Shovill run time = ____ min | ☐ |
| Lab 2 Nanopore: Flye run time = ____ min | ☐ |
| Lab 3: JupyterLab interactive tool starts in < 3 min; `wget` works from inside it | ☐ |
| Lab 4: record the MLST ST, AMRFinderPlus and staramr gene lists (→ answer key §6) | ☐ |
| Lab 4: fill in the blank AST cells (see §4) | ☐ |
| Pre-computed history built (§3) and shared by link | ☐ |
| Lab 6 metadata mapped (§4) and tested in Microreact | ☐ |
| Pathogenwatch upload of the 14 assemblies tested; time = ____ min | ☐ |
| USB offline packs made | ☐ |

---

## 3. Building the shared pre-computed history
Create a history named **`UGHE-SSI course – precomputed`**. When finished: **History options → Share & manage access → Make accessible via link**, and put the link on the course page/slides.

### 3a. Lab 2 fallbacks
Run Lab 2 (both tracks) yourself and keep: the fastp reports, the **Shovill contigs**, the **Flye assembly**, and both **QUAST** reports.

### 3b. Köser outbreak genomes (Labs 5–6)
1. **Get the reads.** Tool **"Faster Download and Extract Reads in FASTQ"** (fasterq-dump). Paste the 14 run accessions, one per line:
   ```
   ERR101899
   ERR101900
   ERR103394
   ERR103395
   ERR103396
   ERR103397
   ERR103398
   ERR103400
   ERR103401
   ERR103402
   ERR103403
   ERR103404
   ERR103405
   ERR159680
   ```
   The output is a **paired collection**.
   - *Optional:* relabel the collection elements to the sample names (`MRSA_10C` …) with **Relabel identifiers**, using the run → sample table in `datasets.md`. Whatever names you choose become the **tree tip labels** and the **`id`** values in the metadata.
2. **fastp** on the paired collection (defaults)
3. **Shovill** on the fastp output collection (defaults) → 14 assemblies. Download them as a zip (`assemblies/`) for Pathogenwatch.
4. **Choose a reference:** run **QUAST** on the assemblies and pick the one with the **fewest contigs** as an internal reference. *(Alternatively, use a published ST22 EMRSA-15 reference genome. Verify the accession before using it.)*
5. **Snippy** (collection mode) → reads: fastp collection; reference: the chosen assembly
6. **snippy-core** on all the Snippy outputs → core alignment
7. **IQ-TREE** on the core alignment (defaults or GTR+G). Save the tree as `koser_tree.nwk`.
8. **snp-dists** on the core alignment → `koser_snp_matrix.tsv`
9. **Check:** open the tree in Microreact. Tip labels must **exactly** match the `id` column you will use in §4.

> ⏱ Expect several hours of Galaxy compute in total. Start **at least 3 days** before the dry-run deadline.

---

## 4. Mapping the Lab 6 scenario metadata (`labs/Lab6_metadata_template.csv`)
The template has **fictional** patient profiles:
- **A1–A8: outbreak-cluster profile.** Surgical Ward B (and one Maternity patient, **A4**), all operated in **Theatre 2**, Feb–Mar 2026
- **B1–B8: background profile.** Different hospitals, wards, times, plus **B1**: *same ward and same time* but Theatre 1

**Procedure**
1. From the tree and SNP matrix (§3b), identify the **tight cluster** (pairwise SNPs small, e.g. ≤ ~15–20). Cross-check it with the outbreak isolates described in **Köser et al. 2012**.
   - ⚠️ **Do not** infer cluster membership from the B/C suffix in the sample names.
2. Assign **A-profiles** to the cluster isolates (A1 = the earliest; always include **A4**, the hidden theatre link). Assign **B-profiles** to non-cluster isolates.
   - Put **B1** on a non-cluster isolate, ideally the **same ST** as the cluster but with many SNPs. This is the key teaching point: *same ward, same time, same antibiogram, but not linked*.
3. Replace `FILL_IN` with each isolate's ID (must match the tree tips). **Delete unused profile rows.**
4. Delete the `profile` and `notes` columns from the participant copy, and save it as `lab6_metadata.csv`
5. Test in Microreact: upload `lab6_metadata.csv` + `koser_tree.nwk` and check that `id` links and `year/month/day` (= **specimen collection date**) build the timeline
6. Write your mapping (isolate → profile) in §6 below for the answer key

### Lab 4 AST blanks
After running Lab 4 yourself, fill in the blank AST cells (erythromycin, ciprofloxacin, tetracycline) in `labs/Lab4_species_typing_amr.md`:
- Make most cells **agree** with the genotype
- The gentamicin row is already set to **S** while the genome is expected to carry *aac(6')-aph(2'')*. That is the deliberate **disagreement**. Keep it (or add another one).

---

## 5. Timing & troubleshooting
| Problem | Fix |
|---|---|
| Dataset turns **red** | Click it → 🐞 (view error). The most common cause is the **wrong datatype**: pencil ✏️ → Datatypes → fix → re-run |
| Tool doesn't offer my file as input | The datatype is wrong (e.g. `fastqsanger.bz2` vs `fastqsanger.gz`). Change it with the pencil icon. |
| Upload from URL stuck grey | Galaxy is busy. Wait 5 min. If the Zenodo link fails, use the USB copy and upload from the laptop. |
| Shovill/Flye still running at the deadline | Import the pre-computed result (Lab 2, Part E) and continue. The job keeps running. |
| Galaxy very slow for everyone | Switch the whole class to the pre-computed history; demo the remaining tools on the projector |
| JupyterLab won't start | Use the laptop's Terminal / Git Bash, or the MyBinder link on the GTN "CLI basics" page; run Lab 3 as a projected demo if needed |
| Pathogenwatch upload slow | Upload a subset (6–8 assemblies) per pair; the instructor shows the full collection |
| Microreact "no matching IDs" | The tree tip labels and the CSV `id` column differ. Check for `.fasta` suffixes, underscores or spaces. |
| Internet down | USB packs: handouts, pre-computed outputs (HTML reports, tables, tree screenshots). Switch labs to "interpret the outputs" mode. |

**Places to compress if you are running late:** drop Lab 2 Part H (merge it into the plenary), Lab 3 Part C4, Lab 4 Part B2 (Kraken2), and Lab 6 Part E (fewer briefings, e.g. 3 groups).

---

## 6. Answer keys

### Lab 1
- **A:** Read 2 of the paired-end Illumina reads for isolate UGHE-SSI-0042, compressed
- **B1:** 2 sequences; 120 + 60 = **180** bases
- **B2:** The **end** of read 4 is poor (`#`, `$`, `%`, `&` ≈ Q2–5) → **trim** it
- **C4:** 16 lines = **4 reads**
- **C5:** Quality falls towards the end of the reads. No, 4 reads is far too few to trust; a real isolate has hundreds of thousands to millions of reads.

### Lab 2
- **A:** Illumina is **paired-end** (both ends of each fragment are read → R1 + R2). Nanopore reads each molecule once → one file.
- **F:** Coverage = total bases ÷ ~2.8 Mb. *Record the values from the dry run here:* Illumina ____×, Nanopore ____×
- **G1:** 5.6 Mb ≈ **two** *S. aureus* genomes → probably a **mixed culture/contamination**; do not use it
- **G2:** Accept if the total length is ≈ 2.7–3.0 Mb, GC ≈ 33%, and there is a reasonable number of contigs
- **H:** Nanopore gives fewer, longer contigs (often a near-complete chromosome). Illumina is historically more accurate per base. Nanopore or hybrid is better for plasmids. Hybrid assembly = **complete and accurate**.

### Lab 3
- **C2:** 2 reads (8 lines ÷ 4)
- **C3.1:** Lines ÷ 4 = number of reads; this should equal FastQC "Total sequences" for R1
- **C3.2:** `@` is also a quality symbol (**Q31**), so a **quality line** can start with `@` and would be counted as a read
- **D1:** It counts header lines (`>`), one per sequence = **number of contigs**
- **D2:** It may be **higher** than QUAST's # contigs, because QUAST by default only counts contigs ≥ 500 bp

### Lab 4 (dataset `DRR187559_contigs.fasta`)
- **B1:** The scheme is **`saureus`** → *S. aureus*. ST = ____ *(record during the dry run)*
- **C1:** **`mecA`** → methicillin resistance (MRSA)
- **C2:** Tools use different databases, versions and identity/coverage thresholds; AMRFinderPlus also detects species-specific point mutations
- **C3:** staramr predicted phenotype: ____ *(record)*
- **D (from the GTN tutorial using this exact assembly):** **5 plasmid replicons** and **7 resistance genes**. **4 of the 7** resistance genes are on contigs that also carry plasmid genes (contig00002, contig00019, contig00024). *aac(6')-aph(2'')* is on contig00019. Contig numbers will differ if participants use their own assembly.
  - Full gene list from your dry run: ______________________
- **D3:** Short-read assemblies break at repeats, so a gene and a replicon on *different* contigs may still share a plasmid (and the reverse). Long reads would resolve this.
- **E:** Gentamicin **S** vs *aac(6')-aph(2'')* present → **disagreement**. Possible explanations: gene not expressed or truncated; AST error; breakpoint or method issues; mixed culture. Report the genotype as **"resistance gene detected, phenotype susceptible: interpret with caution / repeat AST"**. The genome **complements** AST and does **not replace** it for treatment decisions.

### Labs 5–6
*Fill in after the dry run:*
- STs in the collection: ______
- Cluster isolates (ID → profile): ______
- Within-cluster SNP range: ______ ; closest non-cluster isolate: ______ SNPs
- B1 isolate (same ward/time, not linked): ______ , ______ SNPs from the cluster
- **Expected conclusions:** a genomic cluster consistent with transmission among the A-profile patients; **A4** (Maternity) is linked through **Theatre 2**, which suggests a theatre-associated source (staff carrier, equipment, environment), not "the ward". **B1** shows that same ward + same time + same antibiogram ≠ linked. Closing Ward B alone would **not** address the theatre route. Recommended actions: theatre IPC audit, screening of Theatre 2 staff (with consent and support), environmental sampling, enhanced surveillance, and sequencing new cases promptly.

---

## 7. After the course
- Collect and compare pre/post quizzes (match by code word), and summarise the exit tickets and evaluations
- Hold the **documentation sprint** with the trainee team within 2 weeks. A UGHE and an HMS lead review and merge pull requests together. Tag a new release of the materials (e.g. `v1.1-2026-11`) and add contributors to the README
- Share the quiz summary, action plans and evaluations (de-identified) with the trainee team for the **workshop needs summary** and the cohort report
- File the evidence listed in the trainee team guide §7 for grant reporting
- Share the folder, the pre-computed history link and the further-learning list with participants
- Schedule the first monthly **data clinic** within 4 weeks
- Collect the action plans and follow up at 3 months
