#!/bin/bash

pkg_to_build=$( cat packages )

for p in $pkg_to_build ; do

  echo "Build and check package: "$p

  git clone $p
  
  pkg=$( awk -F/ '{print $NF}' <<< $p )
  
  #echo $pkg

  Rscript --vanilla install_dependencies.r $pkg  # 2>&1 >/dev/null

  R CMD build $pkg --no-manual --no-build-vignettes 
  if [ $? -ne 0 ]; then
    echo $pkg"  ERROR: Failed R CMD build." >> summary.txt
    exit 1
  else
    echo $pkg"  build OK." >> summary.txt
  fi
  
  # if bioc tagged, rm prefix
  prefix="bioconductor-"
  pkg=$( echo "$pkg" | sed -e "s/^$prefix//" )

  R CMD check ${pkg}_*.tar.gz --no-manual --no-build-vignettes 
  if [ $? -ne 0 ]; then
    echo $pkg"  ERROR: R CMD check." >> summary.txt
    exit 1
  else
    echo $pkg"  check OK."  >> summary.txt
  fi
  
  # include other checks, size, tarball, etc...
  
done
 
echo "Summary:"
cat summary.txt
