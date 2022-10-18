---
layout: page
element: assignment
title: 'Joining data tables'
language: R
pagetype: activities
symbol: <i class="fa fa-keyboard-o fa-lg"></i>
---

## Day 1

<!-- https://github.com/datacarpentry/semester-biology/blob/main/exercises/Vectors-nulls-in-vectors-R.md -->

Cut and paste the following vector into your Rmd file.
Then write the necessary code to print the requested values.
You'll need to use `na.rm = TRUE` to ignore the missing values.

```
numbers <- c(7, 6, 22, 5, NA, 42)
```

1. The smallest number in the `numbers` vector
2. The largest number in the `numbers` vector
3. The average of the numbers in the `numbers`
4. The sum of the values in the `numbers` vector

---
---

## Day 2: Shrub volume data set - part 2

### Exercise 4: Joining data tables

<!-- https://github.com/datacarpentry/semester-biology/blob/main/exercises/Dplyr-shrub-volume-join-R.md -->

In addition to the main data table on shrub dimensions, Dr. Granger has two additional data tables.
The first describes the manipulation for each experiment.
The second provides information about the different sites.
Check if the files `shrub-volume-experiments.csv` and `shrub-volume-sites.csv` are in your work space (your instructor may have already added them).
If not download the [experiments data]({{ site.baseurl }}/data/shrub-volume-experiments.csv) and the [sites data]({{ site.baseurl }}/data/shrub-volume-sites.csv).

1. Import the experiments data and then use `inner_join` to combine it with the shrub dimensions data to add a `manipulation` column to the shrub data.
2. Import the sites data and then combine it with both the data on shrub dimensions and the data on experiments to produce a single data frame that contains all of the data.

### Exercise 5: Vectors
<!-- https://github.com/datacarpentry/semester-biology/blob/main/exercises/Vectors-shrub-volume-vectors-R.md -->
You have data on the length, width, and height of 10 individuals of the yew
[*Taxus baccata*](https://en.wikipedia.org/wiki/Taxus_baccata) stored in the
following vectors:

```
length <- c(2.2, 2.1, 2.7, 3.0, 3.1, 2.5, 1.9, 1.1, 3.5, 2.9)
width <- c(1.3, 2.2, 1.5, 4.5, 3.1, NA, 1.8, 0.5, 2.0, 2.7)
height <- c(9.6, 7.6, 2.2, 1.5, 4.0, 3.0, 4.5, 2.3, 7.5, 3.2)
```

Copy these vectors into an R script and then determine the following:

1. The volume of each shrub (length × width × height).
   *Storing this in a variable will make some of the next problems easier*.
2. The sum of the volume of all of the shrubs (using the `sum` function).
3. A vector of the height of shrubs with lengths > 2.5.
4. A vector of the height of shrubs with heights > 5.
5. A vector of the heights of the first 5 shrubs (using `[]`).
6. A vector of the volumes of the first 3 shrubs (using `[]`).

*Optional Challenge*: A vector of the volumes of the last 5 shrubs with the code written so that it will return the last 5 values regardless of the length of the vector (i.e., it will give the last 5 values if there are 10, 20, or 50 individuals).

### Exercise 6: Data frames
<!-- https://github.com/datacarpentry/semester-biology/blob/main/exercises/Data-frames-shrub-volume-data-frame-R.md -->
One of your collaborators has posted [a comma-delimited text file]({{
site.baseurl }}/data/shrub-dimensions-labeled.csv) online for you to analyze.
The file contains dimensions of a series of shrubs (shrubID, length, width,
height) and they need you to determine their volumes
(`length * width * height`). You could do this using a spreadsheet, but the
project that you are working on is going to be generating lots of these files so
you decide to write a program to automate the process.

Download the data, use `read.csv()` to import it into R, and use it to produce the following information:

1. A vector of shrub lengths
2. A vector of the volume of each of the shrubs
3. A data frame with just the shrubID and height columns
4. A data frame with the second row of the full data frame
5. A data frame with the first 5 rows of the full data frame
