if (!require("remotes")) install.packages("remotes")

library(remotes)
install_deps('./bioconductor-ExpressionAtlas') 

if (!require("knitr")) install.packages("knitr")
if (!require("testthat")) install.packages("testthat")
if (!require("rmarkdown")) install.packages("rmarkdown)
