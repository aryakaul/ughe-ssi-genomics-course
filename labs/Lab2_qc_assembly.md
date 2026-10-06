# Lab 2 · Quality Control and Genome Assembly
**Day 1 · 13:45–15:30 · 105 min · Pairs (half the room does the Illumina track, half the Nanopore track)**
**Objective:** LO3 — Perform QC and assembly on raw reads in Galaxy and judge whether an assembly is good enough to use

> **The isolate:** an MRSA strain (KUN1163) sequenced **twice**, once on Illumina and once on Oxford Nanopore. At the end, an Illumina pair and a Nanopore pair compare results.

> ⏱ **Strategy:** assembly takes **20–60 minutes** on Galaxy. We **start the assembly early** and interpret QC while it runs. If it hasn't finished by 15:00, import the facilitator's pre-computed result (Part E).

---

## Part A — Set up (10 min)
1. Create a new history called `Lab2 – Illumina` **or** `Lab2 – Nanopore`
2. Click **Upload → Paste/Fetch data** and paste the URL(s) for your track:

**Illumina track** (paste both lines at once):
```
https://zenodo.org/record/10669812/files/DRR187559_1.fastqsanger.bz2
https://zenodo.org/record/10669812/files/DRR187559_2.fastqsanger.bz2
```
Set **Type** → `fastqsanger.bz2`

**Nanopore track:**
```
https://zenodo.org/record/10669812/files/DRR187567.fastq.bz2
```
Set **Type** → `fastqsanger.bz2`

3. Click **Start**. Galaxy downloads the files directly from the internet, so your laptop does **not** need to download 500 MB.
4. Rename the datasets: `illumina_R1`, `illumina_R2` **or** `nanopore_reads`

✍️ **Check yourself A:** Why are there two Illumina files but only one Nanopore file?

---

## ILLUMINA TRACK

### Part B-I — Quality check (15 min)
1. Tool **`FastQC`** → input: `illumina_R1` → **Run**. Repeat for `illumina_R2`.
2. Open the **Webpage** output and look at:
   - **Basic statistics:** total sequences and sequence length
   - **Per base sequence quality:** is most of the box plot in the green zone?
   - **Adapter content:** are adapters present?

### Part C-I — Clean the reads (10 min)
1. Tool **`fastp`**
   - "Single-end or paired reads" → **Paired**
   - Input 1 → `illumina_R1`, Input 2 → `illumina_R2`
   - Leave the other settings at their defaults (fastp detects adapters automatically and trims low-quality ends)
2. **Run**. Outputs: two trimmed read files and an HTML report.
   - *If Shovill doesn't offer the fastp outputs as inputs:* click the pencil ✏️ on each fastp read output → **Datatypes** → set it to `fastqsanger.gz` → **Save**
3. Open the HTML report: what **percentage of reads passed** the filters?

### Part D-I — Assemble (start now and let it run)
1. Tool **`Shovill`**
   - "Input reads type" → **Paired-end**
   - Forward → fastp read 1 output; Reverse → fastp read 2 output
   - Leave the defaults
2. **Run**. It will take a while, so **move on to Part F (interpreting QC) while it runs**.

---

## NANOPORE TRACK

### Part B-N — Quality check (15 min)
1. Tool **`NanoPlot`** → input: `nanopore_reads` → **Run**
2. Open the **HTML report** and find:
   - **Number of reads**
   - **Read length N50** (half of all bases are in reads at least this long)
   - **Mean read quality**
   - The **read length vs quality** plot

### Part C-N — Filter the reads (10 min)
1. Tool **`filtlong`**
   - Input → `nanopore_reads`
   - "Min. length" → `1000` (reads shorter than 1,000 bases make assembly harder)
   - Leave the other settings at their defaults
2. **Run**

### Part D-N — Assemble (start now and let it run)
1. Tool **`Flye`**
   - Input reads → filtlong output
   - "Mode" → **Nanopore corrected** (`--nano-corr`), as in the GTN tutorial for this dataset
   - Leave the defaults
2. **Run**. It will take a while, so **move on to Part F while it runs**.

---

## BOTH TRACKS

### Part F — Interpret QC while the assembly runs (20 min, discussion within your pair)
Fill in this table:

| | Your track |
|---|---|
| Number of reads | |
| Typical read length | |
| Total bases (≈ reads × length) | |
| Expected genome size (*S. aureus*) | ≈ 2.8 million bases |
| **Estimated coverage** (total bases ÷ genome size) | |
| Is the quality good enough? (Y/N + why) | |

✍️ **Check yourself F:**
1. Is your coverage above the minimum recommended (≈30× Illumina, ≈40–50× Nanopore)?
2. The facilitator will show a FastQC report from a *bad* run. What looks different?

### Part G — Assess the assembly with QUAST (15 min)
When your assembly dataset turns green:
1. Tool **`Quast`**
   - Contigs/scaffolds → your Shovill `contigs` **or** Flye `assembly` output
   - Leave the defaults (no reference)
2. **Run**, then open the **HTML report**

| Metric | What it means | Good sign for *S. aureus* | Your value |
|---|---|---|---|
| **# contigs** | Number of pieces | Illumina: tens to ~100 · Nanopore: 1–5 | |
| **Total length** | Sum of all contigs | ≈ 2.7–3.0 Mb | |
| **Largest contig** | Longest piece | Nanopore: ≈ whole chromosome | |
| **N50** | Half the genome is in contigs at least this long | Bigger is better | |
| **GC (%)** | Proportion of G+C | ≈ 33% for *S. aureus* | |

✍️ **Check yourself G:**
1. Is the total length close to the expected genome size? What would a total length of **5.6 Mb** suggest? *(Hint: two organisms?)*
2. Would you accept this assembly for AMR analysis? Why?

### Part H — Compare tracks (10 min, Illumina pair + Nanopore pair)
Pair up with a team from the other track and compare QUAST results:

| | Illumina (Shovill) | Nanopore (Flye) |
|---|---|---|
| # contigs | | |
| Largest contig | | |
| Total length | | |
| N50 | | |

**Discuss:**
- Which assembly is more **complete** (fewer pieces)?
- Which is likely more **accurate** at single-letter level? *(See L2.)*
- If you needed to know whether a resistance gene sits on a **plasmid**, which would you prefer?
- What would a **hybrid** assembly (both read types) give you?

---

## Part E — Fallback: import pre-computed results
If your assembly is still running at 15:00:
1. Go to **User → Histories shared with me** (or open the link from your facilitator)
2. Open `UGHE-SSI course – precomputed`
3. Drag the Shovill or Flye assembly and its QUAST report into your history
4. Continue from Part G. **Your own job will keep running.** Check it tonight!

---

## Summary
```
Illumina:  reads → FastQC → fastp → Shovill → QUAST → many accurate contigs
Nanopore:  reads → NanoPlot → filtlong → Flye  → QUAST → few long contigs (≈ complete genome)
```
Your Galaxy history now holds a complete, reproducible record of how you went from raw reads to a genome. Tomorrow we ask: **what is in this genome?**

**Extension (fast pairs):** try **`Unicycler`** hybrid assembly with the Illumina and Nanopore reads together, or run `Bandage` on the assembly graph to *see* the genome.

---
*Adapted from the Galaxy Training Network tutorials "Bacterial Genome Assembly using Shovill" and "Bacterial Genome Assembly using Flye" (CC-BY 4.0), training.galaxyproject.org/training-material/topics/assembly/*
