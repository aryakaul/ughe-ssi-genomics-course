# Syllabus — Genomic Surveillance of Surgical Site Infections & AMR
**University of Global Health Equity · 2-day faculty course**

---

## Course description
This hands-on course introduces faculty to using whole-genome sequencing (WGS) of bacterial isolates for surveillance of surgical site infections (SSIs), with a focus on **detecting and tracking antimicrobial resistance (AMR)**. Participants follow the entire path from a wound swab to a public-health decision: how isolates are sequenced (in-house or outsourced), how raw data are checked and assembled, how resistance genes and strain types are identified, and how genomic data are combined with ward and patient information to recognise outbreaks.

No prior coding or bioinformatics experience is needed. All analysis uses **free, browser-based tools** (Galaxy, Pathogenwatch, Microreact) that participants can keep using after the course without buying hardware or software.

## Learning objectives
By the end of the course, participants will be able to:

| # | Objective | Where it's taught | Where it's assessed |
|---|---|---|---|
| LO1 | **Explain** how WGS strengthens SSI and AMR surveillance compared with culture and AST alone | L1 | Quiz Q1–3 |
| LO2 | **Describe** the outputs of Illumina and Oxford Nanopore sequencing and **choose** the right one for a given question | L2, Lab 1, Lab 2 | Quiz Q4–6 |
| LO3 | **Perform** quality control and genome assembly on raw reads in Galaxy, and **judge** whether an assembly is good enough to use | Lab 2, Lab 3 | Lab 2 check-yourself; Quiz Q7–8 |
| LO4 | **Detect** AMR genes and mutations, and **interpret** them alongside phenotypic susceptibility results | L3, Lab 4 | Lab 4; Quiz Q9–11 |
| LO5 | **Type** isolates (species, MLST, SNP distance) and **interpret** a phylogenetic tree to support or rule out an outbreak | L4, Lab 5, Lab 6 | Lab 6 presentation; Quiz Q12–14 |
| LO6 | **Design** a sustainable, outsourced genomic surveillance workflow for their own setting | L2, L5, action planning | Action plan; Quiz Q15 |

## Format
- **2 days**, 08:30–17:00, about 50% hands-on
- Participants work **in pairs**: one "driver" at the keyboard and one "navigator" reading the handout. They swap at each lab.
- Each participant uses their own laptop with a modern web browser (see `00_pre-course/setup_checklist.md`)
- Ratio of at least **1 helper per 6 participants** during labs

---

## Day 1 — Foundations: from wound swab to genome

| Time | Session | Type | Materials |
|---|---|---|---|
| 08:30–09:00 | Welcome, introductions, course goals, **pre-assessment** | — | `00_pre-course/pre-assessment.md` |
| 09:00–09:45 | **L1 · SSIs, AMR and why genomics?** The burden of SSI and AMR, SSI-relevant pathogens (ESKAPE + *E. coli*), what culture/AST can and cannot tell us, real outbreak examples | Lecture | `slides/L1_ssi_amr_why_genomics.md` |
| 09:45–10:30 | **L2 · From sample to sequence.** DNA → library → sequencer; Illumina vs Nanopore; what a "read" is; coverage; costs; **outsourcing** (what to send, to whom, what you get back); metadata | Lecture | `slides/L2_sample_to_sequence.md` |
| 10:30–10:45 | *Break* | | |
| 10:45–12:15 | **Lab 1 · Files, formats and your first Galaxy history.** Files and folders; plain-text formats (FASTA, FASTQ, CSV/TSV); reading a quality score; Galaxy tour; uploading data; running your first tool | Hands-on | `labs/Lab1_files_formats_galaxy.md` |
| 12:15–13:00 | *Lunch* | | |
| 13:00–13:45 | **L3 · How bacteria resist antibiotics.** Acquired genes vs chromosomal mutations; plasmids and mobile elements; key SSI resistance mechanisms (*mecA*, ESBLs, carbapenemases); predicting phenotype from genotype and its limits | Lecture | `slides/L3_amr_mechanisms.md` |
| 13:45–15:30 | **Lab 2 · Quality control and genome assembly.** Illumina track: FastQC → fastp → Shovill → QUAST. Nanopore track: NanoPlot → Flye → QUAST. Pairs compare results across tracks | Hands-on | `labs/Lab2_qc_assembly.md` |
| 15:30–15:45 | *Break* | | |
| 15:45–16:45 | **Lab 3 · A look under the hood: the command line.** Navigating folders, viewing files, counting reads with `wc` and `grep`. Connects directly to what Galaxy did in Lab 2 | Hands-on | `labs/Lab3_command_line_taster.md` |
| 16:45–17:00 | Recap; **"muddiest point" exit ticket** (one sticky note: *What is still unclear?*) | — | |

