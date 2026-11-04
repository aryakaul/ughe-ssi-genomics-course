#import "/slides/theme.typ": *
#show: deck.with(lab: "L5", title: "Building a Sustainable Programme")
// Speaker notes: slides/L5_sustainable_program.md

#title-slide(
  lab: "Lecture 5",
  title: [Building a Sustainable Genomic \ Surveillance Programme],
  when: "Day 2 · 15:15–16:00 · 45 min",
  mode: "≈ 25 min talk + 20 min discussion",
  objective: "LO6: design a sustainable, outsourced genomic surveillance workflow for your own setting",
)

#slide(title: "What we can do on Monday")[
  #v(0.3em)
  #flow("Collect", "Store", "Send", "Analyse", "Act")
  #v(0.6em)
  No sequencer is needed to start. We need:
  - a *plan* and a clear question
  - *stored isolates* with good *metadata*
  - a sequencing *partner*
  - *people* who can analyse the data
]

#slide(title: "Choose a question first")[
  #table(
    columns: (auto, 1fr, 1fr),
    th[Type][Example][What to sequence],
    [*Outbreak* (reactive)], ["Is this ward cluster one strain?"], [All cluster isolates + a few unrelated controls],
    [*Routine* (proactive)], ["Which ESBL/carbapenemase genes cause our SSIs?"], [e.g. all resistant SSI isolates for 6 months],
    [*Research*], ["Are post-caesarean SSI _E. coli_ from the community?"], [A designed sample with matched community isolates],
  )
]

#statement(
  [Start small.],
  sub: [50–100 well-chosen isolates with complete metadata beat 1,000 random ones.],
)

#slide(title: "Sampling and biobanking")[
  - Store *every* SSI isolate with resistance of interest (at least ESBL, carbapenem-resistant, MRSA)
  - −80 °C freezer or glycerol stocks; a *backup* at a second site if possible
  - Keep an *isolate register* (spreadsheet): study ID, organism, date, ward, specimen, AST, freezer location
  - Agree on labelling *before* you start
]

#slide(title: "Metadata and data management")[
  - Use a template aligned with *PHA4GE* fields
  - *Coded IDs only.* Keep the ID → patient key secure and separate
  - Name files consistently: `UGHE-SSI-0001_R1.fastq.gz`
  - Back up raw reads in *two places*: they can't be replaced
  - Galaxy histories are a free, reproducible record of every analysis
]

#slide(title: "Ethics, agreements and data sharing")[
  - *Surveillance and IPC:* usually covered by routine public-health practice
  - *Research:* needs ethics approval (Rwanda National Ethics Committee + institutional IRB)
  - *Sending isolates abroad:* material transfer agreement (MTA)
  - *Data-sharing agreement:* who owns the data and how it is published
  - *Share genomes publicly* (ENA / NCBI) with non-identifying metadata
  #key[Equity: local investigators should lead the analysis and authorship.]
]

#slide(title: "Partners in the region")[
  #tiles(
    columns: 2,
    ([RBC], [Rwanda Biomedical Centre / National Reference Laboratory]),
    ([Africa CDC PGI], [Regional sequencing and training network]),
    ([ASLM], [AMR surveillance programmes such as MAAP]),
    ([Other partners], [Universities, NGOs, Fleming Fund projects, commercial services]),
  )
  #v(0.3em)
  *Ask the room:* which of these do we already work with?
]

#slide(title: "Reporting results so they change practice")[
  #table(
    columns: (auto, 1fr),
    th[Audience][What they need],
    [*Clinicians*], ["This isolate carries an NDM carbapenemase. Avoid carbapenems; consult ID."],
    [*IPC committee*], [Cluster summary, tree, timeline, recommended actions],
    [*Ministry / RBC*], [Quarterly summary of resistance genes and clones],
  )
  #tip[Use simple visuals (Microreact) and a one-page template. *Close the loop:* did the action reduce SSIs?]
]

#slide(title: "People: keeping the skills alive")[
  - *2–3 "genomics champions"* per department
  - A monthly *data clinic / journal club* for course graduates
  - Self-paced learning: Galaxy Training Network, The Carpentries, Africa CDC, Wellcome Connecting Science
  - Build genomics into *student teaching* (MGHD, MBBS research projects)
]

#slide(title: "Funding")[
  - Build sequencing costs into grants (AMR, surgery, maternal health)
  - Funders active in Africa: Fleming Fund, Wellcome, Gates Foundation, Africa CDC, NIH / Fogarty, EDCTP
  #v(0.3em)
  #tip(label: "Budget per isolate")[Sequencing + shipping + staff time + data storage]
]

#slide(title: "Your one-page action plan")[
  #cols[
    + *Question:* what do I want to know?
    + *Isolates:* which, how many, from where, when? Already stored?
    + *Metadata:* which fields? Who collects them?
    + *Partner:* who? Which platform? Cost? Timeline?
  ][
    5. *Analysis:* which tools? Who does it?
    + *Ethics:* IRB? MTA? Data sharing?
    + *Communication:* who gets results, in what format?
    + *First step next week:* \_\_\_\_\_\_\_\_\_\_
  ]
]

#slide(title: "Discussion")[
  #text(size: 16pt, fill: muted)[20 min · small groups, then the whole room]
  + What is the *single biggest barrier* to starting genomic surveillance at our institution? How could we overcome it?
  + Which *question* (outbreak, routine, research) would be most valuable to answer first?
]
