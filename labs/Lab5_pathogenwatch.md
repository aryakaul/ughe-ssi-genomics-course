# Lab 5 · Pathogenwatch: Many Genomes at Once
**Day 2 · 11:30–12:30 · 60 min · Pairs**
**Objective:** LO5 — Use a free web platform to type, screen and visualise a collection of genomes

> **Scenario:** The IPC nurse at *District Hospital A (fictional)* is worried about a rise in MRSA SSIs on Surgical Ward B. The lab stored the isolates and sent them for Illumina sequencing, and your colleague assembled them in Galaxy. You now have **genomes from all the MRSA isolates from the past months** and want a quick overview.
> *The genomes are real public data. The hospital, wards and dates are fictional.*

**Files from the instructor**, in the `labs/data/` folder of the course GitHub (https://github.com/aryakaul/ughe-ssi-genomics-course):
- `assemblies/` — one FASTA per isolate
- `lab6_metadata.csv` — patient, ward, procedure and date information
- `koser_snp_matrix.tsv` — SNP distances between isolates (used in Lab 6)

> **Download everything at once:** on https://github.com/aryakaul/ughe-ssi-genomics-course click the green **Code** button → **Download ZIP**, then unzip it. The files are in `labs/data/`.

---

## Part A — Pathogenwatch: automatic typing and AMR (30 min)
Pathogenwatch (https://pathogen.watch) is a free platform run by the Centre for Genomic Pathogen Surveillance. It identifies species, sequence type and AMR, builds a tree, and places genomes in global context, **without any coding**.

### A1. Upload
1. Log in to **https://pathogen.watch** (account created before the course)
2. Click **Upload** and drag in **all the FASTA assemblies and `lab6_metadata.csv` together**, so Pathogenwatch can pair each genome with its row of metadata
3. Wait while each genome is analysed (a progress bar appears; usually a few minutes)

### A2. Explore the genome list
For each genome, Pathogenwatch reports:
- **Organism**: does it agree with the lab?
- **ST** (MLST)
- **AMR**: predicted resistance by drug, and the genes responsible
- Assembly **QC metrics** (length, contigs, N50)

Fill in a table for **at least 6** genomes:

| Genome | Species | ST | Predicted resistances | QC pass? |
|---|---|---|---|---|
| | | | | |
| | | | | |
| | | | | |
| | | | | |
| | | | | |
| | | | | |

### A3. Make a collection and view the tree
1. Select all your uploaded genomes → **Create collection** → name it `UGHE Lab 5`
2. Open the collection and explore the **tree** view
3. Explore the **AMR** view, which shows resistance profiles side by side

✍️ **Check yourself A:**
1. How many different STs are in the collection?
2. Do all isolates have the **same** AMR profile? What does that suggest, and what does it **not** prove?
3. In the tree, can you see a group of isolates on very **short** branches?

> 💡 Pathogenwatch also lets you compare your genomes with **public genomes from around the world**. Try **"Find similar"** or the population view, if the instructor enables it.

---

## Part B — Tree + timeline + metadata (25 min)
Your collection combines a **tree**, a **timeline** and a **table** in one interactive view. It's ideal for presenting results to an IPC committee.

### B1. Find your metadata
Open the `UGHE Lab 5` collection and look at the **data tables** at the bottom of the page. You should see the columns from `lab6_metadata.csv`, such as `ward`, `theatre` and `hospital`.

*No metadata columns? Raise your hand.*

### B2. Explore
- **Colour** the tree by **`ward`**: click the `ward` column header. *(If the colours don't change, open the eye icon at the top right and choose `ward` as the colour column.)*
- Then colour by **`theatre`**, and then by **`hospital`**
- Open the **Timeline**, which sits behind the data tables: when did each infection happen?
- **Click a tip** in the tree and find the same isolate in the table and on the timeline

✍️ **Check yourself B:**
1. Is there a group of isolates that are closely related **and** close in time **and** in the same place?
2. Is there any isolate from the **same ward at the same time** that is **not** in that group?
3. Is there any isolate in the group that came from a **different ward**? What could link it?

### B3. Save and share
- Copy the link to your collection from the browser's address bar. You'll use it in **Lab 6**.

---

## Summary
| Pathogenwatch gives you | Input |
|---|---|
| Species, ST, AMR, QC, clustering, global context | FASTA assemblies |
| A visual story: tree + time + place + metadata | The same assemblies + a table (CSV) |

Pathogenwatch is free and used by public-health labs around the world. **You can use it on Monday with your own data.**

---
*Pathogenwatch: Centre for Genomic Pathogen Surveillance.*
