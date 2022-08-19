# Bioconductor package CI validator

The motivation of this repository is to use a CI tool and Docker Bioc-devel to check the validity of a list of R packages in GitHub repositories. For each package in listed in the file `packages`, it runs:
- R CMD Build
- R CMD check
- Bioconductor-specific package checks with [BiocCheck](https://doi.org/doi:10.18129/B9.bioc.BiocCheck) 

### Prerequisites

Set up a [CircleCI](https://circleci.com/signup/) account.

###  Use 

Fork the repo, and edit the packages list:
```
https://github.com/pmb59/fCCAC
https://github.com/pmb59/CexoR
https://github.com/ebi-gene-expression-group/bioconductor-ExpressionAtlas
```
