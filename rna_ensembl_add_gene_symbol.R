library(AnnotationDbi)
library(data.table)
library(org.Hs.eg.db)

args <- commandArgs(TRUE)
file_in <- args[1]
file_out <- args[2]

rna<-fread(file_in,check.names = FALSE)
rna<-as.data.frame(rna)
rna$gene<-unlist(lapply(strsplit(as.character(rna$gene_id), "\\."), "[", 1))
rna$gene<-mapIds(org.Hs.eg.db, keys=rna$gene, keytype="ENSEMBL", column="SYMBOL", multiVals="first")
rna<-rna[,c(1,ncol(rna),2:(ncol(rna)-1))]
colnames(rna)[1]<-"ENSEMBL_ID"
colnames(rna)[2]<-"GENE_SYMBOL"
fwrite(rna,file_out,sep="\t")