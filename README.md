# Docker container access to Bioconductor 

Build and check with lastest Bioc version a list of packages cloned from GitHub.

1. git clone this repo

2. save url in packages

3. run docker

```
docker pull bioconductor/bioconductor_docker:devel

docker bioconductor/bioconductor_docker:devel bash build.sh 

```
