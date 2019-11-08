# MCAapd (Multiple Correspondence Analysis under the available data principle)
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
res.mca.apd <- MCAapd(x)
res.mca.apd$L ## eigen values in R^p
res.mca.apd$Up ## eigen vectos in R^p
res.mca.apd$Tp ## coordinates for the individuals

## Factorial plane graph
install.packages("ade4")
library(ade4)
s.label(res.mca.apd$Tp[,2:3],add.plot = FALSE,boxes=FALSE)
s.label(res.mca.apd$Tn[,2:3],add.plot = TRUE)

```
