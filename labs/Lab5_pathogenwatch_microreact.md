# Lab 5 · Pathogenwatch and Microreact: Many Genomes at Once
**Day 2 · 11:30–12:30 · 60 min · Pairs**
**Objective:** LO5 — Use free web platforms to type, screen and visualise a collection of genomes

> **Scenario:** The IPC nurse at *District Hospital A (fictional)* is worried about a rise in MRSA SSIs on Surgical Ward B. The lab stored the isolates and sent them for Illumina sequencing, and your colleague assembled them in Galaxy. You now have **genomes from all the MRSA isolates from the past months** and want a quick overview.
> *The genomes are real public data (see facilitator notes). The hospital, wards and dates are fictional.*

**Files from your facilitator** (shared Galaxy history `UGHE-SSI course – precomputed`, or USB):
- `assemblies/` — one FASTA per isolate
- `koser_tree.nwk` — phylogenetic tree (built in Galaxy with Snippy → IQ-TREE)
- `lab6_metadata.csv` — patient, ward, procedure and date information

> **Download from Galaxy:** open the shared history → click a dataset → the **download** icon 💾. To download all the assemblies at once, select them and choose **"Download"** (or ask a helper for the zip).

---

## Part A — Pathogenwatch: automatic typing and AMR (30 min)
Pathogenwatch (https://pathogen.watch) is a free platform run by the Centre for Genomic Pathogen Surveillance. It identifies species, sequence type and AMR, and places genomes in global context, **without any coding**.

### A1. Upload
1. Log in to **https://pathogen.watch** (account created before the course)
2. Click **Upload** and drag in the FASTA assemblies
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

> 💡 Pathogenwatch also lets you compare your genomes with **public genomes from around the world**. Try **"Find similar"** or the population view, if your facilitator enables it.

---

## Part B — Microreact: tree + timeline + metadata (25 min)
Microreact (https://microreact.org) combines a **tree**, a **timeline**, a **map** and a **table** in one interactive view. It's ideal for presenting results to an IPC committee.

### B1. Create a project
1. Go to **https://microreact.org** → **Upload** (you can sign in with Google or another account if you want to save the project; viewing is possible without it)
2. Drag in **both** files: `lab6_metadata.csv` and `koser_tree.nwk`
3. Microreact asks which column links the table to the tree tips → choose **`id`**
4. If asked about dates, confirm that **`year`, `month`, `day`** form the date
5. Click **Continue / Create**

### B2. Explore
- **Colour** the tree by **`ward`**: click the colour-by control and choose `ward`
- Then colour by **`theatre`**, and then by **`hospital`**
- Open the **Timeline** panel: when did each infection happen?
- **Click a tip** in the tree: the matching row is highlighted in the table and timeline
- **Lasso-select** a group of closely related tips: where and when do they fall?

✍️ **Check yourself B:**
1. Is there a group of isolates that are closely related **and** close in time **and** in the same place?
2. Is there any isolate from the **same ward at the same time** that is **not** in that group?
3. Is there any isolate in the group that came from a **different ward**? What could link it?

### B3. Save and share
- Click **Save** (if signed in) and copy the project link. You'll use it in **Lab 6**.

---

## Summary
| Tool | Gives you | Input |
|---|---|---|
| **Pathogenwatch** | Species, ST, AMR, QC, clustering, global context | FASTA assemblies |
| **Microreact** | Visual story: tree + time + place + metadata | Tree (Newick) + table (CSV) |

Both are free and used by national public-health labs around the world. **You can use them on Monday with your own data.**

---
*Pathogenwatch: Centre for Genomic Pathogen Surveillance. Microreact: Argimón S, et al. Microb Genom 2016.*
