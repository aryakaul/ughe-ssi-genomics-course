#import "/slides/theme.typ": *
#show: deck.with(lab: "Lab 2", title: "Quality Control and Genome Assembly")

#title-slide(
  lab: "Lab 2",
  title: [Quality Control and \ Genome Assembly],
  when: "Day 1 · 13:45–15:30 · 105 min",
  mode: "Pairs · half the room on the Illumina track, half on the Nanopore track",
  objective: "LO3: perform QC and assembly on raw reads in Galaxy, and judge whether an assembly is good enough to use",
)

#open-handout("Lab 2", "Lab2_qc_assembly.pdf")

#slide(title: "One isolate, sequenced twice")[
  - An *MRSA* strain (KUN1163), sequenced on *Illumina* and on *Oxford Nanopore*
  - Half the pairs take each track; at the end you compare
  #v(0.3em)
  #tip(label: "Strategy")[
    Assembly takes *20–60 min*. Start it early and interpret QC while it runs. \
    Not finished by *15:00*? Use the fallback (Part E).
  ]
]

#slide(title: "Plan for this lab")[
  #table(
    columns: (auto, 1fr, auto),
    th[Part][What][Time],
    [A], [Set up and upload], [10 min],
    [B–D], [Check quality → clean → start assembly], [35 min],
    [F], [Interpret QC while it runs], [20 min],
    [G], [Assess the assembly], [15 min],
    [H], [Compare tracks], [10 min],
  )
]

#slide(part: "Part A · Set up", time: "10 min", title: "Upload your track's reads")[
  + New history: `Lab2 – Illumina` *or* `Lab2 – Nanopore`
  + *Upload → Paste/Fetch data* → paste the URL(s) *from your handout*
  + *Type:* `fastqsanger.bz2` → *Start*
  + Rename: `illumina_R1` + `illumina_R2`, *or* `nanopore_reads`
  #v(0.3em)
  #check[Why are there two Illumina files but only one Nanopore file?]
]

#slide(part: "Illumina track · Parts B-I to D-I", title: "Illumina: check, clean, assemble")[
  #flow("FastQC", "fastp", "Shovill")
  #v(0.4em)
  + *FastQC* on `illumina_R1`, then on `illumina_R2`
  + *fastp:* Paired · R1 and R2 · defaults
  + *Shovill:* Paired-end · the two fastp outputs · defaults
  #v(0.3em)
  #tip[Shovill can't see the fastp files? Pencil icon → *Datatypes* → `fastqsanger.gz`]
]

#slide(part: "Nanopore track · Parts B-N to D-N", title: "Nanopore: check, filter, assemble")[
  #flow("NanoPlot", "filtlong", "Flye")
  #v(0.4em)
  + *NanoPlot* on `nanopore_reads`
  + *filtlong:* Min. length `1000` · defaults
  + *Flye:* filtlong output · Mode *Nanopore corrected* · defaults
]

#banner([Assembly running?], sub: [Don't wait for it: go on to Part F and interpret your QC])

#slide(part: "Part F · Both tracks", time: "20 min", title: "Interpret your QC")[
  #table(
    columns: (1fr, auto),
    th[][Your track],
    [Number of reads], [#h(3cm)],
    [Typical read length], [],
    [Total bases (≈ reads × length)], [],
    [*Coverage* = total bases ÷ 2.8 Mb], [],
    [Quality good enough? Why?], [],
  )
]

#slide(part: "Part F · Both tracks", title: "Check yourself: quality")[
  #check[
    + Is your coverage above the minimum? \ (≈ 30× Illumina, ≈ 40–50× Nanopore)
    + Look at the report from a *bad* run on the screen. What looks different?
  ]
]

#slide(part: "Part G · Both tracks", time: "15 min", title: "Assess the assembly with QUAST")[
  *Quast* → your Shovill `contigs` or Flye `assembly` → defaults → HTML report
  #table(
    columns: (auto, 1fr),
    th[Metric][Good sign for _S. aureus_],
    [*\# contigs* (pieces)], [Illumina: tens to ≈ 100 · Nanopore: 1–5],
    [*Total length*], [≈ 2.7–3.0 Mb],
    [*N50*], [Bigger is better],
    [*GC (%)*], [≈ 33%],
  )
]

#slide(part: "Part G · Both tracks", title: "Check yourself: assembly")[
  #check[
    + Is the total length close to the expected genome size?
    + What would a total length of *5.6 Mb* suggest?
    + Would you accept this assembly for AMR analysis? Why?
  ]
]

#slide(part: "Part H · Illumina pair + Nanopore pair", time: "10 min", title: "Compare the two tracks")[
  #cols(ratio: (1fr, 1.1fr))[
    #table(
      columns: (auto, 1fr, 1fr),
      th[][Illumina][Nanopore],
      [\# contigs], [], [],
      [Largest contig], [], [],
      [Total length], [], [],
      [N50], [], [],
    )
  ][
    - Which is more *complete*?
    - Which is more *accurate*?
    - Gene on a *plasmid*? Which would you prefer?
    - What would a *hybrid* give you?
  ]
]

#slide(part: "Part E · Fallback", title: "Still running at 15:00?")[
  + Open the shared history link (handout Part E): \
    *usegalaxy.eu/u/aryakaul/h/ughe-ssi-course-precomputed*
  + Click *Import*
  + Use the Shovill or Flye assembly and its QUAST report
  + Continue from Part G
  #tip[Your own job *keeps running*. Check it tonight!]
]

#slide(title: "Summary")[
  #text(weight: "bold")[Illumina] → many accurate contigs
  #flow("FastQC", "fastp", "Shovill", "QUAST", size: 18pt)
  #v(0.3em)
  #text(weight: "bold")[Nanopore] → few long contigs (≈ complete genome)
  #flow("NanoPlot", "filtlong", "Flye", "QUAST", size: 18pt)
  #v(0.3em)
  Tomorrow: *what is in this genome?*
  #credit[Adapted from the Galaxy Training Network "Bacterial Genome Assembly" tutorials (Shovill, Flye) (CC-BY 4.0).]
]
