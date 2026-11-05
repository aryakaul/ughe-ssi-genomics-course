// Shared slide theme for the lecture decks (slides/) and lab decks (labs/slides/).
// Build every deck from the repository root with ./build_slides.sh
// (requires Typst: `brew install typst`).
//
// Keep slides simple: one idea per slide, short phrases, at most ~5 bullets,
// large text. If a slide doesn't fit, split it; don't shrink the text.

#let accent = rgb("#0f5e9c")
#let accent-soft = rgb("#e8f1f8")
#let ink = rgb("#1b2430")
#let muted = rgb("#5b6675")
#let warn = rgb("#9a5a00")
#let warn-soft = rgb("#fdf3e3")

#let deck(lab: "", title: "", body) = {
  set document(title: lab + " · " + title, author: "UGHE and HMS contributors")
  set page(
    paper: "presentation-16-9",
    margin: (x: 1.5cm, top: 1.1cm, bottom: 1.3cm),
    footer: context {
      set text(size: 10pt, fill: muted)
      grid(
        columns: (1fr, auto),
        [#lab · #title · Genomic Surveillance of SSIs & AMR (UGHE–HMS)],
        counter(page).display(),
      )
    },
  )
  set text(font: ("Helvetica Neue", "Arial"), size: 20pt, fill: ink, lang: "en")
  set par(leading: 0.6em)
  set list(spacing: 0.7em, marker: text(fill: accent)[•])
  set enum(spacing: 0.7em)
  show raw: set text(font: "Menlo", size: 1.1em)
  show raw.where(block: true): it => block(
    fill: luma(244), inset: 10pt, radius: 4pt, width: 100%, it,
  )
  set table(stroke: 0.5pt + luma(190), inset: (x: 9pt, y: 7pt))
  body
}

// Table header row: bold text on a light fill.
#let th(..cells) = table.header(
  ..cells.pos().map(c => table.cell(fill: accent-soft, strong(c))),
)

#let title-slide(lab: "", title: [], when: "", mode: "", objective: "") = page(
  fill: accent,
  footer: none,
  margin: (x: 2cm, y: 1.6cm),
)[
  #set text(fill: white)
  #text(size: 13pt, weight: "bold", tracking: 1pt)[GENOMIC SURVEILLANCE OF SURGICAL SITE INFECTIONS & AMR · UGHE–HMS]
  #v(1fr)
  #text(size: 22pt, weight: "bold")[#lab]
  #v(-0.2em)
  #text(size: 36pt, weight: "bold")[#title]
  #v(0.5em)
  #text(size: 18pt)[#when \ #mode]
  #v(1fr)
  #text(size: 15pt)[#objective]
]

#let slide(title: none, part: none, time: none, body) = {
  pagebreak(weak: true)
  if part != none or time != none {
    grid(
      columns: (1fr, auto),
      text(size: 12pt, weight: "bold", fill: accent, tracking: 0.5pt, if part != none { upper(part) }),
      text(size: 12pt, fill: muted, if time != none { time }),
    )
    v(-0.3em)
  }
  if title != none {
    text(size: 28pt, weight: "bold", title)
    v(-0.5em)
    line(length: 100%, stroke: 1.5pt + accent)
    v(0.2em)
  }
  body
}

// Full-colour divider slide (swap reminders, pauses).
#let banner(heading, sub: none, fill: accent) = page(fill: fill, footer: none)[
  #set text(fill: white)
  #align(center + horizon)[
    #text(size: 44pt, weight: "bold")[#heading]
    #if sub != none [
      #v(0.3em)
      #text(size: 22pt)[#sub]
    ]
  ]
]

#let swap = banner(
  [Swap driver and navigator],
  sub: [The navigator takes the keyboard; the driver reads the handout],
)

// One big message in the middle of a white slide.
#let statement(body, sub: none) = {
  pagebreak(weak: true)
  align(center + horizon)[
    #block(width: 85%)[
      #text(size: 34pt, weight: "bold", fill: accent)[#body]
      #if sub != none [
        #v(0.4em)
        #text(size: 22pt, fill: muted)[#sub]
      ]
    ]
  ]
}

#let callout(label, colour, soft, body) = block(
  width: 100%,
  fill: soft,
  stroke: (left: 4pt + colour),
  inset: (x: 14pt, y: 10pt),
  radius: (right: 4pt),
)[
  #if label != none [
    #text(size: 13pt, weight: "bold", fill: colour, tracking: 0.5pt)[#upper(label)]
    #v(-0.5em)
  ]
  #body
]

#let check(body, label: "Check yourself") = callout(label, warn, warn-soft, body)
#let tip(body, label: none) = callout(label, accent, accent-soft, body)
// The one thing to remember from a slide.
#let key(body) = callout("Key message", accent, accent-soft, text(weight: "bold", body))

#let cols(left, right, ratio: (1fr, 1fr)) = grid(columns: ratio, gutter: 1cm, left, right)

#let credit(body) = place(bottom + left, text(size: 11pt, fill: muted, body))

// A row of big numbers: stats((value, label), (value, label), ...)
#let stats(..items) = grid(
  columns: items.pos().len() * (1fr,),
  gutter: 14pt,
  ..items.pos().map(((value, label)) => block(
    width: 100%, fill: accent-soft, inset: 14pt, radius: 6pt,
    align(center)[
      #text(size: 40pt, weight: "bold", fill: accent)[#value] \
      #text(size: 17pt)[#label]
    ],
  ))
)

// Boxes joined by arrows: flow("Collect", "Store", ...). `hl` lists the
// (0-based) steps to highlight.
#let flow(..steps, hl: (), size: 20pt) = {
  let s = steps.pos()
  let cells = ()
  for (i, step) in s.enumerate() {
    let on = i in hl
    cells.push(block(
      fill: if on { accent } else { accent-soft },
      inset: (x: 10pt, y: 12pt), radius: 6pt, width: 100%,
      align(center + horizon, text(size: size, weight: "bold", fill: if on { white } else { accent }, step)),
    ))
    if i < s.len() - 1 { cells.push(align(center + horizon, text(size: size, fill: muted)[→])) }
  }
  grid(
    columns: range(cells.len()).map(i => if calc.even(i) { 1fr } else { auto }),
    column-gutter: 6pt,
    align: horizon,
    ..cells,
  )
}

// Grid of labelled boxes: tiles(([Heading], [Text]), ...)
#let tiles(..items, columns: 2) = grid(
  columns: columns * (1fr,),
  gutter: 14pt,
  ..items.pos().map(((head, body)) => block(
    width: 100%, fill: accent-soft, inset: 14pt, radius: 6pt,
  )[
    #text(weight: "bold", fill: accent)[#head] \
    #body
  ])
)

// Tells participants which handout to open: open-handout("Lab 1", "Lab1_files_formats_galaxy.pdf")
#let open-handout(lab, file) = slide(title: "Open your handout")[
  #v(0.2em)
  #align(center)[
    #text(size: 34pt, weight: "bold", fill: accent)[#lab handout] \
    #v(0.1em)
    #text(size: 22pt)[#raw(file)]
  ]
  #v(0.4em)
  - *Download:* github.com/aryakaul/ughe-ssi-genomics-course
  - Open the `labs/pdf/` folder and click the file
  #tip[The handout has every step. Copy reads, URLs and commands from the *PDF*, not from this screen.]
]
