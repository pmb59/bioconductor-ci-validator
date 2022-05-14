#!/bin/bash

pkg_to_build=$( cat packages )

for p in $pkg_to_build ; do

  echo "Build and check package: "$p

  git clone $p
  
  pkg=$( awk -F/ '{print $NF}' <<< $p )
  
  #echo $pkg

  Rscript --vanilla install_dependencies.r $pkg 2>&1 >/dev/null

  R CMD build $pkg
  if [ $? -ne 0 ]; then
    echo "ERROR: Failed R CMD build "$pkg
    exit 1
  else
    echo $pkg" build OK.----------"
  fi

  R CMD check *${pkg}_*.tar.gz --no-manual
  if [ $? -ne 0 ]; then
    echo "ERROR: R CMD check "$pkg
    exit 1
  else
    echo $pkg" check OK.----------"
  fi
  
  # include other checks, size, tarball, etc...
  
  # change name to repo docker-bioconductor-validator
  
 done
