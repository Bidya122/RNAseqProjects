# Genome Assembly Commands (SPAdes & Velvet)

This document contains all the installation steps, single-run commands, and automated scripts used for running **SPAdes** and **Velvet** genome assemblies, along with evaluation using **QUAST**.

---
## 📊 QUAST installation

Copy code
sudo apt install python3 python3-pip python3-matplotlib python3-numpy -y
sudo apt install ncbi-blast+ mummer -y
wget https://github.com/ablab/quast/releases/download/quast_5.2.0/quast-5.2.0.tar.gz
tar -xvzf quast-5.2.0.tar.gz
cd quast-5.2.0
./quast.py --help
## 🧩 Velvet

### Velvet Installation
```bash
sudo apt install velvet
git clone https://github.com/dzerbino/velvet.git
cd velvet
make 'CATEGORIES=2' 'MAXKMERLENGTH=99'
velveth --help
Check read length
bash
Copy code
awk '(NR%4==2){print length($1)}' SRR32105970.fastq | sort -n | uniq -c
Single run example
bash
Copy code
time ~/velvet/velveth output_dir 31 -fastq -short SRR32105970.fastq
~/velvet/velvetg output_dir -exp_cov auto -cov_cutoff auto
cd output_dir
ls
QC of alignment
bash
Copy code
~/quast-5.2.0/quast.py contigs.fa -o quast_report_small --min-contig 100
Automated loop for multiple k-mers
bash
Copy code
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

    # Step 1: velveth
    $VELVETH $OUTDIR/velvet_k$k $k -fastq -short $READS

    # Step 2: velvetg
    $VELVETG $OUTDIR/velvet_k$k -exp_cov auto -cov_cutoff auto

    # Step 3: QUAST
    if [ -f "$OUTDIR/velvet_k$k/contigs.fa" ]; then
        echo "=== Running QUAST on velvet_k$k/contigs.fa ==="
        $QUAST $OUTDIR/velvet_k$k/contigs.fa -o $OUTDIR/quast_k$k --min-contig 100
    else
        echo "!!! contigs.fa not found for k=$k. Skipping QUAST."
    fi
done

echo "All Velvet runs completed!"
Make the script executable and run:

bash
Copy code
chmod +x velvet_kmer_loop.sh
./velvet_kmer_loop.sh
🧬 SPAdes
Installation
bash
Copy code
sudo apt update && sudo apt upgrade -y
sudo apt install build-essential python3 wget -y
wget https://github.com/ablab/spades/releases/download/v3.15.5/SPAdes-3.15.5-Linux.tar.gz
tar -xvzf SPAdes-3.15.5-Linux.tar.gz
cd SPAdes-3.15.5-Linux
./spades.py --help
python3 spades.py --help
Automated loop for multiple k-mers
bash
Copy code
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
Run:

bash
Copy code
chmod +x spades_quast_loop.sh
./spades_quast_loop.sh
Example: single run
bash
Copy code
~/SPAdes-3.15.5-Linux/bin/spades.py --only-assembler -s ~/SRR32105970.fastq -k 71 -o ~/spades_output/spades_k71_test --threads 2 --memory 2
Run QUAST on results
bash
Copy code
~/quast-5.2.0/quast.py contigs.fasta -o ~/spades_output/quast_k31_test
If contigs are shorter than 500 bp:

bash
Copy code
~/quast-5.2.0/quast.py ~/spades_output/spades_k51_test/contigs.fasta -o ~/spades_output/quast_k51_test --threads 2 --min-contig 100
