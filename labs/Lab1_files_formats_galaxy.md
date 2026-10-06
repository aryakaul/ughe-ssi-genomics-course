# Lab 1 · Files, Formats and Your First Galaxy History
**Day 1 · 10:45–12:15 · 90 min · Work in pairs (driver + navigator; swap at Part C)**
**Objectives:** LO2, LO3 — Recognise genomic file formats, read a quality score, and run a tool in Galaxy

> **Before you start:** you should be logged in to **https://usegalaxy.eu** (see setup checklist). Ask a helper if you are not.

---

## Part A — Files and folders: the 5-minute version (15 min, facilitator demo + discussion)
Everything in bioinformatics is a **file** in a **folder (directory)**. Three ideas are enough to begin:

1. **A file name has a name and an extension:** `isolate01_R1.fastq.gz`
   - `isolate01` = sample name · `R1` = read 1 of a pair · `.fastq` = format · `.gz` = compressed (zipped)
2. **Plain-text files** (FASTA, FASTQ, CSV) can be opened in any text editor. They are just letters.
3. **Genomic files are big.** One isolate can be 200 MB–1 GB, which is why we use Galaxy (computers on the internet) rather than our laptops.

✍️ **Check yourself A:** What do you expect is inside a file called `UGHE-SSI-0042_R2.fastq.gz`?

---

## Part B — Looking inside the formats (25 min)

### B1. FASTA: just sequence
```
>contig_1 length=120
TTCGCTCTATTGACTACGACGCGCTCATTCCCTTGTCGGAGAGTTATGGAACAAGGACGC
TGTCTGAGACTAGAAGACAGATAGTGCACACGACCGGCGTCGGAGAAACTCTATTTGCCG
>contig_2 length=60
CCTGACAAGTCAATGCGATCCGTAGGGGCAGCGCAGTATGCCAAGACTATAGGCACTGTC
```
- Each entry starts with `>` followed by a **name**
- The lines below it are the **sequence** (it can wrap over many lines)
- **Assemblies** (genomes) are stored in FASTA

✍️ **Check yourself B1:** How many sequences are in this file? How many bases in total?

### B2. FASTQ: sequence + quality (raw reads)
Every read takes **exactly 4 lines**:
```
@SSI_isolate_01_read1                         ← line 1: @ + read name
GCTAAAGACAATTACATAACATACACGTCAGCACGAAACT      ← line 2: the DNA sequence
+                                             ← line 3: a separator
GHHGFGHIIIIIFIGGHGIFIIGHIHIGHIIGFHHDACBC      ← line 4: one quality symbol per base
```

**Quality symbols** encode how confident the sequencer was in each base (the Phred score):

| Symbol | `#` | `+` | `5` | `?` | `I` |
|---|---|---|---|---|---|
| Q score | 2 | 10 | 20 | 30 | 40 |
| Chance the base is wrong | ~63% | 1 in 10 | 1 in 100 | 1 in 1,000 | 1 in 10,000 |

*Rule of thumb:* letters (`A`–`J`) are good; symbols like `#`, `$`, `%`, `&` are bad.

✍️ **Check yourself B2:** Look at read 4 in Part C below. Which part of the read (start or end) has poor quality? What should we do with those bases?

### B3. CSV/TSV: tables
Metadata and tool results are often tables:
```
isolate_id,organism,collection_date,ward,specimen,ceftriaxone
UGHE-SSI-0001,Klebsiella pneumoniae,2026-03-02,Maternity,wound swab,R
UGHE-SSI-0002,Escherichia coli,2026-03-05,Surgical,wound swab,S
```
These open in Excel or Google Sheets.

---

## Part C — Your first Galaxy history (40 min) · *swap driver and navigator now*

### C1. Tour the Galaxy interface (5 min)
- **Left panel – Tools:** search box and tool list
- **Centre panel:** where tool forms and results appear
- **Right panel – History:** your files, in order. Each one is a **dataset**.
  - 🟩 green = finished · 🟨 yellow = running · ⬜ grey = queued · 🟥 red = error

### C2. Create a new history (2 min)
1. In the History panel, click **"+"** (Create new history)
2. Click the history name ("Unnamed history") and rename it: `Lab1 – formats`

### C3. Upload data by pasting (8 min)
1. Click the **Upload** icon (↑) at the top of the Tools panel
2. Click **"Paste/Fetch data"**
3. Paste the 4 reads below into the text box:
```
@SSI_isolate_01_read1
GCTAAAGACAATTACATAACATACACGTCAGCACGAAACT
+
GHHGFGHIIIIIFIGGHGIFIIGHIHIGHIIGFHHDACBC
@SSI_isolate_01_read2
TAAGTAAGTGTGATGCATACGCCTTTACTTGCTGTGTCCA
+
IIIIIGFIIIIIHGHFFHIGFIGGHHHHIGHIIIIB@?AC
@SSI_isolate_01_read3
AAACAGAACTCGGGTAATTTTGACAGGTCACGCAGAGGCG
+
IGGGHIFIIHIIGGHIIIGIIFHGHHIIIIGIHIGCC?BD
@SSI_isolate_01_read4
GAATCTCTGATTTACCCACTCTGCCAAACTCCAGCGCGGT
+
IIHFGIIIFIIIIIFIIHFIIIIHI#'&'##&%''''$(%
```
4. Set **Type** to `fastqsanger` (this tells Galaxy it is a FASTQ file with modern quality scores)
5. Name the dataset `tiny_reads.fastq`
6. Click **Start**, then **Close**
7. When the dataset turns green, click its **name** to expand it, then click the **eye icon** 👁 to view it

### C4. Run your first tool: count lines (8 min)
1. In the Tools search box, type **`Line/Word/Character count`**
2. Select it. For "Text file", choose `tiny_reads.fastq`
3. Click **Run tool**
4. View the result with the eye icon

✍️ **Check yourself C4:** How many lines does the file have? How many reads is that? (Hint: 4 lines per read.)

### C5. Run a real QC tool: FastQC (12 min)
1. Search for **`FastQC`**, select it, and choose `tiny_reads.fastq` as input
2. Click **Run tool**. Two new datasets appear: *RawData* and *Webpage*
3. Click the eye icon on **Webpage**
4. Find **"Per base sequence quality"**

✍️ **Check yourself C5:**
- Does quality go up or down towards the end of the reads?
- With only 4 reads, would you trust this report? How many reads does a real isolate have?

### C6. Look at your history (5 min)
- Click the dataset name, then the **"i" (Dataset details)** icon. Galaxy records **exactly** which tool, version and settings produced each file.
- This is **reproducibility**: anyone can see and repeat what you did.

---

## Wrap-up (10 min, plenary)
- FASTA = sequences (assemblies) · FASTQ = reads + quality (raw data) · CSV = tables (metadata, results)
- Galaxy: **Upload → choose tool → run → view → history keeps everything**
- After lunch: **real** reads from a bacterial isolate, a few hundred thousand of them

---
*Some content adapted from the Galaxy Training Network "Introduction to Galaxy" and "Quality Control" tutorials (CC-BY 4.0).*