## Day 2 — From genomes to surveillance action

| Time | Session | Type | Materials |
|---|---|---|---|
| 08:30–08:50 | Recap; answers to Day-1 exit tickets | — | |
| 08:50–10:30 | **Lab 4 · Who is it, and what does it resist?** Species ID (Kraken2), MLST, AMR gene detection (AMRFinderPlus, ABRicate/ResFinder/CARD), plasmid detection; comparing genotype with an AST report | Hands-on | `labs/Lab4_species_typing_amr.md` |
| 10:30–10:45 | *Break* | | |
| 10:45–11:30 | **L4 · Typing, trees and outbreaks.** MLST vs cgMLST vs SNPs; reading a phylogenetic tree; SNP thresholds; combining genomic data with time, place and person | Lecture | `slides/L4_typing_phylogenetics_outbreaks.md` |
| 11:30–12:30 | **Lab 5 · Pathogenwatch and Microreact.** Upload assemblies → automatic species, typing, AMR, clustering; build an interactive tree + timeline + map | Hands-on | `labs/Lab5_pathogenwatch_microreact.md` |
| 12:30–13:15 | *Lunch* | | |
| 13:15–15:00 | **Lab 6 · Case study: a cluster on the surgical ward.** Groups of 4 analyse isolates and metadata, decide whether it is an outbreak, and present a 5-minute briefing to a mock IPC committee | Group work | `labs/Lab6_ssi_outbreak_case_study.md` |
| 15:00–15:15 | *Break* | | |
| 15:15–16:00 | **L5 · Building a sustainable programme.** Sampling strategy; biobanking isolates; data management, ethics and sharing; reporting to clinicians; partners and funding; next learning steps | Lecture + discussion | `slides/L5_sustainable_program.md` |
| 16:00–16:40 | **Action planning.** Each participant drafts a one-page plan for a genomic surveillance mini-project (template in L5) | Workshop | |
| 16:40–17:00 | **Post-assessment**, course evaluation, certificates | — | |

---

## Assessment (formative, no grades)
| Component | Purpose |
|---|---|
| Pre/post quiz (15 questions) | Measures knowledge gained; the same quiz is used at both points |
| "Check yourself" questions in each lab | Immediate self-check; answers in the facilitator guide |
| Lab 6 group briefing | Applies LO3–LO5 to a realistic scenario |
| One-page action plan | Applies LO6 to the participant's own setting |
| Exit tickets and evaluation | Course improvement |

## Pre-course requirements
- Laptop (Windows, macOS, Linux or ChromeOS) with Chrome or Firefox and at least 8 GB RAM recommended
- **Galaxy account** created before Day 1 (usegalaxy.eu; instructions in setup checklist)
- **Pathogenwatch account** (free)
- Optional 20-minute pre-reading: `resources/glossary.md`

## After the course
- All Galaxy histories stay in participants' accounts and can be re-run on new data
- Suggested learning pathway: `resources/further_learning.md`
- Recommended follow-up: a monthly 1-hour "genomics journal club / data clinic" for course graduates
