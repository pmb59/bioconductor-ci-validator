# Bioconductor package CI validator

The motivation is to use a CI tool and Docker Bioc-devel to check the validity of a list of R packages in GitHub repositories.
- R CMD Build
- R CMD check
- Bioconductor-specific package checks with [BiocCheck](https://doi.org/doi:10.18129/B9.bioc.BiocCheck) 

### Prerequisites

Set a CircleCI account.

###  Use 

Fork the repo, and edit the packages list
```
https://github.com/ebi-gene-expression-group/bioconductor-ExpressionAtlas
https://github.com/pmb59/fCCAC
```
