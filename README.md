# nipals - MCA (Multiple Correspondence Analysis)
This repository contains the necessary elements to reproduce the results of the manuscript "Missing Data in Multiple Correspondence Analysis under the Available Data Principle of the NIPALS Algorithm"

MCAapd provides a single function to perform Multiple Correspondence Analysis in the presence of missing data without using imputation techniques, by using the available data principle of the nonlinear estimation by iterative partial least squares (NIPALS) algorithm.

Repository: https://github.com/AndresOchoaRSA/MCAapd

## Minimal Example
You need to download all the repository, then open the MCAapd.Rproj now you can reproduce the next outputs

```R
# load the function
source("R/MCAapd.R")
# get the information
x <- read.table("data/With10NA.txt")
MCAapd(x)
```