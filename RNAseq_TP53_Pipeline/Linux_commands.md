TP53 RNA-seq Mini Project
📌 Overview

This project demonstrates a mini RNA-seq workflow focusing on the TP53 gene in Homo sapiens. The pipeline starts with raw FASTQ data, runs quality control, trimming, alignment, and read quantification.

Instead of aligning to the full human genome, the workflow uses chromosome 17 (TP53 region) for efficiency and demonstration purposes.

🧬 Dataset

SRA Accession: SRR32105970

Type: Single-end RNA-seq FASTQ

Target: TP53 gene (Homo sapiens)

References used:

TP53 gene sequence: Ensembl ENSG00000141510

Chromosome 17 reference & GTF: UCSC Genome Browser

⚙️ Tools Used

FastQC → quality control

Trimmomatic v0.39 → adapter/quality trimming

HISAT2 → alignment

Samtools → file handling, sorting, indexing

featureCounts (Subread) → read quantification

R (Gviz) → visualization

🚀 Pipeline Steps
1. Organize project
shopt -s extglob
mv !(Handon) Handon/

2. Download dataset
mv /mnt/c/Users/HP/Downloads/SRR32105970.fastq.gz ~/TP53/
gunzip SRR32105970.fastq.gz

3. Quality check
fastqc SRR32105970.fastq

4. Adapter trimming
   
java -jar ~/Trimmomatic-0.39/trimmomatic-0.39.jar SE -phred33 \
 SRR32105970.fastq SRR32105970_trimmed.fastq \
 ILLUMINACLIP:~/Trimmomatic-0.39/adapters/TruSeq3-SE.fa:2:30:10 \
 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:20 MINLEN:36

fastqc SRR32105970_trimmed.fastq

5. Build HISAT2 index
hisat2-build Homo_sapiens_TP53_sequence.fa TP53_index

6. Align reads
hisat2 -p 1 -x TP53_index -U SRR32105970_trimmed.fastq -S SRR32105970_TP53.sam

7. Process SAM/BAM
samtools view -Sb SRR32105970_TP53.sam > SRR32105970_TP53.bam
samtools sort SRR32105970_TP53.bam -o SRR32105970_TP53_sorted.bam
samtools index SRR32105970_TP53_sorted.bam

8. Quantify reads
featureCounts -a chr17.gtf -o chr17_counts.txt -t exon -g gene_id SRR32105970_TP53_sorted.bam
samtools idxstats SRR32105970_TP53_sorted.bam

📊 Results

~18.6% of reads mapped to chromosome 17 (TP53 region).

chr17_counts.txt → exon-level read counts.

BAM index (.bai) confirms alignment worked.

FastQC reports show improved quality after trimming.

📎 Notes

Raw FASTQ not uploaded — download via SRA accession.

This project demonstrates a mini RNA-seq pipeline on a single gene.

## 📝 Notes

- This is my **first attempt at an RNA-seq project**.  
- Currently, the pipeline is documented with **Linux commands**.  
- I plan to add **bash scripts** later on future projects to automate the workflow.  

👩‍💻 Author

Bidya Rani Mohanty
M.Sc. Microbiology | Bioinformatics & Molecular Biology Enthusiast
