---
layout: page
element: assignment
title: 'Intro to version control'
language: R
pagetype: activities
symbol: <i class="fa fa-keyboard-o fa-lg"></i>
---


**Day1**

> **Individual activity: Tropical plan traits data**
>
> The goals of this activity are:
>  - To practice usage of main R functions to process data tables (read, summarize and write as CSV files) using RStudio.
>  - To apply a good workflow of version control with git on a local repository using RStudio.



1. For this assignment, we are going to use the plant trait data from:
  * Razafindratsima OH, Brown KA, Carvalho F, Johnson SE, Wright PC, Dunham AE (2017) Data from: Edge effects on components of diversity and above-ground biomass in a tropical rainforest. Dryad Digital Repository. https://doi.org/10.5061/dryad.jn743
2. Follow the [link to the dataset](https://doi.org/10.5061/dryad.jn743){:target="_blank"} and download the .xlsx file.
3. Open the file in a spreadsheet program (like excel) and save the trait tab as a CSV (comma delimited) file. Make sure you saved the CSV file in the `data-raw` folder of your project.
4. Create a new file called "tropical-plant-trait.R" file.
5. In this file, write the necessary R code to perform the following challenges. After each challenge, add and commit the R script file, using an informative commit message for each commit:
  * Read the CSV file using the function `read.csv` and assign it to an object called `data_table`.
  * Use the functions `unique` and `length` to show the number of unique families found in the data frame. First, you will need to subset accordingly your `data_table` object using square brackets `[ ]`.
  * Do the same to find the number of unique "dispersal modes" and "fruit colors".
  * Use the `mean` function to calculate the average fruit width in cm.
  * Use the function `summary` on your `data_table` object. Can you find the average fruit width in the output of the function? Is it the same as the one you obtained using the function `mean`?
  * Look at the output of the function  `summary`. What is the average fruit length in cm?
  * Create the following subset CSV files of your original `data_table` object. Use square brackets to subset and the function `write.csv` to write the files into the `data` folder:
    - A subset of `data_table` that contains the first 10 rows.
    - A subset of `data_table` that contains the last 20 rows.
    - A subset of `data_table` that contains rows 12, 17, 23 and 145.
    - A subset of `data_table` that contains the first 10 rows and rows 12, 17, 23 and 145.
    - A subset of `data_table` that contains the first 5 columns and all rows.
    - A subset of `data_table` that contains the last 2 columns and all rows.
    - A subset of `data_table` that contains columns with "family", "fruit_color" and "growth_rate", and all rows.
    - A subset of `data_table` that contains the first 5 columns and rows 12, 17, 23 and 145.
  * Remember to comment your code.
6. Add and commit all CSV files that you generated. Use an informative commit message.
7. Display your git history and take a snapshot. Send the snapshot to your instructor.


<!-- * Show the number of species in each family -->
<!-- with all the species that are dispersed by lemurs and have a fruit length > 8 mm. Make sure to save the file to the `data` folder. -->
<!-- * Plot the average fruit length per seed size category using (A) all the data, and (B) the lemur subset data -->

> **Group activity: absolute and relative paths**
>
> The goals of this activity are:
>  - To practice usage of absolute and relative paths.


1. For this activity we will use a section of the code from the previous activity.
2. Go into groups and compare the paths you used to save the subsets of `data_table` in the `data` folder, and answer:
  - Did you use relative or absolute paths?
  - If you all used the absolute path to save any CSV file, what does the path look like? Do you all have the same path? What are the differences?
  - If you all used relative paths to save any of your CSV files, what does the path look like? Do you all have the same path? What are the differences?
3. Create a script called `paths.R` and write the code to:
  - Write the `data_table` object as a CSV file in your computer's home directory using an absolute path and a relative path.
  - Write the `data_table` object as a CSV file in your project's home directory using an absolute path and a relative path.


---
---

<!-- ** Day 2**

> **Activity 2: Goals**
>
> -

---

{% include assignment.html %}

2. Clone your repository in a local directory using Rstudio
  - You can find last lecture slides [here]({{ site.baseurl }}/materials/01_RIntro_VersionControl/01_RIntro_VersionControl.html){:target="_blank"}
3. Open the .R file and check its general structure
4. Comment and create sections within the R code file (e.g., libraries, data, plots, etc)

```r
# LIBS -----------------------------
# Some notes
library(tidyverse)
library(lubridate)

# DATA -----------------------------
# Some notes
dat1<-read.csv("file2.csv")
```

5. Using ``help(function)`` or ``?function`` describe what is being done in each section of the code

6. Commit your changes

9. Relabel and, if it is necessary, create new folders to organize your project for reproducibility
  * Check [here](http://www.datacarpentry.org/semester-biology/materials/project-structure/){:target="_blank"} for further information and examples
10. Commit your final changes
11. Check your commits history on your Github repository


## Assignment potential solution

* [Here](https://github.com/GlobalEcologyBiogeography/projects-structure-susyelo.git) you can see an example of how to solve the assignment.
* You can also access the files directly [here](../../solutions/Week2_solution/) -->
