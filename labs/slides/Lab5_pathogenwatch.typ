#import "/slides/theme.typ": *
#show: deck.with(lab: "Lab 5", title: "Pathogenwatch")

#title-slide(
  lab: "Lab 5",
  title: [Pathogenwatch: \ Many Genomes at Once],
  when: "Day 2 · 11:30–12:30 · 60 min",
  mode: "Pairs",
  objective: "LO5: use a free web platform to type, screen and visualise a collection of genomes",
)

#open-handout("Lab 5", "Lab5_pathogenwatch.pdf")

#slide(title: "The scenario")[
  - The IPC nurse at *District Hospital A* is worried about more *MRSA SSIs on Surgical Ward B*
  - The lab stored the isolates and sent them for sequencing
  - You have *genomes from all MRSA isolates of the past months*
  #v(0.3em)
  #key[Get a quick overview of all the genomes at once.]
  #text(size: 16pt, fill: muted)[The genomes are real public data. The hospital, wards and dates are fictional.]
]

#slide(title: "Plan for this lab")[
  #table(
    columns: (auto, 1fr, auto),
    th[Part][What][Time],
    [A], [Upload: typing and AMR], [30 min],
    [B], [Tree + timeline + metadata], [25 min],
    [], [Summary], [5 min],
  )
]

#slide(title: "Files from the instructor")[
  #table(
    columns: (auto, 1fr),
    th[File][Contains],
    [`assemblies/`], [One FASTA per isolate],
    [`lab6_metadata.csv`], [Patient, ward, procedure and date information],
    [`koser_snp_matrix.tsv`], [SNP distances (used in Lab 6)],
  )
  - *GitHub:* github.com/aryakaul/ughe-ssi-genomics-course
  - Green *Code* button → *Download ZIP* → unzip → `labs/data/`
]

#slide(part: "Part A1–A2 · Upload", time: "30 min for Part A", title: "Upload and explore")[
  + Log in to `pathogen.watch` → *Upload*
  + Drag in the FASTA assemblies *and* `lab6_metadata.csv` *together*
  + For *at least 6* genomes, record:
  #table(
    columns: (1fr, 1fr, auto, 1.6fr, auto), rows: (auto, 28pt),
    th[Genome][Species][ST][Predicted resistances][QC pass?],
    [], [], [], [], [],
    [], [], [], [], [],
  )
  #text(size: 16pt, fill: muted)[Does the organism agree with the lab? Check the assembly QC metrics (length, contigs, N50).]
]

#slide(part: "Part A3 · Collection", title: "Make a collection and view the tree")[
  + Select all your genomes → *Create collection* → name it `UGHE Lab 5`
  + Open the collection → explore the *tree* view
  + Explore the *AMR* view: resistance profiles side by side
  #check[
    + How many different STs are in the collection?
    + Do all isolates have the *same* AMR profile? What does that suggest, and what does it *not* prove?
    + In the tree, can you see a group of isolates on very *short* branches?
  ]
]

#slide(part: "Part B1 · Metadata", time: "25 min for Part B", title: "Find your metadata")[
  + Open the `UGHE Lab 5` collection
  + Look at the *data tables* at the bottom of the page
  + Find the columns `ward`, `theatre` and `hospital`
  #tip[No metadata columns? Raise your hand.]
]

#slide(part: "Part B2 · Explore", title: "Explore: tree + time + place")[
  #cols(ratio: (1fr, 1.1fr))[
    - *Colour* the tree: click the `ward` column header, then `theatre`, then `hospital`
    - Open the *Timeline*: when did each infection happen?
    - *Click a tip*: find it in the table and timeline
  ][
    #check[
      + Coloured by `ward`: which colour is *Surgical Ward B*? How many tips?
      + Find *P04* in the table: ward and theatre? Now find it on the tree and timeline
      + Which month has the *most* isolates?
    ]
    #text(size: 16pt, fill: muted)[Practice only: you'll interpret the patterns in Lab 6.]
  ]
]

#slide(part: "Part B3", title: "Save, share, summarise")[
  Copy the link to your collection from the address bar. *You'll use it in Lab 6.*
  #table(
    columns: (1fr, auto),
    th[Pathogenwatch gives you][Input],
    [Species, ST, AMR, QC, clustering, global context], [FASTA assemblies],
    [A visual story: tree + time + place + metadata], [Assemblies + a table (CSV)],
  )
  Free and used by public-health labs. *You can use it on Monday with your own data.*
  #credit[Pathogenwatch: Centre for Genomic Pathogen Surveillance.]
]
