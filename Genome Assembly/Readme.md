# 🧬 Genome Assembly Project using SPAdes and Velvet

## 📌 Project Overview
This project demonstrates my ability to perform **de novo genome assembly** and critically evaluate results using different assembly algorithms.  
I compared two widely used assemblers – **SPAdes** and **Velvet** – across multiple k-mer sizes, followed by quality assessment with **QUAST**.  

The goal of this project was to:
- Explore how different k-mer values affect assembly quality.
- Compare the performance of SPAdes vs Velvet on the same dataset.
- Interpret assembly statistics (N50, contig count, GC%) to choose the best strategy.

This repository serves as a hands-on demonstration of my skills in **NGS data handling, genome assembly, and bioinformatics workflows**.

---

## ⚙️ Skills Demonstrated
- ✅ Linux command-line proficiency  
- ✅ Installation & execution of **SPAdes** and **Velvet**  
- ✅ Writing **Bash automation scripts** for k-mer loop runs  
- ✅ Assembly evaluation with **QUAST**  
- ✅ Result interpretation and data visualization  
- ✅ GitHub documentation and reproducibility practices  

---

## 📂 Dataset
- **Source**: NCBI SRA – *SRR32105970*  
- **Organism**: *Homo sapiens* (TP53 cDNA dataset, HCT116 cell line)  
- **Type**: Illumina single-end reads  

*(Raw FASTQ files are not uploaded due to size, but commands are reproducible with any FASTQ input.)*

---

## 🚀 Workflow

### 1. Preprocessing
- Checked read length distribution using `awk`.  
- Quality control with **FastQC**.  
- Trimming (if needed) with **Trimmomatic**.  

### 2. Assembly
- **SPAdes**: tested k-mers {21,31,41,51,61,71,81,91}  
- **Velvet**: tested k-mers {21,31,41,51,61,71,81,91}  

Both pipelines were automated using Bash scripts (`scripts/velvet_kmer_loop.sh` and `scripts/spades_quast_loop.sh`).  

### 3. Evaluation
- Assemblies compared using **QUAST v5.2.0**  
- Metrics: contig count, N50, L50, GC content, largest contig, total length  

---

## 📊 Results

### SPAdes
| K-mer | # Contigs ≥ 0 bp | # Contigs ≥ 1000 bp | Largest Contig (bp) | Total Length (bp) | N50 | L50 | GC (%) |
|-------|------------------|---------------------|----------------------|-------------------|-----|-----|--------|
| 21    | 3371             | 0                   | 648                  | 131,689           | 648 | 1   | 45.06  |
| 31    | 1559             | 0                   | 270                  | 102,266           | 130 | 79  | 52.14  |
| 41    | 784              | 0                   | 227                  | 74,844            | 123 | 39  | 52.07  |
| 51    | 529              | 0                   | 216                  | 63,347            | 121 | 28  | 52.00  |
| 61    | 419              | 0                   | 207                  | 57,109            | 120 | 23  | 52.00  |
| 71    | 342              | 0                   | 194                  | 52,814            | 120 | 19  | 52.00  |
| 81    | 290              | 0                   | 188                  | 49,856            | 119 | 16  | 52.00  |
| 91    | 254              | 0                   | 183                  | 47,528            | 118 | 14  | 52.00  |

---

### Velvet
| K-mer | # Contigs ≥ 0 bp | # Contigs ≥ 1000 bp | Largest Contig (bp) | Total Length (bp) | N50  | L50 | GC (%) |
|-------|------------------|---------------------|----------------------|-------------------|------|-----|--------|
| 21    | 5378             | 258                 | 15,831               | 2,087,569         | 2395 | 199 | 46.70  |
| 31    | 3424             | 317                 | 19,456               | 2,194,373         | 2697 | 181 | 46.69  |
| 41    | 2726             | 353                 | 22,128               | 2,254,783         | 2882 | 167 | 46.69  |
| 51    | 2159             | 375                 | 25,231               | 2,285,220         | 3020 | 157 | 46.69  |
| 61    | 1846             | 379                 | 25,518               | 2,300,703         | 3083 | 154 | 46.68  |
| 71    | 1650             | 375                 | 25,247               | 2,304,972         | 3108 | 153 | 46.68  |
| 81    | 1524             | 373                 | 24,734               | 2,304,270         | 3108 | 154 | 46.68  |
| 91    | 1444             | 372                 | 24,134               | 2,302,962         | 3102 | 154 | 46.68  |

---

### 📈 Interpretation
- **SPAdes**: Assemblies were highly fragmented across all k-mers, with very short contigs (<1 kb) and low N50 values. This suggests that SPAdes was not well-suited for this dataset (single-end cDNA reads).  
- **Velvet**: Produced much longer contigs and significantly higher N50 values (~2.3–3.1 kb). Assembly quality improved with increasing k-mer values up to 71, after which improvements plateaued.  
- **GC content** remained stable in both assemblers, indicating consistent representation of the dataset.  

**Conclusion:** Velvet outperformed SPAdes for this dataset, making it the better choice for de novo assembly under these conditions.  

---

The commands Have been provided separately.

