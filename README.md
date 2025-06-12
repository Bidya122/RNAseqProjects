# In Silico Study: Effects of Ethanol on Embryogenesis-Related Proteins

This bioinformatics project investigates the molecular impact of ethanol (alcohol) on key proteins involved in embryonic development using **AlphaFold** for structure prediction and **GOLD** for molecular docking.

---

## 🎯 Objectives

- Predict 3D structures of key embryogenesis-related proteins using AlphaFold.
- Simulate interactions of ethanol and related metabolites with these proteins via molecular docking.
- Analyze docking scores and binding poses to infer potential disruption.

---

## 🧬 Target Proteins

| Protein | Role | UniProt ID |
|--------|------|------------|
| SHH (Sonic Hedgehog) | Neural tube and limb patterning | [P49768](https://www.uniprot.org/uniprotkb/P49768) |
| BMP4 (Bone Morphogenetic Protein 4) | Mesoderm formation, organogenesis | [P12644](https://www.uniprot.org/uniprotkb/P12644) |
| WNT1 | Cell fate and CNS development | [P04628](https://www.uniprot.org/uniprotkb/P04628) |

---

## 🧪 Workflow

1. **Literature Search** – Identify targets affected by alcohol during pregnancy.
2. **FASTA Retrieval** – Download protein sequences from UniProt.
3. **Structure Prediction** – Use AlphaFold to predict 3D structures.
4. **Structure Preparation** – Clean and prepare PDB files.
5. **Ligand Selection** – Choose ethanol and its metabolites.
6. **Docking Simulation** – Perform docking using GOLD.
7. **Analysis** – Evaluate scores and visualize protein-ligand interactions.

---

## 🗂️ Repository Structure

alcohol-pregnancy-protein-docking/
├── data/ # FASTA sequences, ligand files
├── structures/
│ ├── predicted_structures/ # AlphaFold output PDBs
│ └── prepared_structures/ # Cleaned/modified PDBs
├── docking/
│ ├── gold_configs/ # Configuration files for GOLD
│ └── results/ # Docking results and poses
├── scripts/ # Python or Bash scripts used
└── docs/ # Literature summaries, figures

yaml
Copy
Edit

---

## 🧰 Tools Used

- [AlphaFold](https://github.com/deepmind/alphafold) – Protein structure prediction  
- [GOLD (CCDC)](https://www.ccdc.cam.ac.uk/solutions/csd-discovery/components/gold/) – Docking tool  
- [PyMOL](https://pymol.org/) – Structure visualization  
- [UniProt](https://www.uniprot.org/) – Protein sequence database  
- [PubChem](https://pubchem.ncbi.nlm.nih.gov/) – Ligand database

---

## 📌 Status

🟡 **In Progress** – Currently predicting structures and preparing ligands.

---

## 🙋‍♀️ Author

**Bidya Rani Mohanty**  
M.Sc. Microbiology | Aspiring Computational Biologist  
[LinkedIn](www.linkedin.com/in/bidya-mohanty-33b853257)  | GitHub: [your-username]

---

> This repository is part of an academic and self-learning initiative to explore the intersection of molecular biology and computational tools.

