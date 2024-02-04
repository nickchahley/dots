#!/usr/bin/env Rscript
# run this as a non-sudo user. First time will need to answer yes a few times
# to create local libs for installing r packages
if (!require("BiocManager"))
    install.packages("BiocManager")
BiocManager::install(version = "3.17")
# mageckflute is the standard pooled crispr screen toolkit
BiocManager::install("MAGeCKFlute")

# seurat and bpcells for scRNAseq 
install.packages(c('Seurat','remotes'))
remotes::install_github("bnprks/BPCells")

# seuratData for package vignettes
# install.packages('devtools')
remotes::install_github('satijalab/seurat-data')

# tidyproteomics
# required apt install r-cran-devtools, install from R did not work
if (!require("devtools", quietly = TRUE))
    install.packages("devtools")
BiocManager::install(c("limma","qvalue","fgsea"))
devtools::install_github("jeffsocal/tidyproteomics")
