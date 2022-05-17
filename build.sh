#!/bin/bash

pkg_to_build=$( cat packages )
# if bioc tagged, rm prefix
prefix="bioconductor-"

for p in $pkg_to_build ; do

  echo "Build and check package: "$p

  git clone $p
  
  pkg=$( awk -F/ '{print $NF}' <<< $p )
  # remove prefix
  pkgsed=$( echo "$pkg" | sed -e "s/^$prefix//" )

  Rscript --vanilla install_dependencies.r $pkg 2>&1 >/dev/null
  if [ $? -ne 0 ]; then
    echo $pkgsed" ERROR: Failed installing dependencies." >> summary.txt
    exit 1
  else
    echo $pkgsed" OK: installing dependencies." >> summary.txt
  fi
  
  R CMD build $pkg --no-manual --no-build-vignettes 
  if [ $? -ne 0 ]; then
    echo $pkgsed" ERROR: Failed R CMD build." >> summary.txt
    exit 1
  else
    echo $pkgsed" OK: build." >> summary.txt
  fi

  R CMD check ${pkgsed}_*.tar.gz --no-manual --no-build-vignettes 
  if [ $? -ne 0 ]; then
    echo $pkgsed" ERROR: R CMD check." >> summary.txt
    exit 1
  else
    echo $pkgsed" OK check."  >> summary.txt
  fi
  
  # include other checks, size, tarball, etc...
  
done
 
echo "Summary:"
cat summary.txt

R CMD INSTALL ExpressionAtlas*.tar.gz

R -e 'library(testthat);library(ExpressionAtlas); geod11175 <- getAtlasExperiment("E-GEOD-11175"); print(names(geod11175))'


