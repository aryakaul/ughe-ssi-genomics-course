# Glossary — plain-language definitions
*Keep this beside you during the labs.*

## Biology & AMR
| Term | Meaning |
|---|---|
| **Genome** | The complete DNA of an organism. A bacterial genome is about 2–6 million letters (bases) long. |
| **Base / nucleotide** | One "letter" of DNA: A, C, G or T. |
| **Chromosome** | The main DNA molecule of a bacterium (usually one, circular). |
| **Plasmid** | A small extra circle of DNA that can move between bacteria, often carrying resistance genes. |
| **Mobile genetic element (MGE)** | DNA that can move within or between genomes: plasmids, transposons, integrons. |
| **Gene** | A stretch of DNA that codes for a product (usually a protein). |
| **Allele** | One version of a gene. |
| **Mutation / SNP** | A change in DNA. A **SNP** (single-nucleotide polymorphism, "snip") is a one-letter difference. |
| **Isolate** | A pure culture of a single bacterial strain grown from a sample. |
| **Strain / clone** | Bacteria descended from a recent common ancestor; genetically nearly identical. |
| **AST** | Antibiotic susceptibility testing: the lab test (disc diffusion, MIC) that shows which drugs work. |
| **Phenotype / genotype** | Phenotype = what we observe (resistant on AST). Genotype = what is in the DNA (has a resistance gene). |
| **ESBL** | Extended-spectrum β-lactamase: an enzyme that destroys penicillins and cephalosporins (e.g. ceftriaxone). |
| **Carbapenemase** | An enzyme that destroys carbapenems (meropenem, imipenem), the "last-line" drugs. Examples: KPC, NDM, OXA-48, VIM. |
| **MRSA** | Methicillin-resistant *Staphylococcus aureus*, usually caused by the *mecA* gene. |
| **ESKAPE** | *Enterococcus, S. aureus, Klebsiella, Acinetobacter, Pseudomonas, Enterobacter*: priority hospital pathogens. |
| **High-risk clone** | A strain type known to spread widely and carry resistance (e.g. *K. pneumoniae* ST258/ST307, *E. coli* ST131). |

## Sequencing
| Term | Meaning |
|---|---|
| **WGS** | Whole-genome sequencing: reading (almost) all the DNA of an isolate. |
| **Read** | One piece of DNA sequence produced by the sequencer. |
| **Short reads (Illumina)** | 100–300 letters each, very accurate, usually produced in **pairs** (R1 and R2). |
| **Long reads (Nanopore)** | Thousands to 100,000+ letters each; good for complete genomes and plasmids. |
| **Paired-end** | Illumina reads both ends of each DNA fragment, giving two files: `_R1` and `_R2`. |
| **Library** | DNA prepared (fragmented, adapters added) so a sequencer can read it. |
| **Adapter** | A short artificial DNA sequence added during library prep; must be trimmed from reads. |
| **Barcode / multiplexing** | A tag that lets many samples be sequenced together and separated afterwards. |
| **Coverage / depth** | Average number of reads covering each position. 30× = each letter read about 30 times. |
| **Quality score (Phred, Q)** | How confident the machine is in each letter. Q20 = 1 error in 100; Q30 = 1 in 1,000. |
| **Metagenomics** | Sequencing all DNA in a sample (e.g. a swab) without culturing first. |

## Analysis
| Term | Meaning |
|---|---|
| **QC (quality control)** | Checking that reads are good enough before analysis. |
| **Trimming** | Removing adapters and low-quality ends from reads. |
| **Assembly** | Joining overlapping reads to rebuild the genome. |
| **Contig** | One continuous piece of assembled sequence. Fewer, longer contigs = better assembly. |
| **N50** | A measure of assembly quality: half the genome is in contigs at least this long. Bigger is better. |
| **Reference genome** | A well-characterised genome used for comparison. |
| **Mapping / alignment** | Placing reads onto a reference genome to find differences. |
| **Annotation** | Labelling where the genes are in a genome and what they do. |
| **MLST / ST** | Multi-locus sequence typing: names a strain by the versions of 7 genes, giving a **Sequence Type** (e.g. ST131). |
| **cgMLST** | Core-genome MLST: the same idea using ~1,000–3,000 genes, for finer resolution. |
| **SNP distance** | Number of single-letter differences between two genomes. Small = closely related. |
| **Phylogenetic tree** | A diagram showing how isolates are related; branch length = amount of genetic change. |
| **Cluster** | A group of closely related isolates (possible outbreak). |
| **Pipeline / workflow** | A series of tools run in order (e.g. QC → assembly → AMR detection). |

## Computing
| Term | Meaning |
|---|---|
| **File format** | How information is arranged in a file. The file extension (`.fastq`, `.fasta`, `.csv`) usually tells you the format. |
| **Plain text** | A file you can open in any text editor (FASTA, FASTQ and CSV are all plain text). |
| **Compressed (`.gz`)** | A zipped file. Genomic files are usually compressed to save space. |
| **FASTA** | Sequence only. Each entry is a `>name` line followed by sequence lines. Used for assemblies. |
| **FASTQ** | Reads plus quality scores; 4 lines per read. Raw data from the sequencer. |
| **CSV / TSV** | Spreadsheet-like tables separated by commas or tabs. |
| **Galaxy** | A free web platform for running bioinformatics tools without coding. |
| **History (Galaxy)** | Your workspace in Galaxy: every file and tool result, in order. |
| **Dataset (Galaxy)** | One file in your history. Green = done, yellow = running, grey = waiting, red = error. |
| **Command line / terminal / shell** | A text interface where you type commands instead of clicking. |
| **Directory** | Another word for folder. |

## Gene-name cheat sheet
| You see | It means | Resistance to |
|---|---|---|
| `mecA`, `mecC` | Altered penicillin-binding protein | Methicillin/oxacillin, most β-lactams (MRSA) |
| `blaCTX-M-*` | ESBL | 3rd-gen cephalosporins |
| `blaTEM-1`, `blaSHV-1` | Narrow-spectrum β-lactamase | Ampicillin (not ESBL unless the variant is ESBL) |
| `blaKPC-*`, `blaNDM-*`, `blaOXA-48`, `blaVIM-*`, `blaIMP-*` | Carbapenemases | Carbapenems |
| `blaOXA-23` | Carbapenemase (*Acinetobacter*) | Carbapenems |
| `gyrA`, `parC` mutations | Altered target | Fluoroquinolones (ciprofloxacin) |
| `qnr*`, `aac(6')-Ib-cr` | Plasmid-mediated | Low-level fluoroquinolone resistance |
| `aac`, `aph`, `ant`, `armA`, `rmt*` | Aminoglycoside-modifying enzymes / methylases | Gentamicin, amikacin |
| `sul1`, `sul2`, `dfrA*` | — | Sulfonamides, trimethoprim (co-trimoxazole) |
| `tet(A)`, `tet(B)`, `tet(M)` | Efflux / ribosomal protection | Tetracyclines |
| `mcr-*` | Plasmid-mediated | Colistin |
| `vanA`, `vanB` | Altered target | Vancomycin (*Enterococcus*) |
