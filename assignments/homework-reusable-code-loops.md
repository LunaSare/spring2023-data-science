---
layout: page
element: assignment
title: 'Reusing code - Loops'
language: R
pagetype: 'after class'
symbol: <i class="fa fa-keyboard-o fa-lg"></i>
---

## Homework

<!-- Challenges from https://datacarpentry.org/semester-biology/assignments/r-iteration-1/-->

> **Instructions**
> - (20 points) Open a new file called "**loops-after.Rmd**" and save it in your "**documents**" folder.
> - (20 points) Write the code to solve the following exercises in R chunks.
> - (20 points) Add comments to each line of code explaining with your own words what the code is doing.
> - (20 points) Once you are finished, knit to PDF.
> - (20 points) Git add, commit and push the new files (PDF and Rmd) to your remote repository.
>

### Exercise 1: The data set

The UHURU experiment in Kenya has conducted a survey of *Acacia* and other tree species in ungulate exclosure treatments.
Each of the individuals surveyed were measured for tree height (`HEIGHT`), circumference (`CIRC`) and canopy size in two directions (`AXIS_1` and `AXIS_2`).

1. Read the UHURU tree data available for [download](https://ndownloader.figshare.com/files/5629536) in a tab delimited (`"\t"`) format using the following code:

    ```r
    tree_data <- read.csv("https://ndownloader.figshare.com/files/5629536",
                     sep = '\t',
                     na.strings = c("dead", "missing", "MISSING", "NA", "?", "3.3."))
    ```
2. What is the code doing? Explain the meaning of each argument and how the values used for each argument afect the outcome.

---

### Exercise 2: Tree volumes

{% include_relative exercises/Loops-crown-volume-calculation-R.md %}

---

### Exercise 3: Tree growth

{% include_relative exercises/Loops-tree-growth-R.md %}
