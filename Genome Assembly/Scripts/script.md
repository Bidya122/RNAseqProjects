# Genome Assembly Commands (SPAdes & Velvet)

This document contains all the installation steps, single-run commands, and automated scripts used for running **SPAdes** and **Velvet** genome assemblies, along with evaluation using **QUAST**.
Project Overview: TP53 cDNA in HCT116 Cancer Cells

Biological Model:

Cell line: HCT116 (human colorectal carcinoma, epithelial, KRAS G13 mutant)

Experimental manipulation: Researchers used multiplexed CRISPR/Cas9-nickase to induce precise single-strand DNA breaks and blocked repair with PARP inhibitors, targeting TP53 or its regulatory network (Lee et al., 2024
).

Purpose: Trigger cancer cell death in a cell-type-specific manner while minimizing off-target effects in normal cells.

Experimental Design:

Sample type: TP53 cDNA from HCT116 cells post-treatment/editing.

Library prep: Nextera DNA Library Prep.

Sequencing: Illumina iSeq 100, single-run: 13,530 spots, 4.1 M bases (~1.4 Mb download).

Study: Efficient and precise targeting of cancer cells using multiplexed CRISPR/Cas9-nickase and PARP inhibitors.

Submitted by: Lee et al., 2024.

Project accession: PRJNA1109424, SRA: SRP506582.

Data Context:

The dataset likely captures TP53 mRNA transcripts (cDNA) after genome editing and/or PARP inhibitor treatment.

Intended for downstream expression profiling, functional validation, or computational analysis of targeted TP53 pathways.

Computational Analysis:

Data: SRR32105970.fastq (single-end Illumina reads).

Assembly & QC: Velvet multi-k assembly (k = 21, 31, 41, etc.) + QUAST.

Goal: Generate the most accurate TP53 transcript assembly for downstream analyses.

---

## 📊 QUAST Installation
```bash
sudo apt install python3 python3-pip python3-matplotlib python3-numpy -y
sudo apt install ncbi-blast+ mummer -y
wget https://github.com/ablab/quast/releases/download/quast_5.2.0/quast-5.2.0.tar.gz
tar -xvzf quast-5.2.0.tar.gz
cd quast-5.2.0
./quast.py --help
```

---

### 🍀 Velvet Installation
```bash
sudo apt install velvet
git clone https://github.com/dzerbino/velvet.git
cd velvet
make 'CATEGORIES=2' 'MAXKMERLENGTH=99'
velveth --help
```
---
## velvet execution
To know the read length :
```bash
awk '(NR%4==2){print length($1)}' SRR32105970.fastq | sort -n | uniq –c
```

For alignment :
```bash
time ~/velvet/velveth output_dir 31 -fastq -short SRR32105970.fastq
~/velvet/velvetg output_dir -exp_cov auto -cov_cutoff auto
cd output_dir
ls
```
For QC of alignment :
```bash
~/quast-5.2.0/quast.py contigs.fa -o quast_report_small --min-contig 100
```

Bash script for alignment with Velvet using multiple k-mer values and QC with QUAST:
```bash
nano  velvet_quast_loop.sh
```

##bash script
```bash
#!/bin/bash

VELVETH=~/velvet/velveth
VELVETG=~/velvet/velvetg
READS=~/SRR32105970.fastq
QUAST=~/quast-5.2.0/quast.py
OUTDIR=~/velvet_output

kmers="21 31 41 51 61 71 81 91"

for k in $kmers
do
    echo "=== Running Velvet with k=$k ==="
    mkdir -p $OUTDIR/velvet_k$k

    # Step 1: velveth (prepare)
    $VELVETH $OUTDIR/velvet_k$k $k -fastq -short $READS

    # Step 2: velvetg (assemble)
    $VELVETG $OUTDIR/velvet_k$k -exp_cov auto -cov_cutoff auto

    # Step 3: run QUAST if contigs.fa exists
    if [ -f "$OUTDIR/velvet_k$k/contigs.fa" ]; then
        echo "=== Running QUAST on velvet_k$k/contigs.fa ==="
        $QUAST $OUTDIR/velvet_k$k/contigs.fa -o $OUTDIR/quast_k$k --min-contig 100
    else
        echo "!!! contigs.fa not found for k=$k. Skipping QUAST."
    fi
done

echo "All Velvet runs completed!"

```
```bash
chmod +x velvet_quast_loop.sh
```
```bash
./velvet_quast_loop.sh
```

### 🍀 Spades Installation
```bash
sudo apt update && sudo apt upgrade –y
sudo apt install build-essential python3 wget –y
wget https://github.com/ablab/spades/releases/download/v3.15.5/SPAdes-3.15.5-Linux.tar.gz
tar -xvzf SPAdes-3.15.5-Linux.tar.gz
cd SPAdes-3.15.5-Linux
./spades.py –help
python3 spades.py –help
```
##bash script
Bash script for alignment with Spades using multiple k-mer values and QC with QUAST:
```bash
#!/bin/bash

SPADES=~/SPAdes-3.15.5-Linux/bin/spades.py
FASTQ=~/SRR32105970.fastq
QUAST=~/quast-5.2.0/quast.py
OUTDIR=~/spades_output

kmers="21 31 41 51 61 71 81 91"

for k in $kmers
do
    echo "=== Running SPAdes with k=$k ==="
    $SPADES --only-assembler -s $FASTQ -k $k -o $OUTDIR/spades_k$k -t 2 -m 2

    if [ -f "$OUTDIR/spades_k$k/contigs.fasta" ]; then
        echo "=== Running QUAST on spades_k$k/contigs.fasta ==="
        $QUAST $OUTDIR/spades_k$k/contigs.fasta -o $OUTDIR/quast_k$k
    else
        echo "!!! contigs.fasta not found for k=$k. Skipping QUAST."
    fi
done

echo "All done!"

```
```bash
chmod +x spades_quast_loop.sh
```
```bash
./spades_quast_loop.sh
```















