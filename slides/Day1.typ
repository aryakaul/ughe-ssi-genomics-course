// Day 1, all slides in timetable order. Lectures and labs are pulled in from
// their own files, so edit those (not this file) to change their content.
#import "/slides/theme.typ": *

#[
#show: deck.with(lab: "Day 1", title: "From Wound Swab to Genome")

#title-slide(
  lab: "Day 1",
  title: [From Wound Swab to Genome],
  when: "Genomic Surveillance of Surgical Site Infections & AMR",
  mode: "08:30–17:00",
  objective: "Course files: github.com/aryakaul/ughe-ssi-genomics-course",
)

#slide(title: "Day 1 · Morning")[
  #table(
    columns: (auto, 1fr),
    th[Time][Session],
    [08:30], [Welcome and knowledge check],
    [09:00], [*Lecture 1:* SSIs, AMR and why genomics?],
    [09:45], [*Lecture 2:* From sample to sequence],
    [10:30], [_Break_],
    [10:45], [*Lab 1:* Files, formats and your first Galaxy history],
    [12:15], [_Lunch_],
  )
]

#slide(title: "Day 1 · Afternoon")[
  #table(
    columns: (auto, 1fr),
    th[Time][Session],
    [13:00], [*Lecture 3:* How bacteria resist antibiotics],
    [13:45], [*Lab 2:* Quality control and genome assembly],
    [15:30], [_Break_],
    [15:45], [*Lab 3:* A look under the hood: the command line],
    [16:45], [Recap and exit ticket],
  )
]

#slide(title: "Your course files")[
  #align(center)[
    #text(size: 30pt, weight: "bold", fill: accent)[github.com/aryakaul/ughe-ssi-genomics-course]
  ]
  #v(0.4em)
  - *Lab handouts:* the `labs/pdf/` folder
  - *Slides:* the `slides/pdf/` folder
  - *Everything at once:* green *Code* button → *Download ZIP*
]

#slide(title: "Before we start")[
  - Log in to *usegalaxy.eu* and *pathogen.watch*
  - Can't log in? *Raise your hand now*: account emails can take a few minutes
  #v(0.3em)
  #tip(label: "Working in pairs")[
    *Driver:* hands on the keyboard · *Navigator:* reads the handout \
    You swap at each lab. Questions any time: *raise your hand*.
  ]
]

#slide(title: "Knowledge check", time: "15 min")[
  - *Not graded*, and anonymous
  - Choose a *code word* and write it at the top. You'll use it again tomorrow.
  - Tick *Pre*
  - Answer the questions, then *N1–N3* at the end
  #v(0.3em)
  #key[It's fine not to know the answers yet. That's what the course is for.]
]
]

#include "L1_ssi_amr_why_genomics.typ"
#include "L2_sample_to_sequence.typ"

#[
#show: deck.with(lab: "Day 1", title: "From Wound Swab to Genome")
#banner([Break], sub: [Back at 10:45 for Lab 1])
]

#include "/labs/slides/Lab1_files_formats_galaxy.typ"

#[
#show: deck.with(lab: "Day 1", title: "From Wound Swab to Genome")
#banner([Lunch], sub: [Back at 13:00 for Lecture 3])
]

#include "L3_amr_mechanisms.typ"
#include "/labs/slides/Lab2_qc_assembly.typ"

#[
#show: deck.with(lab: "Day 1", title: "From Wound Swab to Genome")
#banner([Break], sub: [Back at 15:45. First thing: start JupyterLab (Lab 3, Part A)])
]

#include "/labs/slides/Lab3_command_line_taster.typ"

#[
#show: deck.with(lab: "Day 1", title: "From Wound Swab to Genome")

#slide(title: "Today we…")[
  + Saw why genomics matters for SSIs and AMR
  + Learned what sequencing produces: reads, FASTQ, coverage
  + Ran our first tools in Galaxy
  + Turned raw reads into a genome and checked its quality
  + Looked under the hood with the command line
]

#slide(title: "Exit ticket", time: "2 min")[
  #align(center)[
    #v(0.5em)
    #text(size: 34pt, weight: "bold", fill: accent)[What is still unclear?]
    #v(0.4em)
    #text(size: 22pt, fill: muted)[One question on a slip of paper. No names.]
  ]
  #v(0.8em)
  #tip[I'll answer them first thing tomorrow.]
]

#statement([See you tomorrow at 08:30], sub: [Day 2: from genomes to surveillance action])
]
