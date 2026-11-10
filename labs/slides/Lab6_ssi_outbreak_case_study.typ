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

#slide(title: "Your job")[
  #key[Answer one question for the director: *should we close Ward B?*]
  #v(0.3em)
  Your evidence:
  + *Pathogenwatch collection* from Lab 5: tree, timeline, ward, theatre, dates
  + *SNP matrix:* `koser_snp_matrix.tsv` (opens in Excel)
]

#slide(title: "Group roles")[
  #table(
    columns: (auto, 1fr),
    th[Role][Job],
    [*Genomics lead*], [Reads the tree and SNP matrix],
    [*Epidemiologist*], [Reads the timeline: who was where, when],
    [*Clinician / IPC*], [How could MRSA spread? What to do?],
    [*Communicator*], [Writes and gives the 5-minute briefing],
  )
]

#slide(title: "Plan for this lab")[
  #table(
    columns: (auto, 1fr, auto),
    th[Part][What][Time],
    [A], [Look at the cases], [15 min],
    [B], [Find the cluster], [25 min],
    [C], [Genomics + epidemiology together], [20 min],
    [D], [Prepare the briefing], [25 min],
    [E], [Briefings to the IPC committee], [15 min],
  )
]

#slide(part: "Part A", time: "15 min", title: "Look at the cases")[
  Open your Pathogenwatch collection: *timeline* + *data table*
  #v(0.3em)
  #check(label: "Questions")[
    + How many MRSA isolates in total? How many from *Ward B since 1 February*?
    + Every isolate is MRSA and cefoxitin-resistant on the *lab report*. Are they all one outbreak?
  ]
]

#slide(part: "Part B", time: "25 min", title: "Find the cluster")[
  + *Tree:* which isolates sit on very *short branches*?
  + *SNP matrix* in Excel: Conditional Formatting → Highlight Cells → *Less Than* `100`
  + Look for the *gap*: a group close to each other, everything else far away
  + Do the tree and the matrix agree?
]

#slide(part: "Part B", title: "Why look for a gap?")[
  - Published thresholds for _S. aureus_ are about *15–30 SNPs* (L4)
  - They are *guides, not laws*
  #v(0.3em)
  #key[The clearest sign: a group close together, with a big gap to everything else.]
]

#slide(part: "Part C", time: "20 min", title: "Genomics + epidemiology together")[
  Colour the tree by *ward*, then *theatre*. For each *Ward B patient since February*:
  #table(
    columns: (auto, 1fr, 1fr, 1fr),
    th[Patient][In the cluster?][Theatre][Linked?],
    [P01], [Yes], [Theatre 2], [*Linked*],
    [P02 …], [], [], [],
  )
  #text(size: 16pt, fill: muted)[Use the full table in your handout.]
]

#slide(part: "Part C", title: "Three questions")[
  + *Are all the Ward B cases one outbreak?* \ Look closely at *P08*.
  + *Is anyone in the cluster not on Ward B?* \ What do they share with the others?
  + *So, should we close Ward B?* \ Where is the outbreak most likely coming from?
  #tip(label: "Finished early?")[See the extra questions in your handout.]
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
  + *Same ward + same lab result ≠ same outbreak*
  + Genomics finds *hidden links*: shared theatre, staff, equipment
  + Genomics can *prevent unnecessary actions*, like closing a ward
  + Genomics is only useful with *good metadata* and *clear communication*
]
