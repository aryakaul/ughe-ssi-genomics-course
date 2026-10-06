# L1 · Surgical Site Infections, AMR and Why Genomics?
**Day 1 · 09:00–09:45 · 45 min (≈ 30 min talk + 15 min discussion)**
**Objective:** LO1 — Explain how WGS strengthens SSI and AMR surveillance compared with culture and AST alone

---

### Slide 1 — Title
- Genomic surveillance of SSIs: why it matters here
- *Speaker note:* Open with a question to the room: "Think of the last surgical patient you saw with an infection that didn't respond to first-line antibiotics. What did we learn about where it came from?" Take 2–3 answers.

### Slide 2 — What is a surgical site infection?
- An infection at or near the surgical incision within 30 days (or 90 days with an implant)
- Three levels: superficial incisional, deep incisional, organ/space
- *Figure idea:* cross-section of the abdominal wall showing the three levels (CDC/NHSN definition)

### Slide 3 — The burden
- SSI is the **most common healthcare-associated infection in low- and middle-income countries** (WHO)
- Post-caesarean SSI is a major problem in sub-Saharan Africa, including rural Rwanda → *see local data slide*
- Consequences: longer stays, reoperation, catastrophic household costs, death
- *Speaker note:* Keep it concrete and local. Swap in UGHE/Butaro/Kirehe data where available.

### Slide 4 — Local evidence (Rwanda)
- Post-caesarean SSI at Kirehe District Hospital: **10.9%** at post-operative day 10 (Nkurunziza et al., *Br J Surg* 2019) and **5.7%** in a later cohort (Velin et al., *Ann Glob Health* 2021)
- National pooled estimate for post-caesarean SSI: **6.85%** (meta-analysis of 17 studies, Sibomana et al., *Int Wound J* 2024)
- Resistance in SSI isolates from Kirehe (Velin et al. 2021):
  - **68%** of isolates were Gram-negative
  - **0%** of Gram-negatives were susceptible to ampicillin
  - **92%** were intermediate or resistant to **ceftriaxone**, the standard empiric drug
- Message: culture and AST capacity is still limited (Umutesi et al. 2021), and we **don't know which resistance genes or clones** are behind these numbers. That is the gap genomics fills.
- *Speaker note:* Several of these studies were led by UGHE-affiliated researchers. If possible, invite one of them to speak for 5 minutes.
- Discussion prompt: "What fraction of SSIs in our hospitals get a culture? An AST?"

### Slide 5 — AMR: the global picture
- 2019: an estimated **1.27 million deaths directly attributable** to bacterial AMR, and 4.95 million associated (GRAM study, *Lancet* 2022)
- The highest death rate was in **sub-Saharan Africa**
- Six leading pathogens: *E. coli, S. aureus, K. pneumoniae, S. pneumoniae, A. baumannii, P. aeruginosa*. Five of these are common causes of SSI.

### Slide 6 — SSI pathogens to know
| Pathogen | Why it matters for SSI | Key resistance to watch |
|---|---|---|
| *Staphylococcus aureus* | Most common SSI cause worldwide | MRSA (*mecA/mecC*) |
| *Escherichia coli* | Abdominal and obstetric surgery | ESBLs (CTX-M), carbapenemases |
| *Klebsiella pneumoniae* | Hospital outbreaks, high-risk clones | ESBLs, carbapenemases (KPC, NDM, OXA-48) |
| *Acinetobacter baumannii* | ICU and trauma wounds | Carbapenemases (OXA-23) |
| *Pseudomonas aeruginosa* | Burns, wounds | Efflux, porin loss, VIM/IMP |
| *Enterobacter* spp. | Hospital-acquired | AmpC, carbapenemases |
- *Speaker note:* Introduce the "ESKAPE" acronym (*Enterococcus, S. aureus, Klebsiella, Acinetobacter, Pseudomonas, Enterobacter*).

### Slide 7 — What our current tools tell us
- **Culture** → *which organism?*
- **AST (antibiotic susceptibility testing)** → *which drugs work?*
- These are essential for treating **this patient**.
- But they can't answer:
  - *Are these 5 patients infected with the **same** strain?* (outbreak vs coincidence)
  - *Is resistance spreading on a **plasmid** between different species?*
  - *Is a known **high-risk clone** circulating?*

### Slide 8 — What a genome adds
- A bacterial genome is about 2–6 million letters (A, C, G, T)
- From one genome we can get:
  1. Species identification (confirms or corrects lab ID)
  2. Strain type (MLST, cgMLST): "the bacterium's surname"
  3. AMR genes and mutations, and **where** they sit (chromosome vs plasmid)
  4. Virulence genes
  5. Relatedness to other isolates (SNP distance), the basis for outbreak detection
- *Figure idea:* one genome → five outputs, as a fan diagram

### Slide 9 — Case example: genomics changing an outbreak response
- Example: Köser et al., *NEJM* 2012 and Harris et al., *Lancet Infect Dis* 2013. MRSA on a neonatal unit in Cambridge, UK. WGS showed which cases were linked, identified a staff carrier, and ended an outbreak that conventional methods had missed.
- Message: **genomics changed the IPC decision**
- *Speaker note:* We'll return to this kind of reasoning in Lab 6.

### Slide 10 — Genomic surveillance ≠ owning a sequencer
- The workflow: **collect → store → send → analyse → act**
- Sequencing can be done by a reference lab or a service provider
- What stays local is the expertise: choosing isolates, recording metadata, analysing, interpreting, communicating
- Africa CDC's Pathogen Genomics Initiative and national labs are building this network
- *Speaker note:* This is the central message of the course.

### Slide 11 — Roadmap for the 2 days
- Day 1: the data (what sequencing produces and how to turn it into a genome)
- Day 2: the answers (resistance, strain types, outbreaks, a sustainable programme)

### Discussion (15 min, pairs → plenary)
1. Describe one situation in your work where knowing "are these infections linked?" would have changed what you did.
2. What happens to bacterial isolates in our labs after AST is done? Are they stored?

---
**Key references** (full citations in `00_pre-course/datasets.md`)
- WHO. *Global guidelines for the prevention of surgical site infection*, 2nd ed. 2018.
- Antimicrobial Resistance Collaborators. Global burden of bacterial antimicrobial resistance in 2019. *Lancet* 2022;399:629–55.
- Köser CU et al. Rapid whole-genome sequencing for investigation of a neonatal MRSA outbreak. *NEJM* 2012;366:2267–75.
