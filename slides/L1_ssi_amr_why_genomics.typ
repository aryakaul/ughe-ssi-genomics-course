#import "/slides/theme.typ": *
#show: deck.with(lab: "L1", title: "SSIs, AMR and Why Genomics?")
// Speaker notes: slides/L1_ssi_amr_why_genomics.md

#title-slide(
  lab: "Lecture 1",
  title: [Surgical Site Infections, \ AMR and Why Genomics?],
  when: "Day 1 · 09:00–09:45 · 45 min",
  mode: "≈ 30 min talk + 15 min discussion",
  objective: "LO1: explain how WGS strengthens SSI and AMR surveillance compared with culture and AST alone",
)

#statement(
  [Think of the last surgical patient whose infection didn't respond to first-line antibiotics.],
  sub: [What did we learn about where it came from?],
)

#slide(title: "What is a surgical site infection?")[
  - An infection at or near the incision
  - Within *30 days* of surgery (*90 days* with an implant)
  - Three levels:
    + Superficial incisional
    + Deep incisional
    + Organ / space
]

#slide(title: "The burden")[
  - The *most common healthcare-associated infection* in low- and middle-income countries (WHO)
  - Post-caesarean SSI is a major problem in sub-Saharan Africa, including rural Rwanda
  - Consequences:
    - longer hospital stays and reoperation
    - catastrophic costs for households
    - death
]

#slide(title: "SSI after caesarean section in Rwanda")[
  #stats(
    ("10.9%", [Kirehe District Hospital \ Nkurunziza et al. 2019]),
    ("5.7%", [Kirehe, later cohort \ Velin et al. 2021]),
    ("6.85%", [National pooled estimate \ Sibomana et al. 2024]),
  )
]

#slide(title: "Resistance in SSI isolates from Kirehe")[
  #stats(
    ("68%", [of isolates were \ Gram-negative]),
    ("0%", [of Gram-negatives were \ susceptible to ampicillin]),
    ("92%", [were intermediate or resistant \ to *ceftriaxone*]),
  )
  #v(0.5em)
  #text(size: 16pt, fill: muted)[Velin et al., _Ann Glob Health_ 2021. Ceftriaxone is the standard empiric drug.]
]

#slide(title: "The gap")[
  - Culture and AST capacity is still limited (Umutesi et al. 2021)
  - We *don't know which resistance genes or clones* are behind these numbers
  #v(0.5em)
  #key[That is the gap genomics fills.]
  #v(0.5em)
  #check(label: "Discuss")[What fraction of SSIs in our hospitals get a culture? An AST?]
]

#slide(title: "AMR: the global picture (2019)")[
  #stats(
    ("1.27 M", [deaths *directly caused* \ by bacterial AMR]),
    ("4.95 M", [deaths *associated* \ with bacterial AMR]),
  )
  #v(0.5em)
  - The highest death rate was in *sub-Saharan Africa*
  - 5 of the 6 leading pathogens are common causes of SSI
  #text(size: 16pt, fill: muted)[GRAM study, _Lancet_ 2022]
]

#slide(title: "SSI pathogens to know")[
  #table(
    columns: (auto, 1fr),
    th[Pathogen][Resistance to watch],
    [_Staphylococcus aureus_], [MRSA (_mecA_ / _mecC_)],
    [_Escherichia coli_], [ESBLs (CTX-M), carbapenemases],
    [_Klebsiella pneumoniae_], [ESBLs, carbapenemases (KPC, NDM, OXA-48)],
    [_Acinetobacter baumannii_], [Carbapenemases (OXA-23)],
    [_Pseudomonas aeruginosa_], [Efflux, porin loss, VIM / IMP],
  )
  #text(size: 17pt)[*ESKAPE:* _Enterococcus_, _S. aureus_, _Klebsiella_, _Acinetobacter_, _Pseudomonas_, _Enterobacter_]
]

#slide(title: "What our current tools tell us")[
  #cols[
    #tip(label: "Culture and AST answer")[
      - *Which organism?*
      - *Which drugs work?*
      Essential for treating *this patient*.
    ]
  ][
    #check(label: "They can't answer")[
      - Are these 5 patients infected with the *same strain*?
      - Is resistance spreading on a *plasmid* between species?
      - Is a known *high-risk clone* circulating?
    ]
  ]
]

#slide(title: "What a genome adds")[
  A bacterial genome is 2–6 million letters (A, C, G, T). From one genome we get:
  #v(0.3em)
  #tiles(
    columns: 3,
    ([1 · Species], [confirms or corrects the lab ID]),
    ([2 · Strain type], [MLST: "the bacterium's surname"]),
    ([3 · AMR genes], [and *where* they sit: chromosome or plasmid]),
    ([4 · Virulence genes], [toxins and other factors]),
    ([5 · Relatedness], [SNP distance: the basis of outbreak detection]),
  )
]

#slide(title: "Case example: an outbreak response")[
  MRSA on a *neonatal unit* in Cambridge, UK
  - *Köser et al., _NEJM_ 2012:* separated the linked outbreak isolates from unrelated MRSA that looked identical on routine lab tests
  - *Harris et al., _Lancet Infect Dis_ 2013:* traced transmission into the community and found a *staff carrier*, which ended the outbreak
  #v(0.3em)
  #key[Genomics changed the infection-control decision. We'll use this reasoning in Lab 6.]
]

#slide(title: "Genomic surveillance ≠ owning a sequencer")[
  #v(0.3em)
  #flow("Collect", "Store", "Send", "Analyse", "Act", hl: (0, 1, 3, 4))
  #v(0.6em)
  - A reference lab or service provider can do the *sequencing*
  - The *expertise stays local*: choosing isolates, recording metadata, analysing, interpreting, communicating
  - Africa CDC and national labs are building this network
]

#slide(title: "The next two days")[
  #cols[
    #tip(label: "Day 1 · The data")[
      What sequencing produces, and how to turn it into a genome
    ]
  ][
    #tip(label: "Day 2 · The answers")[
      Resistance, strain types, outbreaks, and a sustainable programme
    ]
  ]
]

#slide(title: "Discussion")[
  #text(size: 16pt, fill: muted)[15 min · pairs, then the whole room]
  + Describe one situation in your work where knowing *"are these infections linked?"* would have changed what you did.
  + What happens to bacterial isolates in our labs after AST is done? *Are they stored?*
]
