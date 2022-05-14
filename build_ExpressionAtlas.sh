#!/bin/bash

git clone https://github.com/ebi-gene-expression-group/bioconductor-ExpressionAtlas

Rscript --vanilla install_dependencies.r

R CMD build bioconductor-ExpressionAtlas
if [ $? -ne 0 ]; then
  echo "ERROR: Failed R CMD build"
  exit 1
fi

R CMD check ExpressionAtlas_*.tar.gz
if [ $? -ne 0 ]; then
  echo "ERROR: R CMD check"
  exit 1
fi
