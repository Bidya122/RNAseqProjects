## RNA-seq Analysis: TP53 in HCT116 Cells

This project includes quality control, alignment, and gene expression analysis of RNA-seq data targeting the TP53 gene.   
## 📌 Overview
This project demonstrates a **mini RNA-seq workflow** focusing on the **TP53 gene** in *Homo sapiens*.    
The pipeline starts with raw FASTQ data, runs quality control, trimming, alignment, and read quantification.    
Instead of aligning to the full human genome, the workflow uses **chromosome 17 (TP53 region)** for efficiency and demonstration purposes.    

### 🧪 Dataset:
- **Sample ID:** SRX27451540
- **Cell line:** HCT116
- **Gene:** TP53 (ENSG00000141510)
- **SRA Accession**: [SRR32105970](https://www.ncbi.nlm.nih.gov/sra/?term=SRR32105970)  
- **Type**: Single-end RNA-seq FASTQ  
- **Target**: TP53 gene (*Homo sapiens*)  
- **References used**:  
- TP53 gene sequence: [Ensembl ENSG00000141510](https://asia.ensembl.org/Homo_sapiens/Gene/Sequence?g=ENSG00000141510;r=17:7661779-7687546)  
- Chromosome 17 reference & GTF: UCSC Genome Browser  

### 🧬 Tools Used:
- FastQC
- Trimmomatic
- HISAT2
- SAMtools
- featureCounts
- Gviz (R) – for gene model and coverage plot visualization

### 📁 File Structure:
**workflow**

## 1. Dataset Download  
(as I am working on WSL1 I had to move the file to that)
```bash
mv /mnt/c/Users/HP/Downloads/SRR32105970.fastq.gz ~/TP53/gunzip SRR32105970.fastq.gz
```
## 2. Quality check (FastQC)
```bash
fastqc SRR32105970.fastq
```
## 3. Adapter trimming (Trimmomatic)
```bash
java -jar ~/Trimmomatic-0.39/trimmomatic-0.39.jar SE -phred33 SRR32105970.fastq SRR32105970_trimmed.fastq ILLUMINACLIP:~/Trimmomatic-0.39/adapters/TruSeq3-SE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:20 MINLEN:36
```
## 4. Quality check trimmed file (FastQC)
```bash
fastqc SRR32105970_trimmed.fastq
```
## 5. Build HISAT2 index
```bash
hisat2-build Homo_sapiens_TP53_sequence.fa TP53_index
```
## 6. Align reads (HISAT2)
```bash
hisat2 -p 1 -x TP53_index -U SRR32105970_trimmed.fastq -S SRR32105970_TP53.sam
```
## 7. Process SAM/BAM files (Samtools)
```bash
samtools view -Sb SRR32105970_TP53.sam > SRR32105970_TP53.bam  
samtools sort SRR32105970_TP53.bam -o SRR32105970_TP53_sorted.bam  
samtools index SRR32105970_TP53_sorted.bam  
```
## 8. Quantify reads (featureCounts)
```bash
featureCounts -a chr17.gtf -o chr17_counts.txt -t exon -g gene_id SRR32105970_TP53_sorted.bam
```
```bash
samtools idxstats SRR32105970_TP53_sorted.bam
```
### 👩‍🔬 Author: Bidya Rani Mohanty
**Note:** This analysis was performed on a Windows Subsystem for Linux (WSL1) environment, which limited my ability to process large-scale datasets. As a result, a small RNA-seq dataset (TP53 cDNA, SRX27451540) was selected to ensure smooth processing and demonstration of the full pipeline.
