args = commandArgs(trailingOnly=TRUE)

if (length(args)!=1) {
  stop("one argument must be supplied", call.=FALSE)
} 

if (!require("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install("BiocCheck")

library(BiocCheck)

BiocCheck( args[1] )
