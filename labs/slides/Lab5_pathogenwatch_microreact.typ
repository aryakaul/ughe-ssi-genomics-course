#import "/slides/theme.typ": *
#show: deck.with(lab: "Lab 5", title: "Pathogenwatch and Microreact")

#title-slide(
  lab: "Lab 5",
  title: [Pathogenwatch and Microreact: \ Many Genomes at Once],
  when: "Day 2 · 11:30–12:30 · 60 min",
  mode: "Pairs",
  objective: "LO5: use free web platforms to type, screen and visualise a collection of genomes",
)

#open-handout("Lab 5", "Lab5_pathogenwatch_microreact.pdf")

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
    [A], [Pathogenwatch: typing and AMR], [30 min],
    [B], [Microreact: tree + timeline], [25 min],
    [], [Summary], [5 min],
  )
]

#slide(title: "Files from the instructor")[
  #table(
    columns: (auto, 1fr),
    th[File][Contains],
    [`assemblies/`], [One FASTA per isolate],
    [`koser_tree.nwk`], [Phylogenetic tree (Galaxy: Snippy → IQ-TREE)],
    [`lab6_metadata.csv`], [Patient, ward, procedure and date information],
  )
  - *GitHub:* github.com/aryakaul/ughe-ssi-genomics-course
  - Green *Code* button → *Download ZIP* → unzip → `labs/data/`
]

#slide(part: "Part A1–A2 · Pathogenwatch", time: "30 min for Part A", title: "Upload and explore")[
  + Log in to `pathogen.watch` → *Upload* → drag in the FASTA assemblies
  + Wait for each genome to be analysed (a few minutes)
  + For *at least 6* genomes, record:
  #table(
    columns: (1fr, 1fr, auto, 1.6fr, auto), rows: (auto, 28pt),
    th[Genome][Species][ST][Predicted resistances][QC pass?],
    [], [], [], [], [],
    [], [], [], [], [],
  )
  #text(size: 16pt, fill: muted)[Does the organism agree with the lab? Check the assembly QC metrics (length, contigs, N50).]
]

#slide(part: "Part A3 · Pathogenwatch", title: "Make a collection and view the tree")[
  + Select all your genomes → *Create collection* → name it `UGHE Lab 5`
  + Open the collection → explore the *tree* view
  + Explore the *AMR* view: resistance profiles side by side
  #check[
    + How many different STs are in the collection?
    + Do all isolates have the *same* AMR profile? What does that suggest, and what does it *not* prove?
    + In the tree, can you see a group of isolates on very *short* branches?
  ]
]

#slide(part: "Part B1 · Microreact", time: "25 min for Part B", title: "Create a project")[
  + Go to `microreact.org` → *Upload* (sign in only if you want to save)
  + Drag in *both* files: `lab6_metadata.csv` and `koser_tree.nwk`
  + Column that links the table to the tree tips → *`id`*
  + Dates: confirm that *`year`*, *`month`*, *`day`* form the date
  + *Continue / Create*
  #tip["No matching IDs"? Raise your hand: the tree labels and the `id` column must match exactly.]
]

#slide(part: "Part B2 · Microreact", title: "Explore: tree + time + place")[
  #cols(ratio: (1fr, 1.1fr))[
    - *Colour* the tree by `ward`, then `theatre`, then `hospital`
    - Open the *Timeline*: when did each infection happen?
    - *Click a tip*: its row lights up in the table and timeline
    - *Lasso-select* a group of close tips: where and when are they?
  ][
    #check[
      + Is there a group that is closely related *and* close in time *and* in the same place?
      + Is any isolate from the *same ward at the same time* *not* in that group?
      + Is any isolate in the group from a *different ward*? What could link it?
    ]
  ]
]

#slide(part: "Part B3", title: "Save, share, summarise")[
  *Save* (if signed in) and copy the project link. *You'll use it in Lab 6.*
  #table(
    columns: (auto, 1fr, auto),
    th[Tool][Gives you][Input],
    [*Pathogenwatch*], [Species, ST, AMR, QC, clustering, global context], [FASTA assemblies],
    [*Microreact*], [Visual story: tree + time + place + metadata], [Tree (Newick) + table (CSV)],
  )
  Both are free and used by national public-health labs. *You can use them on Monday with your own data.*
  #credit[Pathogenwatch: Centre for Genomic Pathogen Surveillance. Microreact: Argimón S, et al. Microb Genom 2016.]
]
