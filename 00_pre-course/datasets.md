# Datasets & Background References
*All accessions and links below were checked on **6 October 2026** (HTTP 200 / ENA Portal API). Re-check them during the facilitator dry run.*

---

## Dataset 1 — MRSA strain KUN1163: Illumina and Nanopore reads of the *same* isolate
**Used in:** Lab 2 (QC & assembly), Lab 3 (command line)
**Source:** Galaxy Training Network tutorials "Bacterial genome assembly using Shovill" (`mrsa-illumina`) and "Bacterial genome assembly using Flye" (`mrsa-nanopore`). Zenodo record **10669812**.

| File | Platform | Size | Direct URL (paste into Galaxy Upload → Paste/Fetch) |
|---|---|---|---|
| `DRR187559_1.fastqsanger.bz2` | Illumina MiSeq, read 1 | 63 MB | `https://zenodo.org/record/10669812/files/DRR187559_1.fastqsanger.bz2` |
| `DRR187559_2.fastqsanger.bz2` | Illumina MiSeq, read 2 | 66 MB | `https://zenodo.org/record/10669812/files/DRR187559_2.fastqsanger.bz2` |
| `DRR187567.fastq.bz2` | Oxford Nanopore MinION | 529 MB | `https://zenodo.org/record/10669812/files/DRR187567.fastq.bz2` |

*Why this dataset:* both tracks sequence the **same** strain, so pairs can directly compare what short and long reads produce. *S. aureus* is the most common cause of SSI worldwide.

## Dataset 2 — MRSA assembly for AMR detection
**Used in:** Lab 4
**Source:** GTN tutorial "Identification of AMR genes in an assembled bacterial genome" (`amr-gene-detection`). Zenodo record **10572227**.

| File | Description | Size | Direct URL |
|---|---|---|---|
| `DRR187559_contigs.fasta` | Shovill assembly of the Illumina reads above | 3 MB | `https://zenodo.org/record/10572227/files/DRR187559_contigs.fasta` |

*Note:* this is the same isolate as Dataset 1. Participants whose Lab 2 assembly finished can use their own assembly instead and compare.

## Dataset 3 — Neonatal MRSA outbreak (Köser et al. 2012): the outbreak case study
**Used in:** Lab 5 (Pathogenwatch/Microreact), Lab 6 (case study)
**Paper:** Köser CU, Holden MTG, Ellington MJ, et al. Rapid whole-genome sequencing for investigation of a neonatal MRSA outbreak. *N Engl J Med* 2012;366:2267–75. doi:10.1056/NEJMoa1109910
**ENA project:** **PRJEB2912** (study ERP001256): 14 isolates, Illumina MiSeq paired-end

| Run | Sample | Read pairs | | Run | Sample | Read pairs |
|---|---|---|---|---|---|---|
| ERR101899 | MRSA_10C | 443,784 | | ERR103400 | MRSA_19B | 1,233,303 |
| ERR101900 | MRSA_11C | 363,291 | | ERR103401 | MRSA_1B | 1,031,365 |
| ERR103394 | MRSA_12C | 409,033 | | ERR103402 | MRSA_20B | 361,069 |
| ERR103395 | MRSA_14C | 414,585 | | ERR103403 | MRSA_6C | 438,522 |
| ERR103396 | MRSA_15C | 470,951 | | ERR103404 | MRSA_7C | 444,955 |
| ERR103397 | MRSA_16B | 276,380 | | ERR103405 | MRSA_8C | 420,175 |
| ERR103398 | MRSA_17B | 769,125 | | ERR159680 | MRSA_18B | 394,278 |

FASTQ URL pattern: `ftp.sra.ebi.ac.uk/vol1/fastq/ERR103/ERR103395/ERR103395_1.fastq.gz` (and `_2`). Galaxy can also import them directly with **"Faster Download and Extract Reads in FASTQ"** (fasterq-dump) using the run accessions.

**Important for facilitators:**
- Collection dates and ward timelines are **in the paper, not in ENA**. The paper reports that some isolates belonged to the outbreak and others were unrelated controls.
- **Do not** guess which sample is which from the B/C suffixes. During the dry run, assemble all 14 isolates (Shovill), build the tree and SNP matrix, and match the cluster to the paper. Then fill in `labs/Lab6_metadata_template.csv` (instructions in the facilitator guide).
- Lab 6 places these real genomes in a **fictional Rwandan surgical-ward scenario**. The genomic relationships are real; the ward and dates are invented for teaching. Tell participants this, and reveal the real study at the end.

