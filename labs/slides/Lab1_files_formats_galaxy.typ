#import "/slides/theme.typ": *
#show: deck.with(lab: "Lab 1", title: "Files, Formats and Your First Galaxy History")

#title-slide(
  lab: "Lab 1",
  title: [Files, Formats and \ Your First Galaxy History],
  when: "Day 1 · 10:45–12:15 · 90 min",
  mode: "Pairs: driver + navigator · swap at Part C",
  objective: "LO2, LO3: recognise genomic file formats, read a quality score, and run a tool in Galaxy",
)

#open-handout("Lab 1", "Lab1_files_formats_galaxy.pdf")

#slide(title: "Plan for this lab")[
  #table(
    columns: (auto, 1fr, auto),
    th[Part][What][Time],
    [A], [Files and folders], [15 min],
    [B], [Looking inside the formats], [25 min],
    [C], [Your first Galaxy history], [40 min],
    [], [Wrap-up], [10 min],
  )
]

#slide(title: "Before you start")[
  - Log in to `usegalaxy.eu`
  - *Driver:* hands on the keyboard
  - *Navigator:* reads the handout and spots mistakes
  #v(0.3em)
  #tip[Stuck or have a question? *Raise your hand* and the instructor will come to you.]
]

#slide(part: "Part A · Files and folders", time: "15 min", title: "What's in a file name?")[
  #align(center, text(size: 32pt)[`isolate01_R1.fastq.gz`])
  #align(center, table(
    columns: 4,
    align: center,
    [`isolate01`], [`R1`], [`.fastq`], [`.gz`],
    [sample name], [read 1 of a pair], [format], [compressed],
  ))
  #check[What do you expect is inside `UGHE-SSI-0042_R2.fastq.gz`?]
]

#slide(part: "Part A · Files and folders", title: "Two more things to know")[
  - *Plain-text files* (FASTA, FASTQ, CSV) are just letters: any text editor can open them
  - *Genomic files are big*: 200 MB–1 GB per isolate
  #v(0.3em)
  #key[That's why we analyse in Galaxy, on computers on the internet, not on our laptops.]
]

#slide(part: "Part B1 · Inside the formats", time: "25 min for Part B", title: "FASTA: just sequence")[
```
>contig_1 length=120
TTCGCTCTATTGACTACGACGCGCTCATTCCCTTGTCGGAGAGTTATGGAACAAGGACGC
TGTCTGAGACTAGAAGACAGATAGTGCACACGACCGGCGTCGGAGAAACTCTATTTGCCG
>contig_2 length=60
CCTGACAAGTCAATGCGATCCGTAGGGGCAGCGCAGTATGCCAAGACTATAGGCACTGTC
```
  - Each entry starts with `>` and a *name*; the sequence follows
  - *Assemblies* (genomes) are stored in FASTA
  #check[How many sequences? How many bases in total?]
]

#slide(part: "Part B2 · Inside the formats", title: "FASTQ: sequence + quality (raw reads)")[
  Every read takes *exactly 4 lines*:
  #table(
    columns: (auto, auto, 1fr),
    th[Line][Example][Meaning],
    [1], [`@SSI_isolate_01_read1`], [`@` + read name],
    [2], [`GCTAAAGACAATTACATAACATACACGTCAGCACGAAACT`], [the DNA sequence],
    [3], [`+`], [separator],
    [4], [`GHHGFGHIIIIIFIGGHGIFIIGHIHIGHIIGFHHDACBC`], [quality, one symbol per base],
  )
]

#slide(part: "Part B2 · Inside the formats", title: "Reading a quality score")[
  #table(
    columns: (auto, 1fr, 1fr, 1fr, 1fr, 1fr),
    align: (left, center, center, center, center, center),
    th[Symbol][`#`][`+`][`5`][`?`][`I`],
    [*Q score*], [2], [10], [20], [30], [40],
    [*Chance it's wrong*], [≈ 63%], [1 in 10], [1 in 100], [1 in 1,000], [1 in 10,000],
  )
  #v(0.3em)
  #tip(label: "Rule of thumb")[Capital letters (`A`–`J`) and `?` or `@` are good (Q30 and above). \ Symbols like `#`, `$`, `%`, `&` are bad (below Q10).]
]

