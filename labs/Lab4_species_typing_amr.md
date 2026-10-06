# Lab 4 · Who Is It, and What Does It Resist?
**Day 2 · 08:50–10:30 · 100 min · Pairs (swap driver/navigator at Part D)**
**Objective:** LO4 — Detect AMR genes and plasmids, type the isolate, and interpret results alongside phenotypic AST

> **Scenario:** A patient develops a deep SSI 9 days after an open fracture repair. The lab reports *Staphylococcus aureus*, methicillin-resistant. The isolate was sent for sequencing and you have received its **assembly** (FASTA). What can the genome add?
> *(Teaching scenario; the genome is real public data, an MRSA isolate used in the Galaxy Training Network.)*

---

## Part A — Get the genome (5 min)
1. New history: `Lab4 – AMR`
2. **Upload → Paste/Fetch data**:
```
https://zenodo.org/record/10572227/files/DRR187559_contigs.fasta
```
   **Type** → `fasta`. Name it `MRSA_contigs.fasta`
3. *Optional:* if your own Lab 2 Shovill assembly finished, drag it in from your Lab 2 history (**User → Histories → Switch** or the drag-and-drop history view) and run every step on both.

---

## Part B — Who is it? Species and strain type (20 min)

### B1. MLST (Sequence Type)
1. Tool **`MLST`** → input: `MRSA_contigs.fasta` → leave the scheme on **automatic** → **Run**
2. View the output, a single line like:
```
MRSA_contigs.fasta   saureus   ST?   arcC(?) aroE(?) glpF(?) gmk(?) pta(?) tpi(?) yqiL(?)
```

✍️ **Check yourself B1:**
1. Which **scheme** did MLST choose automatically? What does that tell you about the species?
2. What is the **ST**? Is it a well-known MRSA clone? *(Search "S. aureus ST___ MRSA" or use PubMLST.)*

### B2. (Optional, if time) Species check with Kraken2
1. Tool **`Kraken2`** → input: `MRSA_contigs.fasta` → database: the one recommended by your facilitator → **Run**
   - Turn on the option to **output a report** (Kraken-style report), then view it: what is the top species, and what percentage of contigs matched it?

> 💡 *Why check species?* If the lab misidentified the organism or the culture was mixed, every downstream result is wrong. A total assembly length far from the expected genome size (Lab 2) is another warning sign.

---

## Part C — What does it resist? AMR genes (35 min)
We'll run **two** independent tools and compare them, as a real lab would.

### C1. AMRFinderPlus (NCBI)
1. Tool **`AMRFinderPlus`**
   - Input type → **nucleotide** (assembled genome) → `MRSA_contigs.fasta`
   - **Organism** → `Staphylococcus_aureus` *(this switches on species-specific point-mutation detection)*
   - Leave the rest at the defaults
2. **Run**. Open the main **report** (a table).

Key columns: **Element symbol** (gene name) · **Element type** (AMR, STRESS, VIRULENCE) · **Class / Subclass** (drug class) · **Method** (EXACT, BLAST, POINT…) · **% Identity** · **% Coverage**

### C2. staramr (ResFinder + PointFinder + PlasmidFinder + MLST in one)
1. Tool **`staramr`** → input: `MRSA_contigs.fasta` → leave the defaults → **Run**
2. Open **summary.tsv** and **detailed_summary.tsv**

### C3. Record your findings
| Gene / mutation | Drug class | Found by AMRFinderPlus? | Found by staramr? | On a plasmid contig? (Part D) |
|---|---|---|---|---|
| | | | | |
| | | | | |
| | | | | |
| | | | | |
| | | | | |
| | | | | |
| | | | | |

✍️ **Check yourself C:**
1. Which gene explains the **methicillin resistance** the lab reported? *(Glossary cheat sheet!)*
2. Did both tools find the same genes? If not, why might they differ? *(Hint: L3, Slide 8.)*
3. What is staramr's **predicted phenotype** list?

---

## Part D — Is resistance mobile? Plasmids (15 min) · *swap driver and navigator*
1. Look at the **plasmid** rows in staramr's `detailed_summary.tsv` (from PlasmidFinder). Note the **contig** each plasmid replicon (`rep…`) sits on.
2. *Alternative:* tool **`ABRicate`** → input: `MRSA_contigs.fasta` → database: **plasmidfinder** → **Run**
3. Go back to your table in C3: are any **resistance genes on the same contig** as a plasmid replicon? Mark them.

✍️ **Check yourself D:**
1. How many plasmid replicons were found? On which contigs?
2. Which resistance genes are probably **plasmid-borne**? Why does this matter for infection control?
3. Why can't we be **certain** from an Illumina assembly? *(Hint: Lab 2 comparison, contig breaks.)*

---

## Part E — Genotype vs phenotype: does it match the lab? (20 min)
The hospital microbiology lab sent this **AST report** for the isolate.
> ⚠️ *This AST report is **hypothetical**, written for teaching. It is not the real AST for this public genome.*

| Antibiotic | AST result | Gene(s)/mutation(s) that explain it (from your table) | Genotype prediction | Agree? |
|---|---|---|---|---|
| Cefoxitin (methicillin screen) | **R** | | | |
| Penicillin | **R** | | | |
| Gentamicin | **S** | | | |
| Erythromycin | | | | |
| Ciprofloxacin | | | | |
| Tetracycline | | | | |
| Trimethoprim-sulfamethoxazole | **S** | | | |
| Vancomycin | **S** | | | |

*Your facilitator will fill in the blank AST cells after the dry run, so that the report contains at least one deliberate disagreement.*

✍️ **Check yourself E:**
1. Find every row where **genotype and phenotype disagree**. For each, list two possible explanations (see L3, Slide 7).
2. Which results would you **report to the clinician**, and how? Draft one sentence in plain language.
3. Would you use the genome **instead of** AST to choose this patient's treatment? Why or why not?

---

## Part F — Quick plenary (5 min)
- MLST → **who** (strain identity, known clones)
- AMRFinderPlus / staramr → **what resistance**, by gene and mutation
- PlasmidFinder → **mobility** of resistance
- Comparison with AST → **confidence**, and discovery of gaps
- Next: what happens when we have **many** isolates? → L4 and Lab 5

---
**Extension (fast pairs):**
- Run **`ABRicate`** with the **card** and **vfdb** (virulence) databases. Which virulence genes are present (e.g. toxins)?
- Annotate the genome with **`Bakta`** and find your resistance genes in the annotation
- Upload the same FASTA to **ResFinder** on the web (https://genepi.food.dtu.dk/resfinder) and compare

---
*Adapted from the Galaxy Training Network tutorial "Identification of AMR genes in an assembled bacterial genome" (CC-BY 4.0), training.galaxyproject.org/training-material/topics/genome-annotation/tutorials/amr-gene-detection/*