**Pre-computed outputs to prepare in the dry run** (save to a **shared Galaxy history** named `UGHE-SSI course – precomputed`):
- 14 assemblies (`MRSA_xx.fasta`)
- `snippy-core` alignment → **IQ-TREE** tree (`koser_tree.nwk`)
- **snp-dists** SNP distance matrix (`koser_snp_matrix.tsv`)
- Lab 2 fallback outputs: Shovill and Flye assemblies of Dataset 1, plus the QUAST report

## Optional / extension datasets
| Dataset | Use | Source |
|---|---|---|
| *E. coli* C-1, Illumina + Nanopore | Hybrid assembly (Unicycler), extension for fast pairs | Zenodo 940733 (`illumina_f.fq`, `illumina_r.fq`, `minion_2d.fq`); GTN `unicycler-assembly` |
| *K. pneumoniae* neonatal unit outbreak, Malawi | African Gram-negative example for follow-up practice (subsample about 15 isolates) | Cornick J et al. *Microb Genom* 2021. doi:10.1099/mgen.0.000703; ENA/SRA PRJNA641987, PRJEB19322 |
| *K. pneumoniae* EuSCAPE (Microreact) | Ready-made Microreact demo of a large surveillance project | https://microreact.org/project/EuSCAPE_Kp |
| Global *S. aureus* ST239 (Microreact) | Ready-made Microreact demo | https://microreact.org/project/NJ-zAij8 |

---

## Background references (for lectures)

### Rwanda SSI & AMR
- **Velin L, Umutesi G, Riviello R, et al.** Surgical site infections and antimicrobial resistance after cesarean section delivery in rural Rwanda. *Ann Glob Health* 2021;87(1):77. doi:10.5334/aogh.3413
  - Kirehe District Hospital: SSI in **5.7%** (45/795) of women after caesarean section
  - **68.4%** of isolates were Gram-negative; **0%** of Gram-negatives were susceptible to ampicillin; **92.1%** were intermediate or resistant to ceftriaxone
- **Nkurunziza T, Kateera F, Sonderman K, et al.** Prevalence and predictors of surgical-site infection after caesarean section at a rural district hospital in Rwanda. *Br J Surg* 2019;106(2):e121–e128. doi:10.1002/bjs.11060. **10.9%** SSI prevalence at post-operative day 10.
- **Cherian T, Hedt-Gauthier B, et al.** Diagnosing post-cesarean surgical site infections in rural Rwanda: development, validation, and field testing of a screening algorithm for use by community health workers. *Surg Infect* 2020;21:613–20. doi:10.1089/sur.2020.062
- **Sibomana O, Bugenimana A, Oke GI, Egide N.** Prevalence of post-caesarean section surgical site infections in Rwanda: a systematic review and meta-analysis. *Int Wound J* 2024;21(5):e14929. 17 studies; pooled prevalence **6.85%**. doi:10.1111/iwj.14929
- **Umutesi G, Velin L, et al.** Strengthening antimicrobial resistance diagnostic capacity in rural Rwanda: a feasibility assessment. *Ann Glob Health* 2021;87(1):78. doi:10.5334/aogh.3416

### Global
- Antimicrobial Resistance Collaborators. Global burden of bacterial antimicrobial resistance in 2019: a systematic analysis. *Lancet* 2022;399:629–55. doi:10.1016/S0140-6736(21)02724-0
- WHO. *Global guidelines for the prevention of surgical site infection*, 2nd ed. Geneva: WHO; 2018.
- WHO GLASS: https://www.who.int/initiatives/glass

### Genomic outbreak investigation
- Köser CU et al. *N Engl J Med* 2012;366:2267–75. doi:10.1056/NEJMoa1109910 (see Dataset 3)
- Harris SR, Cartwright EJ, Török ME, et al. Whole-genome sequencing for analysis of an outbreak of meticillin-resistant *Staphylococcus aureus*: a descriptive study. *Lancet Infect Dis* 2013;13:130–6. doi:10.1016/S1473-3099(12)70268-2
- Cornick J et al. *Microb Genom* 2021. doi:10.1099/mgen.0.000703 (Malawi *K. pneumoniae*)