#slide(part: "Part B2 · Inside the formats", title: "Check yourself: read 4")[
  #align(center, text(size: 26pt)[`IIHFGIIIFIIIIIFIIHFIIIIHI#'&'##&%''''$(%`])
  #v(0.5em)
  #check[
    + Which part of read 4 (start or end) has poor quality?
    + What should we do with those bases?
  ]
]

#slide(part: "Part B3 · Inside the formats", title: "CSV / TSV: tables")[
```
isolate_id,organism,collection_date,ward
UGHE-SSI-0001,Klebsiella pneumoniae,2026-03-02,Maternity
UGHE-SSI-0002,Escherichia coli,2026-03-05,Surgical
```
  - One row per isolate, one column per piece of information
  - Commas (CSV) or tabs (TSV) separate the columns
  - They open in Excel or Google Sheets
]

#swap

#slide(part: "Part C1 · Your first Galaxy history", time: "40 min for Part C", title: "A tour of Galaxy")[
  #cols(ratio: (1.3fr, 1fr))[
    - *Left, Tools:* search box and tool list
    - *Centre:* tool forms and results
    - *Right, History:* your files (*datasets*), in order
  ][
    #table(
      columns: (auto, 1fr),
      th[Colour][Meaning],
      table.cell(fill: rgb("#d9f2d9"))[green], [finished],
      table.cell(fill: rgb("#fff3c4"))[yellow], [running],
      table.cell(fill: luma(230))[grey], [queued],
      table.cell(fill: rgb("#f9d4d4"))[red], [error],
    )
  ]
]

#slide(part: "Parts C2–C3", title: "Create a history and upload data")[
  + History panel → *"+"* → rename it `Lab1 – formats`
  + *Upload* → *Paste/Fetch data* → paste the *4 reads* from your handout
  + *Type:* `fastqsanger` · *Name:* `tiny_reads.fastq`
  + *Start* → *Close*
  + When it turns *green*: click the name, then the *eye icon*
]

#slide(part: "Part C4", title: "Run your first tool: count lines")[
  + Search the tools: *Line/Word/Character count*
  + "Text file" → `tiny_reads.fastq`
  + *Run tool*, then view the result (eye icon)
  #v(0.3em)
  #check[How many lines? How many reads is that? _(4 lines per read)_]
]

#slide(part: "Part C5", title: "Run a real QC tool: FastQC")[
  + Search the tools: *FastQC* → input `tiny_reads.fastq` → *Run tool*
  + Open the *Webpage* output (eye icon)
  + Find *"Per base sequence quality"*
  #v(0.3em)
  #check[
    - Does quality go up or down towards the end of the reads?
    - Would you trust a report based on only 4 reads?
  ]
]

#slide(part: "Part C6", title: "Your history is a lab notebook")[
  - Click a dataset, then the *"i"* (Dataset details) icon
  - Galaxy records the *exact* tool, version and settings
  #v(0.3em)
  #key[This is reproducibility: anyone can see and repeat what you did.]
]

#slide(title: "Wrap-up")[
  #table(
    columns: (auto, 1fr),
    th[Format][Holds],
    [*FASTA*], [sequences (assemblies)],
    [*FASTQ*], [reads + quality (raw data)],
    [*CSV / TSV*], [tables (metadata, results)],
  )
  #v(0.3em)
  #flow("Upload", "Choose tool", "Run", "View", size: 18pt)
  #v(0.3em)
  After lunch: *real* reads from a bacterial isolate.
  #credit[Adapted from the Galaxy Training Network "Introduction to Galaxy" and "Quality Control" tutorials (CC-BY 4.0).]
]
