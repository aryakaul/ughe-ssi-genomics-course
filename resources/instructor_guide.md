# Instructor Guide
*Read this first. It covers the dry run, building the pre-computed history, mapping the case-study metadata, timing, troubleshooting and answer keys.*

---

## 1. Teaching team & principles
- **One instructor** leads all lectures, live demos and lab support. The group is small enough to walk round and help each pair.
- **Trainee team** (4–6 trainees from UGHE and HMS): participants who also contribute to the literature review, workshop documentation and needs assessment, as committed in the planning grant. Each has a named mentor. See `resources/trainee_team_guide.md`. Treat them as colleagues: they join the dry run, can help during labs, and their logs drive the next version of the materials.
- Participants **raise a hand** when stuck or when they have a question
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
| Lab 6 metadata mapped (§4) and tested in Pathogenwatch | ☐ |
| Pathogenwatch upload of the 14 assemblies tested; time = ____ min | ☐ |
| USB offline packs made | ☐ |

---

## 3. Building the shared pre-computed history
Create a history named **`UGHE-SSI course – precomputed`**. When finished: **History options → Share & manage access → Make accessible via link**, and put the link on the course page/slides. Current link: https://usegalaxy.eu/u/aryakaul/h/ughe-ssi-course-precomputed (participants open it and click **Import**).

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
   - *Optional:* relabel the collection elements to the sample names (`MRSA_10C` …) with **Relabel identifiers**, using the run → sample table in `datasets.md`. Whatever names you choose become the **assembly names** and the **`name`** values in the metadata.
2. **fastp** on the paired collection (defaults)
3. **Shovill** on the fastp output collection (defaults) → 14 assemblies. Download them as a zip (`assemblies/`) for Pathogenwatch.
4. **Reference:** use the complete ST22 EMRSA-15 genome **HE681097.1**, the same lineage as the cluster.
   - ⚠️ **Do not** pick the Köser assembly with the fewest contigs. That picks MRSA_17B, a different lineage about 25,000 SNPs from the main group, and it inflated within-group distances to 129–424 SNPs.
5. **Snippy** (collection mode) → reads: fastp collection; reference: HE681097.1
6. **snippy-core** on all the Snippy outputs → core alignment and cleaned full alignment
7. **IQ-TREE** on the cleaned full alignment (defaults or GTR+G). Save the tree as `koser_tree.nwk`. *(Instructor record only: participants use the tree Pathogenwatch builds.)*
8. **snp-dists** on the core alignment → `koser_snp_matrix.tsv`
9. **Check:** the isolate names in `koser_snp_matrix.tsv` must **exactly** match the `name` column you will use in §4.

> ⏱ Expect several hours of Galaxy compute in total. Start **at least 3 days** before the dry-run deadline.

---

## 4. Mapping the Lab 6 scenario metadata (`labs/Lab6_metadata_template.csv`)
The template has **fictional** patient profiles:
- **A1–A8: outbreak-cluster profile.** Surgical Ward B (and one Maternity patient, **A4**), all operated in **Theatre 2**, Feb–Mar 2026
- **B1–B8: background profile.** Different hospitals, wards, times, plus **B1**: *same ward and same time* but Theatre 1

**Procedure**
1. From the tree and SNP matrix (§3b), identify the **tight cluster** (pairwise SNPs small; with this pipeline the Köser cluster is ≤ 29, so Lab 6 uses ≤ 30). Cross-check it with the outbreak isolates described in **Köser et al. 2012**.
   - ⚠️ **Do not** infer cluster membership from the B/C suffix in the sample names.
2. Assign **A-profiles** to the cluster isolates (A1 = the earliest; always include **A4**, the hidden theatre link). Assign **B-profiles** to non-cluster isolates.
   - Put **B1** on a non-cluster isolate, ideally the **same ST** as the cluster but with many SNPs. This is the key teaching point: *same ward, same time, same antibiogram, but not linked*.
