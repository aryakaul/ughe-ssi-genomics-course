# L3 · How Bacteria Resist Antibiotics
**Day 1 · 13:00–13:45 · 45 min**
**Objective:** LO4 (part) — Understand the genetic basis of AMR so that genome results can be interpreted

---

### Slide 1 — Four ways to survive an antibiotic
1. **Destroy or modify the drug.** Enzymes such as β-lactamases cut penicillins and cephalosporins.
2. **Change the target.** The drug no longer binds (e.g. PBP2a in MRSA, *gyrA* mutations and fluoroquinolones).
3. **Pump it out.** Efflux pumps.
4. **Keep it out.** Fewer or changed porins (outer-membrane channels) in Gram-negatives.
- *Figure idea:* one bacterial cell with four labelled mechanisms

### Slide 2 — Where resistance comes from: two routes
| Route | What happens | Example | How we detect it in a genome |
|---|---|---|---|
| **Acquired gene** | Bacterium picks up a new gene from another bacterium | *bla*<sub>CTX-M-15</sub>, *mecA*, *bla*<sub>NDM-1</sub> | Search for the gene (present or absent) |
| **Chromosomal mutation** | A change in the bacterium's own gene | *gyrA* S83L (ciprofloxacin), *mgrB* disruption (colistin) | Compare with a reference and look for specific mutations |

### Slide 3 — Mobile genetic elements: why resistance spreads so fast
- **Plasmids**: small, circular DNA molecules that can be copied **between bacteria, even between species**
- **Transposons and integrons**: "cut-and-paste" elements that move genes around
- A single plasmid can carry **many** resistance genes at once (multi-drug resistance in one step)
- *Figure idea:* plasmid conjugation between *Klebsiella* and *E. coli*
- Message: in a hospital, a resistant **plasmid** can spread even when the **strain** is not spreading. Genomics can tell these apart.

### Slide 4 — Key mechanisms for SSI pathogens
| Organism | Mechanism | Gene(s) to recognise | Clinical effect |
|---|---|---|---|
| *S. aureus* | Altered PBP | *mecA*, *mecC* | MRSA: resistant to almost all β-lactams |
| Enterobacterales (*E. coli*, *Klebsiella*, *Enterobacter*) | Extended-spectrum β-lactamase | *bla*<sub>CTX-M</sub>, *bla*<sub>SHV</sub> (ESBL variants), *bla*<sub>TEM</sub> (ESBL variants) | Resistant to 3rd-generation cephalosporins (ceftriaxone) |
| Enterobacterales | Carbapenemase | *bla*<sub>KPC</sub>, *bla*<sub>NDM</sub>, *bla*<sub>OXA-48-like</sub>, *bla*<sub>VIM</sub>, *bla*<sub>IMP</sub> | Resistant to carbapenems, the "last line" |
| *A. baumannii* | Carbapenemase | *bla*<sub>OXA-23</sub>, *bla*<sub>OXA-24/40</sub> | Carbapenem resistance |
| Many Gram-negatives | Target mutations | *gyrA*, *parC* | Fluoroquinolone resistance |
| Many Gram-negatives | Aminoglycoside-modifying enzymes, 16S methylases | *aac*, *aph*, *ant*, *armA*, *rmtB* | Gentamicin/amikacin resistance |
- *Speaker note:* You do not need to memorise gene names. The tools will report them, and the glossary has a cheat sheet. The point is to recognise the **big four**: *mecA*, CTX-M, carbapenemases, *gyrA*.

### Slide 5 — Reading gene names
- `blaCTX-M-15` → *bla* = β-lactamase · CTX-M = family · 15 = variant
- `aac(6')-Ib-cr` → aminoglycoside acetyltransferase; "cr" = also affects ciprofloxacin
- `mecA` → methicillin resistance
- *Exercise (1 min):* "What do you predict `blaNDM-1` does?"

### Slide 6 — Genotype → phenotype: how well does it work?
- For many organism–drug pairs, predicting resistance from the genome agrees **very well** with lab AST (e.g. *S. aureus*, and β-lactams in *E. coli/Klebsiella*)
- It works **less well** when resistance depends on:
  - gene **expression** levels (efflux, AmpC overexpression)
  - **combinations** of porin loss + weak enzymes
  - **unknown** mechanisms not yet in databases
- **Genotype is not a replacement for AST in patient care.** It is a complement for surveillance and investigation.

### Slide 7 — When genotype and AST disagree
| Genome says | AST says | Possible explanations |
|---|---|---|
| Resistance gene present | Susceptible | Gene not expressed or broken; lab error; mixed culture |
| No gene found | Resistant | Unknown mechanism; mutation not in database; low coverage missed the gene; mixed culture |
- *Speaker note:* Disagreements are **useful**. They point to new mechanisms or to lab QC problems. We'll practise this in Lab 4.

### Slide 8 — AMR databases & tools (preview of Lab 4)
| Tool / database | Maintained by | Notes |
|---|---|---|
| **AMRFinderPlus** | NCBI (USA) | Genes + point mutations; organism-aware |
| **ResFinder / PointFinder** | Center for Genomic Epidemiology (Denmark) | Web tool; phenotype predictions |
| **CARD / RGI** | McMaster University (Canada) | Very comprehensive ontology |
| **ABRicate** | Community tool | Fast screening against several databases |
- The tools may **disagree slightly** because their databases differ. Report which tool and database version you used.

### Slide 9 — Summary
- Resistance = **genes** (often mobile) + **mutations**
- Plasmids let resistance spread between species
- Genome-based prediction is powerful but has limits, so always **read it next to AST**
- Next: let's make some genomes (Lab 2)
