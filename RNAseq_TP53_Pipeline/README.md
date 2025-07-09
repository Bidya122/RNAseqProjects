# RNA-seq Analysis: TP53 in HCT116 Cells

This project includes quality control, alignment, and gene expression analysis of RNA-seq data targeting the TP53 gene.

### 🧪 Dataset:
- **Sample ID:** SRX27451540
- **Cell line:** HCT116
- **Gene:** TP53 (ENSG00000141510)

### 🧬 Tools Used:
- FastQC
- Trimmomatic
- HISAT2
- SAMtools
- featureCounts
- Gviz (R) – for gene model and coverage plot visualization

### 📁 File Structure:
- `Pipeline.docx`: Full step-by-step explanation
- `*.bam`, `*.bai`, `*.gtf`: Processed alignment and annotation files
- `*.fastq`: Raw and trimmed reads

### 👩‍🔬 Author: Bidya Rani Mohanty
**Note:** This analysis was performed on a Windows Subsystem for Linux (WSL1) environment, which limited my ability to process large-scale datasets. As a result, a small RNA-seq dataset (TP53 cDNA, SRX27451540) was selected to ensure smooth processing and demonstration of the full pipeline.
