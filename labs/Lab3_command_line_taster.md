# Lab 3 · A Look Under the Hood: the Command Line
**Day 1 · 15:45–16:45 · 60 min · Pairs (swap driver/navigator at Part C)**
**Objective:** LO3 — Understand what Galaxy does behind the buttons, and take a first step towards independent analysis

> **Why bother?** Every Galaxy tool you clicked today is a **command-line program** running on a computer somewhere. You don't need to become a programmer, but knowing a dozen commands means you can look inside huge files, check data from a sequencing provider, and follow online tutorials. This is the most **durable** skill in this course.

> **Golden rules:** commands are **case-sensitive** · spaces matter · press **Enter** to run · press **↑** to repeat the last command · **Tab** auto-completes file names · **Ctrl + C** stops a command that is running.

---

## Part A — Open a terminal inside Galaxy (10 min)
1. On **usegalaxy.eu**, search the tools for **`Interactive JupyterLab Notebook`** and click **Run tool** (you don't need to change any settings)
2. Wait 1–3 minutes. Go to **User → Active InteractiveTools** and click the link when it appears
3. In JupyterLab: **File → New → Terminal**
4. You will see a prompt ending in `$`. This is where you type.

> *If interactive tools are down:* use your own laptop's **Terminal** (macOS/Linux) or **Git Bash** (Windows). Your facilitator has offline copies of the files.

---

## Part B — Where am I? Moving around (15 min)
Type each command and press Enter. Write down what happens.

| Command | What it does | Try it |
|---|---|---|
| `pwd` | **p**rint **w**orking **d**irectory: where am I? | `pwd` |
| `ls` | **l**i**s**t files here | `ls` |
| `mkdir` | **m**a**k**e a **dir**ectory (folder) | `mkdir ssi_course` |
| `cd` | **c**hange **d**irectory | `cd ssi_course` |
| `cd ..` | go **up** one level | `cd ..` then `pwd` |

Now go back into your new folder and stay there:
```bash
cd ssi_course
pwd
```

✍️ **Check yourself B:** Draw a little "tree" of the folders you have moved through.

---

## Part C — Get real data and look inside (20 min) · *swap driver and navigator*
### C1. Download sequencing reads
This is **the same Illumina read 1 file** you used in Lab 2:
```bash
wget https://zenodo.org/record/10669812/files/DRR187559_1.fastqsanger.bz2
ls -lh
```
`ls -lh` shows file sizes in **h**uman-readable units (K, M, G).

### C2. Peek at the start of a compressed file
The file is compressed (`.bz2`). `bzcat` decompresses it **on the fly** and `head` shows only the first lines:
```bash
bzcat DRR187559_1.fastqsanger.bz2 | head -8
```
The `|` symbol is a **pipe**: it sends the output of one command into the next.

✍️ **Check yourself C2:** How many reads did you just see? Point to the quality line of the first read.

### C3. Count the reads
FASTQ has 4 lines per read, so: **count lines, then divide by 4.**
```bash
bzcat DRR187559_1.fastqsanger.bz2 | wc -l
```
*(`wc -l` = **w**ord **c**ount, **l**ines. It may take about 20 seconds.)*

✍️ **Check yourself C3:**
1. How many reads are in this file? Does it match the "Total sequences" number in your Lab 2 FastQC report?
2. ⚠️ **Trap:** someone suggests counting reads with `grep -c "^@"` (count lines starting with `@`). Why could that give the **wrong** answer? *(Hint: look at the quality symbols table from Lab 1. Which Q score is `@`?)*

### C4. Search inside the file
`grep` finds lines that contain a pattern. How many reads contain a run of 10 A's?
```bash
bzcat DRR187559_1.fastqsanger.bz2 | grep -c "AAAAAAAAAA"
```

---

## Part D — From reads to genomes (10 min)
Download the assembled genome of the same isolate (we'll use it tomorrow):
```bash
wget https://zenodo.org/record/10572227/files/DRR187559_contigs.fasta
head -3 DRR187559_contigs.fasta
grep -c ">" DRR187559_contigs.fasta
```
✍️ **Check yourself D:**
1. What does `grep -c ">"` count, and why?
2. Compare it with the **# contigs** in your QUAST report from Lab 2.

---

## Part E — Reflection (5 min)
| You did this in Galaxy… | …the command line equivalent |
|---|---|
| Upload → Paste URL | `wget URL` |
| 👁 eye icon | `head`, `less` |
| Line/Word/Character count | `wc -l` |
| Select lines matching an expression | `grep` |
| History | `history` (try it!) |

**When you finish:** go back to Galaxy → **User → Active InteractiveTools** → **Stop** your JupyterLab, to free up resources.

## Command cheat sheet (keep this)
```
pwd                 where am I?
ls  /  ls -lh       list files / with sizes
cd folder / cd ..   go into a folder / go up
mkdir name          make a folder
head -n 8 file      first 8 lines
wc -l file          count lines
grep "text" file    find lines containing text   (-c = count them)
bzcat / zcat file   view a .bz2 / .gz file without unzipping
cmd1 | cmd2         pipe: send output of cmd1 into cmd2
wget URL            download a file
history             list commands you have run
```

**Want more?** Work through the Software Carpentry **Unix Shell** lesson (about 4 hours, self-paced): https://swcarpentry.github.io/shell-novice/. You can do it in this same JupyterLab terminal; the GTN version is at training.galaxyproject.org → Data Science → "CLI basics".

---
*Adapted from The Carpentries "The Unix Shell" and the Galaxy Training Network "CLI basics" tutorial (CC-BY 4.0).*
