#!/bin/bash

git clone https://github.com/ebi-gene-expression-group/bioconductor-ExpressionAtlas

R CMD build bioconductor-ExpressionAtlas

R CMD check ExpressionAtlas_*.tar.gz
