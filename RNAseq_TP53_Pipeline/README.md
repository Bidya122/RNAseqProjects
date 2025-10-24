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

### 👩‍🔬 Author: Bidya Rani Mohanty
**Note:** This analysis was performed on a Windows Subsystem for Linux (WSL1) environment, which limited my ability to process large-scale datasets. As a result, a small RNA-seq dataset (TP53 cDNA, SRX27451540) was selected to ensure smooth processing and demonstration of the full pipeline.
