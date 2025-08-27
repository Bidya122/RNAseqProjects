# Genome Assembly Commands (SPAdes & Velvet)

This document contains all the installation steps, single-run commands, and automated scripts used for running **SPAdes** and **Velvet** genome assemblies, along with evaluation using **QUAST**.

---

## 📊 QUAST Installation
```bash
sudo apt install python3 python3-pip python3-matplotlib python3-numpy -y
sudo apt install ncbi-blast+ mummer -y
wget https://github.com/ablab/quast/releases/download/quast_5.2.0/quast-5.2.0.tar.gz
tar -xvzf quast-5.2.0.tar.gz
cd quast-5.2.0
./quast.py --help
```

---

### 🍀 Velvet Installation
```bash
sudo apt install velvet
git clone https://github.com/dzerbino/velvet.git
cd velvet
make 'CATEGORIES=2' 'MAXKMERLENGTH=99'
velveth --help
```
---
## velvet execution
To know the read length :
```bash
awk '(NR%4==2){print length($1)}' SRR32105970.fastq | sort -n | uniq –c
```



