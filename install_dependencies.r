if (!require("remotes")) install.packages("remotes")

#if (!require("devtools")) install.packages("devtools")

#if (!require("knitr")) install.packages("knitr")
#if (!require("testthat")) install.packages("testthat")
#if (!require("rmarkdown")) install.packages("rmarkdown")

library(remotes)
install_deps('./bioconductor-ExpressionAtlas', dependencies=TRUE, quiet=TRUE) 

install.packages('tinytex')
tinytex::install_tinytex()  # install TinyTeX
