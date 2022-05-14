#!/bin/bash

pkg_to_build = $( cat packages )

for p in $pkg_to_build; do

  echo "Buil and check package: "$p

  git clone $p
  
  pkg = $( awk -F/ '{print $NF}' <<< $p )
  
  echo $pkg

  Rscript --vanilla install_dependencies.r $pkg

  R CMD build $pkg
  if [ $? -ne 0 ]; then
    echo "ERROR: Failed R CMD build "$pkg
    exit 1
  fi

  R CMD check ${$pkg}_*.tar.gz --no-manual
  if [ $? -ne 0 ]; then
    echo "ERROR: R CMD check "$pkg
    exit 1
  fi
  
 done
