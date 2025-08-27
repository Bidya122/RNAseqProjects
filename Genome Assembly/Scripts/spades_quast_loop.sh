
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

