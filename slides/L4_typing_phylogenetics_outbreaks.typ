#import "/slides/theme.typ": *
#show: deck.with(lab: "L4", title: "Typing, Trees and Outbreaks")
// Speaker notes: slides/L4_typing_phylogenetics_outbreaks.md

#title-slide(
  lab: "Lecture 4",
  title: [Typing, Trees and Outbreaks],
  when: "Day 2 · 10:45–11:30 · 45 min",
  mode: "",
  objective: "LO5: type isolates and interpret a phylogeny to support or rule out an outbreak",
)

#statement(
  ["We've had 5 _Klebsiella_ SSIs on Ward B in 6 weeks. Is this an outbreak?"],
)

#slide(title: "What is an outbreak?")[
  - An outbreak means *transmission*: the same strain passing between patients
  - Directly, or through staff, equipment or the environment
  #v(0.4em)
  #key[Same species ≠ same strain. \ Same AST pattern ≠ same strain.]
]

#slide(title: "Typing: naming bacteria at different resolutions")[
  #table(
    columns: (auto, auto, 1fr),
    th[Method][Like a…][Used for],
    [Species], [country], [Clinical ID],
    [*MLST* (7 genes) → ST], [city], [Is it a known high-risk clone?],
    [*cgMLST* (1,000–3,000 genes)], [street], [Clusters within an ST],
    [*SNPs* (whole genome)], [house number], [Outbreaks and transmission],
  )
]

#slide(title: "MLST in one slide")[
  - Seven "housekeeping" genes; each version gets a number
  - The combination of 7 numbers = the *Sequence Type (ST)*
  - Known high-risk clones: _K. pneumoniae_ ST258, ST307 · MRSA ST8, ST22
  - Tools do it automatically (Lab 4, Lab 5)
  #v(0.3em)
  #key[Same ST = possibly related. Different ST = not a recent outbreak.]
]

#slide(title: "SNP distances")[
  #cols[
    - Align genomes to a reference
    - Count the positions where they differ
    - *Few SNPs* → recent common ancestor → possible transmission
    - *Many SNPs* → not recent transmission
  ][
    #tip(label: "Rough guide (varies by study)")[
      _S. aureus_: *≤ 15–30 SNPs* \
      _K. pneumoniae_, _E. coli_: *≤ 10–25 SNPs*
    ]
    #v(0.3em)
    #key[Thresholds are guides, not laws. Always combine them with epidemiology.]
  ]
]

// A small example tree: three tips on short branches form a cluster.
#let example-tree = {
  let s = 1.5pt + ink
  let h(x1, x2, y) = place(line(start: (x1 * 1cm, y * 1cm), end: (x2 * 1cm, y * 1cm), stroke: s))
  let v(x, y1, y2) = place(line(start: (x * 1cm, y1 * 1cm), end: (x * 1cm, y2 * 1cm), stroke: s))
  let tip-label(y, name, on) = place(dx: 10.3cm, dy: y * 1cm - 0.33cm, text(
    size: 17pt, weight: if on { "bold" } else { "regular" }, fill: if on { accent } else { ink }, name,
  ))
  box(width: 15cm, height: 6.4cm, {
    // cluster: three tips on very short branches
    for y in (0.5, 1.3, 2.1) { h(9.2, 10, y) }
    v(9.2, 0.5, 2.1)
    // two tips joined deeper in the tree
    for y in (3.4, 4.4) { h(5, 10, y) }
    v(5, 3.4, 4.4)
    // internal branches
    h(3, 9.2, 1.3)
    h(3, 5, 3.9)
    v(3, 1.3, 3.9)
    h(1, 3, 2.6)
    h(1, 10, 5.4)
    v(1, 2.6, 5.4)
    h(0, 1, 4)
    tip-label(0.5, [Patient A], true)
    tip-label(1.3, [Patient B], true)
    tip-label(2.1, [Patient C], true)
    tip-label(3.4, [Patient D], false)
    tip-label(4.4, [Patient E], false)
    tip-label(5.4, [Patient F], false)
    // scale bar
    place(line(start: (0cm, 6.3cm), end: (2cm, 6.3cm), stroke: 2pt + muted))
    place(dx: 2.3cm, dy: 5.95cm, text(size: 14pt, fill: muted)[≈ 100 SNPs])
  })
}

#slide(title: "Reading a phylogenetic tree")[
  #cols(ratio: (1.15fr, 1fr))[
    #example-tree
  ][
    - *Tips* = isolates
    - *Branch length* = genetic change
    - Tips on *short branches* close together are closely related (A, B, C)
    #check(label: "Common mistakes")[
      - Reading top-to-bottom order as meaningful
      - Ignoring the *scale bar*
    ]
  ]
]

#slide(title: "Genomics + epidemiology: time, place, person")[
  A genomic cluster is an outbreak only if the *epidemiology fits*: same ward or theatre at overlapping times? Same surgeon, equipment or staff?
  #v(0.3em)
  #tiles(
    columns: 3,
    ([Confirm], [Same strain, few SNPs, overlapping stays]),
    ([Refute], [Different STs: no need to close the ward]),
    ([Find hidden links], [Cases on different wards linked by shared equipment or staff]),
  )
]

#slide(title: "Strain outbreak vs plasmid outbreak")[
  #cols[
    #tip(label: "Strain outbreak")[
      The *same clone* in many patients
      #v(0.2em)
      Tree: one tight cluster
    ]
  ][
    #tip(label: "Plasmid outbreak")[
      *Different* strains or species, but the *same resistance plasmid*
      #v(0.2em)
      Needs Nanopore or hybrid data to confirm
    ]
  ]
  #v(0.3em)
  #key[Tree says "unrelated" but the resistance is unusual and identical? Think *plasmid*.]
]

#slide(title: "Vote: outbreak or not? (cards A / B / C)")[
  + *4 MRSA*, all ST22, 2–5 SNPs apart, same ward over 3 weeks
  #v(0.4em)
  2. *4 _Klebsiella_*: ST15, ST307, ST14, ST101
  #v(0.4em)
  3. *3 _E. coli_*, all ST131, 80–150 SNPs apart, 3 different hospitals
]

#slide(title: "Vote: answers")[
  + *Likely outbreak*
  #v(0.4em)
  2. *Not a single-strain outbreak.* Check for a shared plasmid?
  #v(0.4em)
  3. *A common circulating clone*, not recent transmission
]

#slide(title: "From result to action")[
  #table(
    columns: (auto, 1fr),
    th[Finding][Possible IPC action],
    [Confirmed cluster], [Enhanced cleaning, cohorting, contact screening, theatre audit, staff screening if indicated],
    [Refuted cluster], [Avoid unnecessary ward closure; look at other causes (e.g. prophylaxis timing)],
    [High-risk clone or new carbapenemase], [Notify the national reference lab / public-health authority],
  )
  #tip[Communicate in *plain language* to clinicians and managers. You'll practise this in Lab 6.]
]

#slide(title: "Tools for the next lab")[
  #cols[
    #tip(label: "Pathogenwatch: results")[
      Upload assemblies → species, ST, AMR, clustering, tree
    ]
  ][
    #tip(label: "Pathogenwatch: context")[
      Add a metadata table → tree + timeline + metadata in one interactive view
    ]
  ]
  #v(0.3em)
  Free, used by public-health labs, and needs *no coding*.
]
