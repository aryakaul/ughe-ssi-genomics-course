#import "/slides/theme.typ": *
#show: deck.with(lab: "Lab 4", title: "Who Is It, and What Does It Resist?")

#title-slide(
  lab: "Lab 4",
  title: [Who Is It, and \ What Does It Resist?],
  when: "Day 2 · 08:50–10:30 · 100 min",
  mode: "Pairs · swap driver and navigator at Part D",
  objective: "LO4: detect AMR genes and plasmids, type the isolate, and interpret the results alongside phenotypic AST",
)

#open-handout("Lab 4", "Lab4_species_typing_amr.pdf")

#slide(title: "The scenario")[
  - A patient develops a *deep SSI 9 days* after an open fracture repair
  - The lab reports _S. aureus_, *methicillin-resistant*
  - The isolate was sequenced: you have its *assembly* (FASTA)
  #v(0.3em)
  #key[What can the genome add?]
  #text(size: 16pt, fill: muted)[Teaching scenario. The genome is real public data from the Galaxy Training Network.]
]

#slide(title: "Plan for this lab")[
  #table(
    columns: (auto, 1fr, auto),
    th[Part][What][Time],
    [A], [Get the genome], [5 min],
    [B], [Who is it? Species and strain type], [20 min],
    [C], [What does it resist? AMR genes], [35 min],
    [D], [Is resistance mobile? Plasmids], [15 min],
    [E], [Does it match the lab's AST?], [20 min],
  )
]

#slide(part: "Part A", time: "5 min", title: "Get the genome")[
  + New history: `Lab4 – AMR`
  + *Upload → Paste/Fetch data* → paste the URL *from your handout*
  + *Type:* `fasta` · *Name:* `MRSA_contigs.fasta`
  #v(0.3em)
  #tip(label: "Optional")[Your own Lab 2 assembly finished? Run every step on it too.]
]

#slide(part: "Part B1 · Who is it?", time: "20 min for Part B", title: "MLST: the strain type")[
  Tool *MLST* → `MRSA_contigs.fasta` → scheme *automatic* → *Run*
```
MRSA_contigs.fasta   saureus   ST?   arcC(?) aroE(?) …
```
  #check[
    + Which *scheme* did MLST choose? What does it tell you?
    + What is the *ST*? Is it a well-known MRSA clone?
  ]
]

#slide(part: "Part B2 · Optional", title: "Species check with Kraken2")[
  - Tool *Kraken2* on `MRSA_contigs.fasta`, with a *report*
  - What is the top species?
  #v(0.3em)
  #key[If the organism is wrong or the culture is mixed, every result after this is wrong.]
]

#slide(part: "Part C1 · What does it resist?", time: "35 min for Part C", title: "AMRFinderPlus (NCBI)")[
  - *Input type:* nucleotide → `MRSA_contigs.fasta`
  - *Organism:* `Staphylococcus_aureus` (finds point mutations too)
  - Everything else: defaults → *Run* → open the *report*
  #v(0.3em)
  #tip(label: "Key columns")[*Element symbol* (gene) · *Class* (drug class) · *% Identity* · *% Coverage*]
]

#slide(part: "Part C2", title: "staramr")[
  - ResFinder + PointFinder + PlasmidFinder + MLST in one tool
  - Input `MRSA_contigs.fasta` → defaults → *Run*
  - Open *summary.tsv* and *detailed_summary.tsv*
]

#slide(part: "Part C3", title: "Record your findings")[
  #table(
    columns: (1fr, 1fr, auto, auto, auto),
    rows: (auto, 30pt),
    th[Gene / mutation][Drug class][AMRFinderPlus?][staramr?][On a plasmid?],
    [], [], [], [], [],
    [], [], [], [], [],
    [], [], [], [], [],
  )
  #text(size: 16pt, fill: muted)[Fill in the full table in your handout. The last column comes in Part D.]
]

#slide(part: "Part C", title: "Check yourself: AMR genes")[
  #check[
    + Which gene explains the *methicillin resistance*? _(Glossary cheat sheet!)_
    + Did both tools find the same genes? If not, why might they differ?
    + What is staramr's *predicted phenotype*?
  ]
]

#swap

#slide(part: "Part D", time: "15 min", title: "Is resistance mobile? Plasmids")[
  + In `detailed_summary.tsv`, find the *plasmid* rows (`rep…`) and note their *contig*
  + Mark resistance genes on the *same contig* as a plasmid
  #v(0.3em)
  #tip(label: "Alternative")[*ABRicate* with the *plasmidfinder* database]
]

#slide(part: "Part D", title: "Check yourself: plasmids")[
  #check[
    + How many plasmid replicons? On which contigs?
    + Which resistance genes are probably on a *plasmid*? Why does that matter for infection control?
    + Why can't we be *certain* from an Illumina assembly?
  ]
]

#slide(part: "Part E", time: "20 min", title: "Does the genome match the lab's AST?")[
  - Use the *AST report in your handout* (Part E)
  - #text(fill: warn)[*It is hypothetical:*] written for teaching, not the real AST for this genome
  - For each antibiotic: which gene explains it? Do genome and AST *agree*?
]

#slide(part: "Part E", title: "Check yourself: genome vs AST")[
  #check[
    + Where do genome and AST *disagree*? Give two possible explanations for each.
    + What would you *tell the clinician*? Write one plain-language sentence.
    + Would you use the genome *instead of* AST to treat this patient?
  ]
]

#slide(part: "Part F", time: "5 min", title: "What each tool told us")[
  #table(
    columns: (auto, 1fr),
    th[Tool][Answers],
    [*MLST*], [*Who?* Strain type, known clones],
    [*AMRFinderPlus / staramr*], [*What resistance?* Genes and mutations],
    [*PlasmidFinder*], [*Is it mobile?*],
    [*Comparing with AST*], [*How confident are we?*],
  )
  Next: what about *many* isolates? → Lecture 4 and Lab 5
]

#slide(title: "Extension for fast pairs")[
  - *ABRicate* with the *card* and *vfdb* (virulence) databases
  - Annotate the genome with *Bakta*
  - Upload the FASTA to *ResFinder* on the web and compare
  #credit[Adapted from the GTN tutorial "Identification of AMR genes in an assembled bacterial genome" (CC-BY 4.0).]
]
