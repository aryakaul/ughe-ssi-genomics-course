// Day 2, all slides in timetable order. Lectures and labs are pulled in from
// their own files, so edit those (not this file) to change their content.
#import "/slides/theme.typ": *

#[
#show: deck.with(lab: "Day 2", title: "From Genomes to Surveillance Action")

#title-slide(
  lab: "Day 2",
  title: [From Genomes to \ Surveillance Action],
  when: "Genomic Surveillance of Surgical Site Infections & AMR",
  mode: "08:30–17:00",
  objective: "Course files: github.com/aryakaul/ughe-ssi-genomics-course",
)

#slide(title: "Day 2 · Morning")[
  #table(
    columns: (auto, 1fr),
    th[Time][Session],
    [08:30], [Recap: your questions from yesterday],
    [08:50], [*Lab 4:* Who is it, and what does it resist?],
    [10:30], [_Break_],
    [10:45], [*Lecture 4:* Typing, trees and outbreaks],
    [11:30], [*Lab 5:* Pathogenwatch and Microreact],
    [12:30], [_Lunch_],
  )
]

#slide(title: "Day 2 · Afternoon")[
  #table(
    columns: (auto, 1fr),
    th[Time][Session],
    [13:15], [*Lab 6:* Case study, a cluster on the surgical ward],
    [15:00], [_Break_],
    [15:15], [*Lecture 5:* Building a sustainable programme],
    [16:00], [Action planning],
    [16:40], [Knowledge check, evaluation, certificates],
  )
]

#slide(title: "Your questions from yesterday")[
  #v(0.5em)
  #align(center)[
    #text(size: 30pt, weight: "bold", fill: accent)[Answers to the exit tickets]
  ]
  #v(0.5em)
  #tip[Today's files: github.com/aryakaul/ughe-ssi-genomics-course \ Lab 5–6 data are in `labs/data/`]
]
]

#include "/labs/slides/Lab4_species_typing_amr.typ"

#[
#show: deck.with(lab: "Day 2", title: "From Genomes to Surveillance Action")
#banner([Break], sub: [Back at 10:45 for Lecture 4])
]

#include "L4_typing_phylogenetics_outbreaks.typ"
#include "/labs/slides/Lab5_pathogenwatch_microreact.typ"

#[
#show: deck.with(lab: "Day 2", title: "From Genomes to Surveillance Action")
#banner([Lunch], sub: [Back at 13:15 for the case study (Lab 6)])
]

#include "/labs/slides/Lab6_ssi_outbreak_case_study.typ"

#[
#show: deck.with(lab: "Day 2", title: "From Genomes to Surveillance Action")
#banner([Break], sub: [Back at 15:15 for Lecture 5])
]

#include "L5_sustainable_program.typ"

#[
#show: deck.with(lab: "Day 2", title: "From Genomes to Surveillance Action")

#slide(title: "Action planning", time: "40 min")[
  Draft *your own one-page plan* for a genomic surveillance mini-project.
  #v(0.3em)
  - Use the 8-point template from Lecture 5
  - Choose a question you could really start on next week
  - Be concrete: *which* isolates, *which* partner, *who* does what
  #key[Last point on the template: your first step next week.]
]

#slide(title: "Knowledge check and evaluation", time: "20 min")[
  - The same knowledge check as yesterday
  - Use the *same code word* and tick *Post*
  - Answer *N4* at the end: what support would help you most?
  - Then the course evaluation
]

#slide(title: "Keep going")[
  - *Course files:* github.com/aryakaul/ughe-ssi-genomics-course
  - Your *Galaxy histories* stay in your account: re-run them on new data
  - Next steps: `resources/further_learning.md`
  - A monthly *data clinic / journal club* for course graduates
]

#statement([Thank you!], sub: [Certificates now])
]