3. Replace `FILL_IN` in the `name` column with each isolate's name (must match the assembly names). **Delete unused profile rows.**
4. Delete the `profile` and `notes` columns from the participant copy, and save it as `lab6_metadata.csv`
5. Test in Pathogenwatch: upload the assemblies and `lab6_metadata.csv` together, make a collection, and check that every genome has its metadata and that `year/month/day` (= **specimen collection date**) build the timeline
6. Write your mapping (isolate → profile) in §6 below for the answer key

### Lab 4 AST blanks
The AST cells in `labs/Lab4_species_typing_amr.md` are filled in for `DRR187559_contigs.fasta` (erythromycin, ciprofloxacin and tetracycline are **R**, matching the genotype in §6). If you change the Lab 4 genome, set them again:
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
| Metadata missing from the Pathogenwatch collection | The rows did not link to the genomes. Upload the FASTA files and the CSV together, and check the CSV `name` values against the assembly file names for `.fasta` suffixes, underscores or spaces. |
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
- **F:** Coverage = total bases ÷ ~2.8 Mb. Counted from the raw files: **Illumina ≈ 67×** (451,782 read pairs; R1 + R2 = 186.3 Mb; R1 alone is ≈ 31×, so pairs must add both files), **Nanopore ≈ 222×** (91,288 reads; 621.9 Mb; mean length about 6.8 kb). Both are well above the minimums.
- **G1:** 5.6 Mb ≈ **two** *S. aureus* genomes → probably a **mixed culture/contamination**; do not use it
- **G2:** Accept if the total length is ≈ 2.7–3.0 Mb, GC ≈ 33%, and there is a reasonable number of contigs
- **H:** Nanopore gives fewer, longer contigs (often a near-complete chromosome). Illumina is historically more accurate per base. Nanopore or hybrid is better for plasmids. Hybrid assembly = **complete and accurate**.
- **Reference QUAST values** (backup assemblies in the shared history, November 2026; participants' values will be close but not identical):

  | Metric (contigs ≥ 500 bp) | Illumina (Shovill, GTN Zenodo) | Nanopore (Flye, `--nano-corr`) |
  |---|---|---|
  | # contigs | 30 (44 including < 500 bp) | 2 |
  | Largest contig | 589,438 | 2,907,108 |
  | Total length | 2,907,150 | 2,967,180 |
  | N50 | 276,459 | 2,907,108 |
  | GC (%) | 32.77 | 32.91 |

  Teaching point for Part H: Flye's largest contig (2.91 Mb) is essentially the whole chromosome, and its second contig is about 60 kb, probably a plasmid. Check the "circular" column in Flye's assembly info output before saying so in class.

### Lab 3
- **C2:** 2 reads (8 lines ÷ 4)
- **C3.1:** Lines ÷ 4 = number of reads; this should equal FastQC "Total sequences" for R1
- **C3.2:** `@` is also a quality symbol (**Q31**), so a **quality line** can start with `@` and would be counted as a read
- **D1:** It counts header lines (`>`), one per sequence = **number of contigs**
- **D2:** It may be **higher** than QUAST's # contigs, because QUAST by default only counts contigs ≥ 500 bp

### Lab 4 (dataset `DRR187559_contigs.fasta`)
*Results below are from a November 2026 run of the assembly outside Galaxy: mlst 2.33.1, AMRFinderPlus 4.2.7 (database 2026-10-29.1), staramr 0.12.3. Galaxy's tool versions may differ slightly.*
- **B1:** The scheme is **`saureus`** → *S. aureus*. **ST764** (arcC 1, aroE 136, glpF 1, gmk 4, pta 12, tpi 1, yqiL 10), a single-locus variant of the well-known MRSA clone ST5
- **C1:** **`mecA`** → methicillin resistance (MRSA)
- **C2:** Tools use different databases, versions and identity/coverage thresholds; AMRFinderPlus also detects species-specific point mutations. Here staramr finds 7 genes, while AMRFinderPlus also finds *blaZ* (partial), the *gyrA*/*parC* and other point mutations, and chromosomal efflux genes. staramr's PointFinder step does not cover *S. aureus*, so it misses the ciprofloxacin mutations.
- **C3:** staramr predicted phenotype: amikacin, gentamicin, tobramycin, spectinomycin, erythromycin, azithromycin, penicillin, tetracycline, plus `unknown[bleO…]` (bleomycin). staramr reports **Quality Module: Failed** because its default genome-length range is 4–6 Mb. That is expected for a 2.9 Mb *S. aureus* genome and does not mean the assembly is bad.
- **D (from the GTN tutorial using this exact assembly):** **5 plasmid replicons** and **7 resistance genes**. **4 of the 7** resistance genes are on contigs that also carry plasmid genes (contig00002, contig00019, contig00024). *aac(6')-aph(2'')* is on contig00019. Contig numbers will differ if participants use their own assembly.
  - Replicons: repUS43 (contig00002) · rep19, rep16, rep5a (contig00019) · rep22 (contig00024)

  | Gene / mutation | Drug class | AMRFinderPlus | staramr | Contig | With a plasmid replicon? |
  |---|---|---|---|---|---|
  | *mecA* (with *mecI*, *mecR1*) | Methicillin, β-lactams | Yes | Yes (*mecA*) | 00021 | No |
  | *blaZ* (with *blaI*, *blaR1*) | Penicillin | Yes (partial) | No | 00019 | Yes |
  | *aac(6')-aph(2'')* | Gentamicin, tobramycin, amikacin | Yes | Yes | 00019 | Yes |
  | *aadD* | Tobramycin, kanamycin | Yes | Yes | 00024 | Yes |
  | *bleO* | Bleomycin | Yes | Yes | 00024 | Yes |
  | *tet(M)* | Tetracycline | Yes | Yes | 00002 | Yes |
  | *erm(A)* | Erythromycin, clindamycin | Yes | Yes | 00022 | No |
  | *ant(9)-Ia* | Spectinomycin | Yes | Yes | 00022 | No |
  | *gyrA* S84L, E88G + *parC* S80Y, E84K | Ciprofloxacin | Yes | No | 00004, 00001 | No (chromosomal) |
  | *ileS* V588F | Mupirocin (low-level) | Yes | No | 00001 | No (chromosomal) |
  | *mepA*, *tet(38)*, *fosB*, *rpsJ* K57M | Efflux, tetracyclines, fosfomycin, tigecycline | Yes | No | 00002, 00003 | Not relevant here |

  The "7 resistance genes" above are staramr's: *aac(6')-aph(2'')*, *aadD*, *ant(9)-Ia*, *bleO*, *erm(A)*, *mecA*, *tet(M)*.
- **D3:** Short-read assemblies break at repeats, so a gene and a replicon on *different* contigs may still share a plasmid (and the reverse). Long reads would resolve this.
- **E, the rows that agree:** cefoxitin R (*mecA*) · penicillin R (*blaZ*, *mecA*) · erythromycin R (*erm(A)*) · ciprofloxacin R (*gyrA* S84L + *parC* S80Y; found by AMRFinderPlus only) · tetracycline R (*tet(M)*) · trimethoprim-sulfamethoxazole S (no *dfr* or *sul* gene) · vancomycin S (no *van* gene).
- **E, the row that disagrees:** Gentamicin **S** vs *aac(6')-aph(2'')* present → **disagreement**. Possible explanations: gene not expressed or truncated; AST error; breakpoint or method issues; mixed culture. Report the genotype as **"resistance gene detected, phenotype susceptible: interpret with caution / repeat AST"**. The genome **complements** AST and does **not replace** it for treatment decisions.

### Labs 5–6
- **Lab 5, Check yourself A:** (1) 4 STs. (2) AMR determinants are **identical within each ST** (Pathogenwatch, November 2026). So all ten ST22 isolates, outbreak or not, look the same: a shared AMR profile suggests but does **not** prove relatedness.
- **ST22 AMR profile** (Pathogenwatch report for MRSA_6C): *mecA*, *blaZ* (methicillin, penicillin) · *aacA-aphD*, *aadD* (gentamicin, tobramycin, kanamycin, amikacin) · *ermC* on a rep10 plasmid contig (erythromycin; inducible clindamycin) · **_ileS-2_ on a rep15/rep21 plasmid contig (mupirocin)** · *grlA* S80F + *gyrA* S84L (ciprofloxacin). No vancomycin, linezolid, tetracycline, trimethoprim or rifampicin determinants. (3) Yes: the 7 cluster isolates sit on very short branches.
*From the November 2026 run: Snippy against the complete ST22 EMRSA-15 genome HE681097.1 → snippy-core → IQ-TREE (cleaned full alignment) and snp-dists (core alignment). Files in `labs/data/`.*
- **STs in the collection (Pathogenwatch): 4 different STs.** ST22 × 10 (all 7 cluster isolates + 15C, 19B, 20B) · ST1 × 2 (16B, 17B) · ST36 × 1 (18B) · ST5 × 1 (14C). Pathogenwatch took only a few minutes for all 14 genomes.
- **Cluster (7 isolates) → profile / patient:** MRSA_12C → A1/P01 · MRSA_1B → A2/P02 · MRSA_7C → A3/P03 · **MRSA_8C → A4/P04 (Maternity, Theatre 2: the hidden link)** · MRSA_10C → A5/P05 · MRSA_11C → A6/P06 · MRSA_6C → A7/P07
- **Within-cluster SNPs:** 9–29 among the six core isolates; **MRSA_6C is 57–76** from them. Köser et al. report one outbreak isolate as a *hypermutator* with more SNPs than the others, which fits 6C. Expect groups to call P07 "uncertain" under a strict threshold: a good discussion of why thresholds are guides, not laws.
- **Closest non-cluster isolate:** MRSA_20B, 181–235 SNPs from the cluster
- **B1 → MRSA_20B / P08** (Surgical Ward B, same time, Theatre 1): close to the reference lineage but 181+ SNPs from every cluster isolate, and it is **ST22, the same ST as the cluster**: *same ward + same time + same antibiogram + same ST ≠ linked*. Only the SNP distance separates it.
- **Other non-cluster isolates:** MRSA_16B → B2/P09 · MRSA_15C → B3/P10 · MRSA_19B → B4/P11 · MRSA_14C → B5/P12 · MRSA_18B → B6/P13 · MRSA_17B → B7/P14 (profiles A8 and B8 dropped; patient codes renumbered P01–P14)
- *Caveat:* 14C, 16B, 17B and 18B are a different lineage (15,000–43,000 SNPs from the reference), so their distances to each other are unreliable with this reference (16B–17B shows 432 here but 1 SNP when mapped to 17B's own assembly). They are clearly unrelated to the cluster either way.
- **Expected conclusions:** a genomic cluster consistent with transmission among the A-profile patients; **A4** (Maternity) is linked through **Theatre 2**, which suggests a theatre-associated source (staff carrier, equipment, environment), not "the ward". **B1** shows that same ward + same time + same antibiogram ≠ linked. Closing Ward B alone would **not** address the theatre route. Recommended actions: theatre IPC audit, screening of Theatre 2 staff (with consent and support), environmental sampling, enhanced surveillance, and sequencing new cases promptly. **Committee question to ask:** "If you find a staff carrier, will mupirocin decolonisation work?" The cluster carries *ileS-2* (high-level mupirocin resistance), so probably not: discuss alternatives with the microbiologist. This is genomics changing an IPC action directly.

---

## 7. After the course
- Collect and compare pre/post quizzes (match by code word), and summarise the exit tickets and evaluations
- Hold the **documentation sprint** with the trainee team within 2 weeks. A UGHE and an HMS lead review and merge pull requests together. Tag a new release of the materials (e.g. `v1.1-2026-11`) and add contributors to the README
- Share the quiz summary, action plans and evaluations (de-identified) with the trainee team for the **workshop needs summary** and the cohort report
- File the evidence listed in the trainee team guide §7 for grant reporting
- Share the folder, the pre-computed history link and the further-learning list with participants
- Schedule the first monthly **data clinic** within 4 weeks
- Collect the action plans and follow up at 3 months
