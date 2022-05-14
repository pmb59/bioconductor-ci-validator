# Docker container access to Bioconductor 

Build and check with lastest Bioc version a list of packages cloned from GitHub.

```
docker pull bioconductor/bioconductor_docker:devel

docker bioconductor/bioconductor_docker:devel bash build.sh 

```
