if (!require("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install("DESeq2")

library(DESeq2)

counts = read.csv("count-new.txt", sep = "\t")
rownames(counts)=counts$Symbol
counts$Symbol<-NULL

metadata=read.csv("metadata-new.txt",sep="\t")
rownames(metadata)=metadata$Samples

all(colnames(counts)==rownames(metadata))

counts.matrix<-as.matrix(counts)

dds<-DESeqDataSetFromMatrix(countData=round(counts.matrix),colData=metadata,design=~Condition)
dds <- DESeq(dds)
resultsNames(dds)  

res <- results(dds, name="Condition_Obese_vs_Lean")

summary(res)


write.csv(res, file="DEG_Disease_vs_control.csv", row.names = TRUE )

# plot the fold change over the average expression level of all samples using the MA-plot function
plotMA(res)

# Volcano plot
par(mfrow=c(1,1))
# Make a basic volcano plot
with(res, plot(log2FoldChange, -log10(pvalue), pch=20, main="Volcano plot", xlim=c(-3,3)))

# Add colored points: blue if pvalue <0.05, red if log2FC>1 and pvalue<0.05)
with(subset(res, pvalue<0.05 ), points(log2FoldChange, -log10(pvalue), pch=20, col="blue"))
with(subset(res, pvalue<0.05 & abs(log2FoldChange)>2), points(log2FoldChange, -log10(pvalue), pch=20, col="red"))

## To view topgenes
topGenes <- head(res[order(res$padj), ], 10)
View(topGenes)
text(topGenes$log2FoldChange, -log10(topGenes$padj), labels=rownames(topGenes), col="black", cex=0.6, pos=3)

##PCA Plot Analysis
vsd <- vst(dds, blind=FALSE)
plotPCA(vsd, intgroup="Condition")
