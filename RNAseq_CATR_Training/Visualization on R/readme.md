# RNA-seq Differential Expression Visualization in R

This project showcases essential RNA-seq data visualizations performed in R using differential expression results from DESeq2.

---

## 📁 Files Included

| File | Description |
|------|-------------|
| `count-new.txt` | Raw count matrix (gene expression) |
| `metadata-new.txt` | Sample condition information (e.g., Obese vs Lean) |
| `DEG_Disease_vs_control.csv` | DESeq2 results for Obese vs Lean comparison |
| `R_Deseq2_script.txt` | R script used to generate all plots |
| `volcano_plot.jpeg` | Volcano plot showing significantly differentially expressed genes |
| `pca_plot.jpeg` | PCA plot showing sample clustering based on expression |
| `ma_plot.png` | MA plot showing log2 fold change vs mean expression |
| `top_genes_plot.png` | Plot labeling the top 10 DEGs |

---

## 📊 Visualizations

### 1. Volcano Plot
Displays log2 fold change vs -log10 p-value.  
Significant genes (p < 0.05, |log2FC| > threshold) are color-coded:
- 🔵 Blue: p < 0.05  
- 🔴 Red: p < 0.05 and |log2FC| > 2

### 2. PCA Plot
Principal Component Analysis (PCA) based on variance-stabilized data (VST).  
Shows clustering of samples based on their condition (`Condition` from metadata).

### 3. MA Plot
Displays log2 fold changes vs mean expression.  
Used to spot expression shifts at various expression levels.

### 4. Top Genes Plot
Highlights the top 10 differentially expressed genes (lowest adjusted p-values) labeled directly on the volcano plot.

---

## 📦 Tools & Packages Used

-**DESeq2** - for differential expression analysis, normalization, and PCA
- **Base R plotting** - for volcano plot, MA plot, and top gene labeling

---

## 📌 Notes

- All plots were generated from count and metadata files using DESeq2 and base R.
- The comparison was made using `Condition = Obese vs Lean`
- You can modify the script and reuse it for any differential comparison with appropriate metadata.

---

## 👩‍💻 Author

Bidya Rani Mohanty  
RNA-seq Hands-on Practice Project (2025)
