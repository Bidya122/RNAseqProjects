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
