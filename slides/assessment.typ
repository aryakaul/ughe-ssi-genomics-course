// Knowledge-check questions and slide helpers, shared by
// Assessment_pre.typ, Assessment_post.typ and Assessment_answers.typ.
// Keep in sync with 00_pre-course/pre-assessment.md.
#import "/slides/theme.typ": *

#let questions = (
  (
    q: [Which question can whole-genome sequencing answer that standard culture + AST cannot?],
    opts: ([Which antibiotic should this patient receive today], [Whether isolates from several patients are the same strain], [Whether the organism is Gram-positive], [Whether the patient has a fever]),
    ans: 1,
    why: [Culture and AST guide treatment for this patient. Only the genome shows whether isolates are the *same strain*.],
  ),
  (
    q: [Do you need to own a sequencer to do genomic surveillance? (Yes / No) Briefly explain why.],
    opts: none, ans: none,
    why: [*No.* Isolates or DNA can be sent to a partner. The local skills are choosing isolates, recording metadata, analysing and acting on results.],
  ),
  (
    q: [Name two bacterial species that commonly cause surgical site infections.],
    opts: none, ans: none,
    why: [Any two of: _S. aureus_, _E. coli_, _K. pneumoniae_, _P. aeruginosa_, _A. baumannii_, _Enterobacter_, _Enterococcus_.],
  ),
  (
    q: [An Illumina sequencing run typically produces reads that are:],
    opts: ([100–300 bases long and highly accurate], [10,000+ bases long], [the whole genome in one read], [protein sequences]),
    ans: 0,
    why: [Illumina gives short, very accurate reads. Long reads come from Nanopore.],
  ),
  (
    q: [Which technology is better at showing whether a resistance gene is on a plasmid?],
    opts: ([Illumina short reads alone], [Oxford Nanopore long reads], [AST], [MLST]),
    ans: 1,
    why: [Long reads can span a whole plasmid, so you can see which genes sit on it.],
  ),
  (
    q: [A genome is 5 million bases. You have 1 million reads of 150 bases. What is the approximate coverage?],
    opts: ([3×], [30×], [150×], [300×]),
    ans: 1,
    why: [1,000,000 × 150 ÷ 5,000,000 = *30×*],
  ),
  (
    q: [What does a FASTQ file contain that a FASTA file does not?],
    opts: ([Sequence names], [DNA letters], [Quality scores], [Gene names]),
    ans: 2,
    why: [FASTQ = sequence + a *quality* line for every read. FASTA = sequence only.],
  ),
  (
    q: [After assembly, which result usually means a _better_ assembly?],
    opts: ([More contigs and a smaller N50], [Fewer contigs and a larger N50], [A total length twice the expected genome size], [No contigs]),
    ans: 1,
    why: [Fewer, longer pieces. A total length twice the expected size suggests contamination.],
  ),
  (
    q: [The gene _mecA_ in _S. aureus_ indicates:],
    opts: ([Vancomycin resistance], [MRSA (methicillin resistance)], [Carbapenem resistance], [A virulence toxin]),
    ans: 1,
    why: [_mecA_ makes an altered target (PBP2a), so almost all β-lactams stop working.],
  ),
  (
    q: [`blaNDM-1` is an example of:],
    opts: ([An ESBL], [A carbapenemase], [An efflux pump], [A housekeeping gene]),
    ans: 1,
    why: [NDM = New Delhi metallo-β-lactamase: it destroys carbapenems.],
  ),
  (
    q: [The genome shows no known resistance gene, but AST says "resistant". Give one possible explanation.],
    opts: none, ans: none,
    why: [Any of: an unknown mechanism · a mutation not in the database · low coverage missed the gene · mixed culture · lab error.],
  ),
  (
    q: [Two _Klebsiella_ isolates are ST15 and ST307. Could they be part of the same recent transmission chain?],
    opts: ([Yes, very likely], [No, they are different strain types], [Only if they are both ESBL]),
    ans: 1,
    why: [Different STs are not one recent transmission chain. (They could still share a plasmid.)],
  ),
  (
    q: [On a phylogenetic tree, what tells you how genetically different two isolates are?],
    opts: ([Their order from top to bottom], [The branch lengths between them], [The colour of the labels]),
    ans: 1,
    why: [Branch length = genetic change. Top-to-bottom order means nothing: branches can rotate.],
  ),
  (
    q: [Four isolates are 2–6 SNPs apart and the patients overlapped on the same ward. This most strongly suggests:],
    opts: ([Unrelated infections], [Possible transmission / outbreak], [Contamination of the sequencer]),
    ans: 1,
    why: [Very few SNPs *and* an epidemiological link: possible transmission.],
  ),
  (
    q: [List three pieces of metadata that must be recorded with every isolate for surveillance.],
    opts: none, ans: none,
    why: [Any three of: collection date · facility · ward · specimen type · surgery type and date · AST results · organism · coded patient ID.],
  ),
)

#let letters = ("a", "b", "c", "d")

#let option(letter, body, correct: false) = block(
  width: 100%,
  inset: (x: 14pt, y: 9pt),
  radius: 6pt,
  below: 8pt,
  fill: if correct { accent } else { accent-soft },
  text(
    fill: if correct { white } else { ink },
    weight: if correct { "bold" } else { "regular" },
  )[#letter) #h(0.4em) #body #if correct [#h(1fr) ✓]],
)

#let question-slide(i, item, answers: false) = slide(
  part: "Knowledge check · Question " + str(i) + " of " + str(questions.len()),
  time: if answers { "Answers" } else { none },
)[
  #text(size: 26pt, weight: "bold")[#item.q]
  #v(0.4em)
  #if item.opts != none {
    for (j, o) in item.opts.enumerate() {
      option(letters.at(j), o, correct: answers and j == item.ans)
    }
  } else if not answers {
    block(
      width: 100%, inset: 14pt, radius: 6pt,
      stroke: (paint: muted, thickness: 1pt, dash: "dashed"),
      text(fill: muted)[Write your answer on your paper],
    )
  }
  #if answers {
    v(0.2em)
    tip(label: if item.opts == none { "Answer" } else { "Why" }, item.why)
  }
]

#let all-questions(answers: false) = {
  for (i, item) in questions.enumerate() {
    question-slide(i + 1, item, answers: answers)
  }
}

#let intro-slide(when) = slide(title: "Knowledge check · " + when, time: "15 min")[
  - *Not graded*, and anonymous
  - On your quiz sheet or a piece of paper, write your *code word* and *#when*
  - For each question, write its number and your answer (e.g. "1 b")
  - One question at a time on the screen
  #key[It's fine not to know an answer. Just leave it blank.]
]

#let rating-slide = slide(part: "Knowledge check", title: "How confident are you?")[
  Rate each from *1* (not at all) to *5* (very confident):
  #v(0.2em)
  - I can explain what a genome sequence can tell us about an SSI
  - I can run a tool in Galaxy
  - I can identify resistance genes from a genome
  - I can interpret a phylogenetic tree
  - I can plan a genomic surveillance project
]
