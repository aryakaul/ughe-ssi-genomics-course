#import "/slides/theme.typ": *
#show: deck.with(lab: "L2", title: "From Sample to Sequence")
// Speaker notes: slides/L2_sample_to_sequence.md

#title-slide(
  lab: "Lecture 2",
  title: [From Sample to Sequence],
  when: "Day 1 · 09:45–10:30 · 45 min",
  mode: "",
  objective: "LO2: describe Illumina and Nanopore outputs and choose between them · LO6 (part): understand the outsourcing workflow",
)

#slide(title: "The journey of an isolate")[
  #v(0.3em)
  #flow("Wound swab", "Culture", "Pure isolate", size: 20pt, hl: (0, 1, 2))
  #v(0.4em)
  #flow("DNA extraction", "Library prep", "Sequencing", "Data files", "Analysis", size: 18pt)
  #v(0.6em)
  #key[Everything up to the pure isolate (dark boxes) already happens in our labs.]
]

#slide(title: "We sequence isolates, not swabs")[
  - An *isolate* is a pure culture of one bacterium, so its genome is clean
  - Sequencing a swab directly (*metagenomics*) mixes human DNA with many microbes: harder and more expensive
  - For SSI surveillance, *isolate sequencing is the standard*
  #v(0.3em)
  #key[Store your isolates (−80 °C or glycerol stocks). You can't sequence what you threw away.]
]

#slide(title: "DNA extraction and library preparation")[
  - *Extraction:* break open the cells and purify the DNA
  - *Library prep:* cut or tag the DNA and add short "adapter" sequences so the machine can read it
  - *Multiplexing:* many samples are barcoded and run together, which lowers the cost per genome
  #v(0.3em)
  #tip[You don't need to do this yourself. But poor-quality DNA gives poor-quality data (Lab 2).]
]

#slide(title: "Two main technologies")[
  #table(
    columns: (auto, 1fr, 1fr),
    th[][Illumina (short reads)][Oxford Nanopore (long reads)],
    [*Read length*], [100–300 letters, in pairs], [thousands to 100,000+ letters],
    [*Accuracy*], [very high], [now high with modern chemistry],
    [*Best for*], [SNP-level outbreak work], [complete genomes, *plasmids*],
    [*Machine*], [large, central labs], [MinION is pocket-sized],
    [*Files*], [FASTQ pair (R1 + R2)], [one FASTQ],
  )
  #text(size: 17pt, fill: muted)[Jigsaw analogy: Illumina gives many tiny pieces; Nanopore gives fewer, bigger pieces.]
]

#slide(title: "What is a read?")[
  - A *read* is one piece of DNA sequence produced by the machine
  - One bacterial genome gives *hundreds of thousands to millions* of reads
  - We put the reads back together into the genome
  #v(0.4em)
  #tip[Like rebuilding a shredded book from many overlapping copies.]
]

#slide(title: "Coverage (depth)")[
  *Coverage* = how many reads, on average, cover each position
  #v(0.3em)
  #align(center, block(fill: accent-soft, inset: 16pt, radius: 6pt)[
    #text(size: 24pt)[(number of reads × read length) ÷ genome size]
  ])
  #v(0.3em)
  #align(center, text(size: 24pt)[1,000,000 × 150 ÷ 5,000,000 = *30×*])
  #v(0.3em)
  #key[Aim for *≥ 30×* with Illumina and *≥ 40–50×* with Nanopore.]
]

#slide(title: "Which should I use?")[
  #table(
    columns: (1fr, auto),
    th[Question][Best choice],
    [Is this an outbreak? (fine SNP differences)], [Illumina],
    [Is resistance on a plasmid moving between species?], [Nanopore or hybrid],
    [Need results fast, locally], [Nanopore],
    [Lowest cost per genome at large scale], [Illumina (batched)],
    [Best of both], [*Hybrid* assembly],
  )
  #key[Your sequencing partner may use either. This course teaches both.]
]

#slide(title: "Outsourcing: how it works")[
  #v(0.3em)
  #flow("Agree on a partner", "Ship isolates or DNA", "Partner sequences", "You analyse", size: 18pt, hl: (3,))
  #v(0.6em)
  - *Partners:* national reference lab, Africa CDC network, academic collaborator, or a commercial service
  - *Shipping:* follow their biosafety rules; you may need permits and a material transfer agreement
  - *You get back:* FASTQ files, sometimes assemblies and reports. *Keep the data.*
]

#slide(title: "Questions to ask a sequencing partner")[
  #tiles(
    columns: 3,
    ([Platform?], [Illumina, Nanopore, or both]),
    ([Coverage?], [≥ 30× Illumina]),
    ([Raw reads?], [Make sure FASTQ files are included]),
    ([Turnaround?], [Weeks from shipping to data]),
    ([Cost?], [Per isolate, including shipping]),
    ([Data sharing?], [Who owns and publishes the data]),
  )
]

#slide(title: "Metadata: the most underrated part")[
  A genome without *when, where and from whom* is almost useless for surveillance.
  #v(0.2em)
  #cols[
    *Minimum fields*
    - isolate ID · collection date
    - facility · ward · specimen type
    - surgery type and date
    - AST results
  ][
    #check(label: "Protect privacy")[*Never* put names or patient IDs in shared files. Use coded study IDs.]
    #v(0.2em)
    #text(size: 17pt)[Standard: *PHA4GE* contextual data specification]
  ]
]

#slide(title: "What files come back?")[
  #table(
    columns: (auto, 1fr),
    th[File][What it is],
    [`sample_R1.fastq.gz` + `sample_R2.fastq.gz`], [Illumina reads (a pair)],
    [`sample.fastq.gz`], [Nanopore reads],
    [`sample.fasta`], [Assembly (sometimes)],
    [QC report], [Sometimes],
  )
  #v(0.3em)
  #tip[In Lab 1 we'll open these files and look inside.]
]

#slide(title: "Quick check (show of hands)")[
  + You want to know if *6 MRSA isolates from one ward* are an outbreak. Which data would you request?
  #v(0.6em)
  2. You suspect a *carbapenemase gene is jumping* between _Klebsiella_ and _E. coli_. Which data would you request?
]

#slide(title: "Quick check: answers")[
  + *Illumina, ≥ 30×*, with collection dates and ward metadata
  #v(0.6em)
  2. *Nanopore or hybrid*, to resolve the plasmids
]
