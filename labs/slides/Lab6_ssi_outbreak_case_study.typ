#import "/slides/theme.typ": *
#show: deck.with(lab: "Lab 6", title: "Case Study: A Cluster on the Surgical Ward")

#title-slide(
  lab: "Lab 6",
  title: [Case Study: \ A Cluster on the Surgical Ward],
  when: "Day 2 · 13:15–15:00 · 105 min",
  mode: "Groups of 4",
  objective: "LO3–LO5: combine genomic and epidemiological evidence to decide whether an outbreak is happening, and communicate the decision",
)

#open-handout("Lab 6", "Lab6_ssi_outbreak_case_study.pdf")

#slide(title: "About this case")[
  - The *genomes are real*: MRSA isolates from a published outbreak investigation
  - The *hospitals, wards, patients and dates are fictional*, so the case feels like our setting
  #v(0.3em)
  #tip[The real story is revealed at the end.]
]

#slide(part: "The situation", title: "District Hospital A · Monday, 16 March 2026")[
  The IPC nurse writes to you:
  #v(0.2em)
  #block(inset: (left: 16pt), stroke: (left: 3pt + muted))[
    #set text(style: "italic")
    "Since early February we've had *more MRSA wound infections than usual on Surgical Ward B*. The surgeons say it's bad luck. Theatre staff say it's the ward. The ward says it's the theatre.
  ]
]

#slide(part: "The situation", title: "The question")[
  #block(inset: (left: 16pt), stroke: (left: 3pt + muted))[
    #set text(style: "italic")
    The director asks whether we should *close Ward B*. That would cancel about 40 operations a week. We got genomes back last week for all MRSA isolates since September.
    #v(0.3em)
    *Can you tell us what's going on by Wednesday's IPC meeting?*"
  ]
]

#slide(title: "Your evidence")[
  + *Pathogenwatch collection* from Lab 5: tree + timeline + metadata
  + *SNP matrix:* `koser_snp_matrix.tsv` (opens in Excel)
  + *Pathogenwatch results* from Lab 5: ST and AMR
  + *Metadata:* `lab6_metadata.csv`
]

#slide(title: "Group roles")[
  #table(
    columns: (auto, 1fr),
    th[Role][Job],
    [*Genomics lead*], [Reads the tree and SNP matrix],
    [*Epidemiologist*], [Builds the timeline: who was where, when],
    [*Clinician / IPC*], [Thinks through transmission routes and actions],
    [*Communicator*], [Writes and gives the 5-minute briefing],
  )
]

#slide(title: "Plan for this lab")[
  #table(
    columns: (auto, 1fr, auto),
    th[Part][What][Time],
    [A], [Describe the cases], [15 min],
    [B], [What does the genome say?], [25 min],
    [C], [Genomics + epidemiology together], [20 min],
    [D], [Prepare the briefing], [25 min],
    [E], [Briefings to the IPC committee], [15 min],
  )
]

#slide(part: "Part A", time: "15 min", title: "Describe the cases")[
  Sketch an *epidemic curve*: weeks across, number of cases up. \
  Two colours: *Ward B* and *other wards / hospitals*.
  #v(0.3em)
  #check(label: "Questions")[
    + How many MRSA isolates in total? How many from Ward B since 1 February?
    + Do all Ward B cases look the same on the *lab report*? Does that make them one outbreak?
  ]
]

#slide(part: "Part B", time: "25 min", title: "What does the genome say?")[
  + *Sequence types:* group the isolates by ST (Pathogenwatch)
  + *SNP distances:* highlight all pairs *≤ 30 SNPs* apart
  + Which isolates form a *cluster*, all close to each other?
  + *Tree:* colour by *ward*, then by *theatre*. Is the cluster a tight group on short branches?
  #v(0.2em)
  #text(size: 16pt, fill: muted)[≤ 30 SNPs: our working threshold for possible recent _S. aureus_ transmission. Published thresholds vary.]
]

#slide(part: "Part C", time: "20 min", title: "Put genomics and epidemiology together")[
  For *each* Ward B case since February:
  #table(
    columns: (auto, 1fr, 1fr, 1fr),
    rows: (auto, 30pt),
    th[Patient][In the cluster?][Ward / theatre / time link?][Linked · not linked · uncertain],
    [], [], [], [],
    [], [], [], [],
  )
  #text(size: 16pt, fill: muted)[Use the full table in your handout.]
]

#slide(part: "Part C", title: "Discuss in your group")[
  + Is there an outbreak? How confident are you?
  + Is a Ward B patient *outside* the cluster, though on the ward at the same time?
  + Is a cluster patient *not* on Ward B? What do they share? → *likely route?*
  + Are isolates from *other hospitals* in the cluster?
  + What *other information* would you want?
]

#slide(part: "Part D", time: "25 min", title: "Prepare a 5-minute briefing")[
  For the IPC committee: director, chief surgeon, nursing lead, lab head. *Not genomics experts.*
  #v(0.3em)
  #tip(label: "Rules")[
    - One flip-chart page or 3 slides
    - Explain any jargon: "SNP" → "genetic differences"
    - *No more than one figure*
  ]
]

#slide(part: "Part D", title: "Briefing template")[
  + *Bottom line:* "We found / did not find evidence of an outbreak of \_\_\_ linked to \_\_\_."
  + *What we did:* "We sequenced \_\_ MRSA isolates from \_\_ to \_\_."
  + *What we found:* one visual + 2–3 bullets
  + *What it means:* which cases are linked; the likely route
  + *Recommendations:* 3 actions, with who and by when
  + *What we don't know yet*
]

#slide(part: "Part E", time: "15 min", title: "Briefings to the IPC committee")[
  Each group has *5 minutes*. The committee must ask at least one question:
  #v(0.4em)
  #grid(
    columns: (1fr, 1fr),
    gutter: 12pt,
    ..("Should we close Ward B?", "Is it the surgeons' fault?", "How sure are you?", "What will this cost?").map(q => block(
      width: 100%, fill: accent-soft, inset: 16pt, radius: 4pt,
      align(center, text(size: 22pt, weight: "bold")["#q"]),
    ))
  )
]

#banner([Pause], sub: [Instructor: don't go to the next slide until every group has given its briefing], fill: warn)

#slide(title: "The reveal")[
  The genomes come from *Köser et al., _NEJM_ 2012*: a suspected MRSA outbreak in a *neonatal unit* in Cambridge, UK.
  - Sequencing separated the *outbreak isolates* from unrelated MRSA that looked identical on routine tests
  - A follow-up study (*Harris et al. 2013*) traced transmission into the community and found a *staff carrier*, which ended the outbreak
  #credit[Genomic data: ENA project PRJEB2912 (Köser et al. 2012). Scenario metadata are fictional and created for teaching.]
]

#slide(title: "Take-home messages")[
  + *Same species + same antibiogram ≠ same outbreak*
  + Genomics finds *hidden links*: shared theatre, staff, equipment
  + Genomics can *prevent unnecessary actions*, like closing a ward
  + Genomics is only useful with *good metadata* and *clear communication*
]
