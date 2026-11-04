#import "/slides/theme.typ": *
#show: deck.with(lab: "Lab 3", title: "A Look Under the Hood: the Command Line")

#title-slide(
  lab: "Lab 3",
  title: [A Look Under the Hood: \ the Command Line],
  when: "Day 1 · 15:45–16:45 · 60 min",
  mode: "Pairs · swap driver and navigator at Part C",
  objective: "LO3: understand what Galaxy does behind the buttons, and take a first step towards independent analysis",
)

#open-handout("Lab 3", "Lab3_command_line_taster.pdf")

#slide(title: "Why bother?")[
  - Every Galaxy tool you clicked today is a *command-line program*
  - A dozen commands let you look inside huge files and follow online tutorials
  #v(0.3em)
  #key[You don't need to become a programmer. This is the most durable skill in the course.]
]

#slide(title: "Golden rules")[
  - Commands are *case-sensitive*, and spaces matter
  - *Enter* runs a command · *↑* repeats the last one
  - *Tab* completes file names
  - *Ctrl + C* stops a running command
]

#slide(part: "Part A", time: "10 min", title: "Open a terminal inside Galaxy")[
  + Run the tool *Interactive JupyterLab Notebook* (no changes)
  + After 1–3 min: *User → Active InteractiveTools* → click the link
  + In JupyterLab: *File → New → Terminal*
  + You'll see a prompt ending in `$`. Type here.
  #v(0.3em)
  #tip[Not working? Use your laptop's *Terminal* (macOS) or *Git Bash* (Windows).]
]

#slide(part: "Part B", time: "15 min", title: "Where am I? Moving around")[
  #table(
    columns: (auto, 1fr),
    th[Command][What it does],
    [`pwd`], [*p*\rint *w*\orking *d*\irectory: where am I?],
    [`ls`], [list the files here],
    [`mkdir ssi_course`], [make a new folder],
    [`cd ssi_course`], [go into a folder],
    [`cd ..`], [go up one level],
  )
]

#slide(part: "Part B", title: "Try it")[
  #cols[
    Type each line, then press Enter:
```bash
pwd
ls
mkdir ssi_course
cd ssi_course
cd ..
pwd
cd ssi_course
```
  ][
    #check[Draw a little "tree" of the folders you moved through.]
  ]
]

#swap

#slide(part: "Part C1", time: "20 min for Part C", title: "Download the reads")[
  The same Illumina read 1 file you used in Lab 2:
```bash
wget https://zenodo.org/…/DRR187559_1.fastqsanger.bz2
ls -lh
```
  - Copy the *full URL* from your handout (Part C1)
  - `ls -lh` lists files with their sizes (K, M, G)
]

#slide(part: "Part C2", title: "Peek inside a compressed file")[
```bash
bzcat DRR187559_1.fastqsanger.bz2 | head -8
```
  - `bzcat` unzips the file as it reads it
  - `head -8` shows the first 8 lines
  - `|` is a *pipe*: it sends one command's output into the next
  #check[How many reads did you see? Point to the first read's quality line.]
]

#slide(part: "Part C3", title: "Count the reads")[
  FASTQ has 4 lines per read: *count lines, then divide by 4*
```bash
bzcat DRR187559_1.fastqsanger.bz2 | wc -l
```
  #check[How many reads? Does it match "Total sequences" in your Lab 2 FastQC report?]
]

#slide(part: "Part C3", title: "A trap")[
  Someone suggests counting reads like this:
```bash
bzcat DRR187559_1.fastqsanger.bz2 | grep -c "^@"
```
  It counts lines that start with `@`.
  #check[Why could this give the *wrong* answer? \ _Hint: which quality score is `@`?_]
]

#slide(part: "Part C4", title: "Search inside the file")[
  How many reads contain a run of 10 A's?
```bash
bzcat DRR187559_1.fastqsanger.bz2 | grep -c "AAAAAAAAAA"
```
  `grep` finds lines containing a pattern; `-c` counts them
]

#slide(part: "Part D", time: "10 min", title: "From reads to genomes")[
  Download the assembly (URL in your handout, Part D), then:
```bash
head -3 DRR187559_contigs.fasta
grep -c ">" DRR187559_contigs.fasta
```
  #check[What does `grep -c ">"` count? Compare it with *\# contigs* in QUAST.]
]

#slide(part: "Part E", time: "5 min", title: "Galaxy ↔ command line")[
  #table(
    columns: (1fr, 1fr),
    th[In Galaxy…][…on the command line],
    [Upload → Paste URL], [`wget URL`],
    [Eye icon], [`head`, `less`],
    [Line/Word/Character count], [`wc -l`],
    [History], [`history` (try it!)],
  )
  #tip[When you finish: *User → Active InteractiveTools* → *Stop* JupyterLab.]
]

#slide(title: "Cheat sheet 1: moving around")[
  #table(
    columns: (auto, 1fr),
    [`pwd`], [where am I?],
    [`ls` · `ls -lh`], [list files · with sizes],
    [`cd folder` · `cd ..`], [go into a folder · go up],
    [`mkdir name`], [make a folder],
    [`wget URL`], [download a file],
    [`history`], [commands you have run],
  )
]

#slide(title: "Cheat sheet 2: looking inside files")[
  #table(
    columns: (auto, 1fr),
    [`head -n 8 file`], [first 8 lines],
    [`wc -l file`], [count lines],
    [`grep "text" file`], [find lines containing text (`-c` counts them)],
    [`bzcat` · `zcat`], [read a .bz2 · .gz file without unzipping],
    [`cmd1 | cmd2`], [pipe: send cmd1's output into cmd2],
  )
  #v(0.3em)
  *Want more?* Software Carpentry *Unix Shell* lesson: `swcarpentry.github.io/shell-novice`
  #credit[Adapted from The Carpentries "The Unix Shell" and the GTN "CLI basics" tutorial (CC-BY 4.0).]
]
