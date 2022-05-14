args = commandArgs(trailingOnly=TRUE)

if (length(args)!=1) {
  stop("one argument must be supplied", call.=FALSE)
} 

if (!require("remotes")) install.packages("remotes")

#if (!require("devtools")) install.packages("devtools")
if (!require("tinytex")) install.packages("tinytex")
library("tinytex")
tinytex::install_tinytex()  # install TinyTeX


library(remotes)
install_deps(paste0('./',args[1]), dependencies=TRUE, quiet=FALSE) 

