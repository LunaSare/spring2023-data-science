---
layout: exercise
topic: 'Project Structure & manipulating data'
title: 'Manipulating data I'
language: R
---

* Download the R code handout [here](https://globalecologybiogeography.github.io/Ecoinformatics/code/Week3_CodeHandout.R)
* Download the data from [here](https://ndownloader.figshare.com/files/2292169)
  * You can also download the data directly using the following R function:

```
download.file("https://ndownloader.figshare.com/files/2292169", "./dataFolder/mydata.csv")
```

* Import the data file you just downloaded and complete the task listed on the R code handout
  * You can read the data file (.csv) in R using either `read.csv` or `read_csv` from the tidyverse package

```
mydata<-read.csv("./dataFolder/mydata.csv")

library(tidyverse)
mydata<-read_csv("./dataFolder/mydata.csv")
```

* As as reference, you can see the output expected for each of the tasks listed in the handout.
