---
layout: page
element: assignment
title: 'Project Structure & manipulating data'
language: R
---

#### Learning Objectives

> Following this assignment students should be able to:
>
>  - Read files in R
> - Understand data manipulation functions in R
> - Summarise dataframes
> - Subset dataframes
> - Write csv files
> - Create basic plots

****
{% include assignment.html %}

### Assignment 1 (Homework)

1. Download the R code handout [here](https://globalecologybiogeography.github.io/Ecoinformatics/code/Week3_CodeHandout.R)
2. Download the data from [here](https://ndownloader.figshare.com/files/2292169)
  * You can also download the data directly using the following R function:
```r
download.file("https://ndownloader.figshare.com/files/2292169", "./dataFolder/mydata.csv")
```
3. Import the data file you just downloaded and complete the task listed on the R code handout
  * You can read the data file (.csv) in R using either the `read.csv` function or the `read_csv` function from the tidyverse package

```r
mydata<-read.csv("./dataFolder/mydata.csv")

library(tidyverse)
mydata<-read_csv("./dataFolder/mydata.csv")
```

  * You can use the lecture slides [here](../../materials/02_Manipulating_data/02_ManipulatingData.html){:target="_blank"} as reference, but you can also use other sources like [cheat sheets](https://www.rstudio.com/resources/cheatsheets/){:target="_blank"} and google.

#### Expected assignment outputs

* As as reference, the following are the outputs expected for each of the tasks listed in the handout.

| Task | Expected output |
|------|------------------------------------------|
|  2   |[output, .txt](../../solutions/week3_Exercise01_2.txt)|
|  3   |[output, .txt](../../solutions/week3_Exercise01_3.txt)|
|  4.1   |[output, .txt](../../solutions/week3_Exercise01_4.1.txt)|
|  4.2   |[output,  .txt](../../solutions/week3_Exercise01_4.2.txt)|
|  4.3   |[output, .txt](../../solutions/week3_Exercise01_4.3.txt)|
|  4.4   |[output, .txt](../../solutions/week3_Exercise01_4.4.txt)|
|  4.5   |[output, .txt](../../solutions/week3_Exercise01_4.5.txt)|
|  4.6   |[output, .txt](../../solutions/week3_Exercise01_4.6.txt)|
|  4.7   |[output, csv](../../solutions/week3_Exercise01_4.7.csv)|


### Assignment 2 (in class)

1. Accept the "Manipulating data" assignment [here](https://classroom.github.com/a/QQkHNkhV){:target="_blank"}
2. Clone your repository in a local directory using Rstudio
3. For this assignment, we are going to use the Trait plant data from:
  * Razafindratsima OH, Brown KA, Carvalho F, Johnson SE, Wright PC, Dunham AE (2017) Data from: Edge effects on components of diversity and above-ground biomass in a tropical rainforest. Dryad Digital Repository. https://doi.org/10.5061/dryad.jn743

4. Go to [this link](https://doi.org/10.5061/dryad.jn743){:target="_blank"} and download the .xlsx file.
5. Open the file in a spreadsheet program and save the trait tab into a .csv file (comma delimited)
6. In the "code.R" file from the assignment repository, write the necessary R code to:
  * Read the csv file
  * Show the number of unique families found in the data frame
  * Show the number of species in each family
  * Calculate the average fruit width in cm per dispersal mode
  * Create a csv file with all the species that are dispersed by lemurs and have a fruit length > 8 mm
  * Plot the number of species in each seed size category using (A) all the data, and (B) the lemur subset data



Notes: Do not forget to commit and push your main changes
