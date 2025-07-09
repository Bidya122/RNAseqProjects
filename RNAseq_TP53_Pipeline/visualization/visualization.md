This plot was generated using the Gviz package in R and represents read coverage across the various TP53 transcript isoforms, based on RNA-seq data (SRX27451540, HCT116 cells).
- Top axis (7.665 mb to 7.685 mb):
Genomic coordinates on chromosome 17 (GRCh38/hg38).
The TP53 gene spans approximately 17:7661779–7687550.

- Left panel ("TP53 Gene"):
Label of the gene model. All transcripts belong to TP53.

- Each horizontal track (ENST... IDs):
Represents a transcript isoform of the TP53 gene. These are Ensembl Transcript IDs (e.g., ENST00000549377.5), and show exon-intron structure.

- Boxes = Exons
Thin lines = Introns
Arrow direction = transcription strand

- Orange bars inside exons:
Represent RNA-seq read coverage from your alignment (.bam file).
Higher bars = more reads mapped to that exon region.

🧪 Interpretation:
TP53 shows multiple transcript isoforms, many of which are expressed at some level in this dataset.
Strong coverage is seen in central exons, particularly those shared across transcripts.
Some isoforms (bottom tracks) show little or no expression — likely due to:
Cell-type specific expression (HCT116 cells)
Isoforms that are rarely expressed or non-coding
The visual demonstrates successful alignment and highlights dominant isoforms.

