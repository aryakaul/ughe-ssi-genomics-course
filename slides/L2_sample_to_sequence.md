# L2 · From Sample to Sequence
**Day 1 · 09:45–10:30 · 45 min**
**Objectives:** LO2 — Describe Illumina and Nanopore outputs and choose between them; LO6 (part) — understand the outsourcing workflow

---

### Slide 1 — The journey of an isolate
`Wound swab → culture → pure isolate → DNA extraction → library prep → sequencing → data files → analysis`
- *Figure idea:* horizontal pipeline with icons. Highlight that **everything up to "pure isolate" already happens in our labs**.

### Slide 2 — Why we sequence isolates, not swabs
- An **isolate** is a pure culture of one bacterium, so its genome is clean
- Sequencing a swab directly (**metagenomics**) mixes human DNA with many microbes: harder and more expensive
- For SSI surveillance, **isolate sequencing is the standard**
- Practical point: **store your isolates** (−80 °C or glycerol stocks). You can't sequence what you threw away.

### Slide 3 — DNA extraction & library preparation (conceptual)
- Extraction: break open the cells and purify the DNA
- Library prep: cut or tag the DNA and add short "adapter" sequences so the machine can read it
- Many samples can be **multiplexed** (barcoded) and run together, which lowers the cost per genome
- *Speaker note:* Participants don't need to do this; they need to know it exists, because poor-quality DNA leads to poor data (we'll see this in Lab 2).

### Slide 4 — Two main technologies
| | **Illumina** (short-read) | **Oxford Nanopore** (long-read) |
|---|---|---|
| How it works | Fluorescent bases imaged as DNA is copied | DNA strand passes through a protein pore and changes in electrical current are decoded |
| Read length | 100–300 letters (usually paired) | Thousands to 100,000+ letters |
| Per-read accuracy | Very high | Lower historically; now high with modern chemistry |
| Strength | SNP-level accuracy for outbreak work | Complete genomes, resolves **plasmids** |
| Equipment | Large, expensive, central labs | MinION is pocket-sized, lower capital cost |
| Output file | FASTQ (R1 + R2 pair) | FASTQ (one file) |
- *Figure idea:* jigsaw analogy. Illumina = many tiny pieces; Nanopore = fewer big pieces.

### Slide 5 — What is a "read"?
- A read is one piece of DNA sequence produced by the machine
- One bacterial genome sequencing run gives **hundreds of thousands to millions of reads**
- We reassemble the reads into the genome, like rebuilding a shredded book from many overlapping copies

### Slide 6 — Coverage (depth)
- **Coverage** = how many reads, on average, cover each position in the genome
- Formula: (number of reads × read length) ÷ genome size
- Example: 1,000,000 reads × 150 letters ÷ 5,000,000 = **30× coverage**
- Rule of thumb for bacterial WGS: **≥ 30× Illumina**, **≥ 40–50× Nanopore**
- *Speaker note:* Do this calculation together on the board.

### Slide 7 — Which should I use?
| Question | Best choice |
|---|---|
| Is this an outbreak? (fine SNP differences) | Illumina (or high-accuracy Nanopore) |
| Is resistance on a plasmid that is moving between species? | Nanopore (or hybrid) |
| Need results fast, locally | Nanopore |
| Lowest cost per genome at large scale | Illumina (batched) |
| Best of both | **Hybrid** assembly (Illumina + Nanopore) |
- Message: **your sequencing partner may use either. This course teaches both.**

### Slide 8 — Outsourcing: how it works in practice
1. Agree on a partner: national reference lab, regional hub (Africa CDC PGI network), academic collaborator, or commercial service
2. Ship **isolates** or **extracted DNA**, following the partner's instructions (biosafety, permits, material transfer agreement)
3. Partner sequences and returns **FASTQ files** (sometimes also assemblies and reports)
4. **You analyse** (this course) and keep the data
- Ask the partner: *Which platform? What coverage? Raw reads included? Turnaround? Cost per isolate? Data-sharing terms?*

### Slide 9 — Metadata: the most underrated part
- A genome with no information about **when, where and from whom** it came is almost useless for surveillance
- Minimum metadata: isolate ID, collection date, facility, ward, specimen type (e.g. wound swab), type of surgery, date of surgery, AST results
- Standards: **PHA4GE** contextual data specifications
- Protect privacy: **never** put names or patient IDs in files you share; use coded study IDs
- *Speaker note:* Most failed genomic surveillance projects fail on metadata, not sequencing.

### Slide 10 — What files come back?
- `sample_R1.fastq.gz`, `sample_R2.fastq.gz` (Illumina) or `sample.fastq.gz` (Nanopore)
- Sometimes `sample.fasta` (assembly) and a QC report
- **Preview of Lab 1:** we'll open these files and look inside

### Quick check (2 min, show of hands)
- "You want to know if 6 MRSA isolates from one ward are an outbreak. Which data would you request?" → Illumina, ≥ 30×, with dates and ward metadata
- "You suspect a carbapenemase gene is jumping between *Klebsiella* and *E. coli*." → Nanopore or hybrid, to resolve plasmids
