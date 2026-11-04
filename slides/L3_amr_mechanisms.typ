#import "/slides/theme.typ": *
#show: deck.with(lab: "L3", title: "How Bacteria Resist Antibiotics")
// Speaker notes: slides/L3_amr_mechanisms.md

#title-slide(
  lab: "Lecture 3",
  title: [How Bacteria Resist Antibiotics],
  when: "Day 1 · 13:00–13:45 · 45 min",
  mode: "",
  objective: "LO4 (part): understand the genetic basis of AMR so that genome results can be interpreted",
)

#slide(title: "Four ways to survive an antibiotic")[
  #tiles(
    columns: 2,
    ([1 · Destroy the drug], [Enzymes such as β-lactamases cut penicillins and cephalosporins]),
    ([2 · Change the target], [The drug no longer binds (PBP2a in MRSA; _gyrA_ mutations)]),
    ([3 · Pump it out], [Efflux pumps]),
    ([4 · Keep it out], [Fewer or changed porins in Gram-negatives]),
  )
]

#slide(title: "Where resistance comes from: two routes")[
  #cols[
    #tip(label: "Acquired gene")[
      The bacterium picks up a *new gene* from another bacterium
      #v(0.2em)
      _mecA_, _blaCTX-M-15_, _blaNDM-1_
      #v(0.2em)
      *Genome:* is the gene present or absent?
    ]
  ][
    #tip(label: "Chromosomal mutation")[
      A change in the bacterium's *own gene*
      #v(0.2em)
      _gyrA_ S83L (ciprofloxacin)
      #v(0.2em)
      *Genome:* compare with a reference and look for specific mutations
    ]
  ]
]

#slide(title: "Plasmids: why resistance spreads so fast")[
  - *Plasmids:* small circles of DNA that move *between bacteria, even between species*
  - *Transposons and integrons:* "cut-and-paste" elements that move genes around
  - One plasmid can carry *many* resistance genes at once
  #v(0.3em)
  #key[A resistant plasmid can spread even when the strain is not spreading. Genomics can tell these apart.]
]

#slide(title: "The big four to recognise")[
  #tiles(
    columns: 2,
    ([_mecA_], [MRSA: resistant to almost all β-lactams]),
    ([_blaCTX-M_ (ESBL)], [Resistant to 3rd-generation cephalosporins such as ceftriaxone]),
    ([Carbapenemases], [KPC, NDM, OXA-48, VIM, IMP, OXA-23: resistant to carbapenems, the "last line"]),
    ([_gyrA_ / _parC_ mutations], [Fluoroquinolone (ciprofloxacin) resistance]),
  )
  #v(0.2em)
  #text(size: 17pt, fill: muted)[You don't need to memorise gene names. The tools report them, and the glossary has a cheat sheet.]
]

#slide(title: "Other mechanisms you'll see")[
  #table(
    columns: (1fr, 1fr),
    th[Genes][Resistance to],
    [_blaSHV_, _blaTEM_ (ESBL variants)], [3rd-generation cephalosporins],
    [_aac_, _aph_, _ant_, _armA_, _rmtB_], [Gentamicin, amikacin],
    [_sul1_, _sul2_, _dfrA_], [Co-trimoxazole],
    [_tet(A)_, _tet(M)_], [Tetracyclines],
  )
]

#slide(title: "Reading gene names")[
  #align(center, text(size: 32pt)[`blaCTX-M-15`])
  #align(center, table(
    columns: 3,
    align: center,
    [`bla`], [`CTX-M`], [`15`],
    [β-lactamase], [family], [variant],
  ))
  #v(0.2em)
  - `aac(6')-Ib-cr`: aminoglycoside enzyme; "cr" = also affects ciprofloxacin
  - `mecA`: methicillin resistance
  #check(label: "1-minute exercise")[What do you predict `blaNDM-1` does?]
]

#slide(title: "Can the genome predict the AST result?")[
  #cols[
    #tip(label: "Works very well")[
      - _S. aureus_
      - β-lactams in _E. coli_ and _Klebsiella_
    ]
  ][
    #check(label: "Works less well")[
      - Resistance depends on how much a gene is *expressed*
      - *Combinations* of weak mechanisms
      - *Unknown* mechanisms not yet in databases
    ]
  ]
  #v(0.3em)
  #key[The genome complements AST. It does not replace AST for treating patients.]
]

#slide(title: "When the genome and the AST disagree")[
  #table(
    columns: (auto, auto, 1fr),
    th[Genome says][AST says][Possible explanations],
    [Resistance gene], [Susceptible], [Gene not expressed or broken · lab error · mixed culture],
    [No gene found], [Resistant], [Unknown mechanism · mutation not in database · low coverage · mixed culture],
  )
  #v(0.3em)
  #tip[Disagreements are *useful*: they point to new mechanisms or lab QC problems. We'll practise this in Lab 4.]
]

#slide(title: "AMR tools and databases (preview of Lab 4)")[
  #table(
    columns: (auto, auto, 1fr),
    th[Tool][From][Notes],
    [*AMRFinderPlus*], [NCBI, USA], [Genes + mutations; organism-aware],
    [*ResFinder / PointFinder*], [CGE, Denmark], [Web tool; predicts phenotype],
    [*CARD / RGI*], [McMaster, Canada], [Very comprehensive],
    [*ABRicate*], [Community], [Fast screening, several databases],
  )
  #tip[Tools may disagree slightly. Always report which tool and database version you used.]
]

#slide(title: "Summary")[
  - Resistance = *genes* (often mobile) + *mutations*
  - Plasmids let resistance spread *between species*
  - Genome predictions are powerful but have limits: *always read them next to AST*
  #v(0.4em)
  #tip[Next: let's make some genomes (Lab 2).]
]
