# RNA-seq FASTQ Processing and Gene Annotation – Mini Project

This mini-project demonstrates the basic steps of RNA-seq data processing starting from a raw FASTQ file. The goal was to perform quality control, trimming, alignment, read counting, and transcript-to-gene name annotation using a Linux-based environment as part on Hands on Training given by CATR. 

---

## 🔧 Tools Used

- **FastQC** – Quality control of raw and trimmed reads  
- **Trimmomatic** – Trimming of adapters and low-quality bases  
- **HISAT2** – Alignment to reference genome  
- **SAMtools** – BAM file conversion and sorting  
- **featureCounts (Subread)** – Counting reads aligned to genomic features  
- **WSL1** – Windows Subsystem for Linux used for all analyses

---

## 🧪 Analysis Steps

1. **Quality Control**
   - Performed on the raw FASTQ file using FastQC

2. **Trimming**
   - Low-quality bases and adapters removed using Trimmomatic

3. **Post-trimming QC**
   - Trimmed reads assessed again with FastQC

4. **Genome Indexing**
   - Index built for a reference genome (Chromosome 1 used for speed)

5. **Read Alignment**
   - Trimmed reads aligned to reference genome using HISAT2

6. **BAM Conversion and Sorting**
   - SAM to BAM conversion and sorting by genomic position using SAMtools

7. **Gene Feature Counting**
   - Aligned reads assigned to genes using featureCounts with a GTF annotation file

8. **Gene Annotation**
   - Transcript IDs mapped to gene names for easier interpretation

---

## 📁 Files Included

| File | Description |
|------|-------------|
| `demo.fastq` | Raw sequencing reads (example FASTQ) |
| `trimmed-demo.fq` | Trimmed reads |
| `demo_fastqc.html` | Quality report of raw reads |
| `trimmed-demo_fastqc.html` | Quality report after trimming |
| `chr1.fa` | Reference genome (subset) |
| `Chr1.gtf` | Gene annotation file |
| `aligned-demo.bam` | Aligned reads |
| `sorted-demo.bam` | Sorted alignment |
| `counts.txt` | Read counts per gene |
| `counts.csv` | Transcript ID to gene name mapping |
| `Linux_RNAseq_script.md` | Full Linux command script used in this workflow |

---

## 📌 Note

This project is intended as a **learning exercise** for understanding a basic RNA-seq workflow using command-line tools. The reference genome was limited to a single chromosome for demonstration purposes.

---

## 👩‍💻 Author

Bidya Rani Mohanty  
Hands-on RNA-seq Training Project on CATR (2025)
