---
layout: page
element: assignment
title: 'Joining data'
language: R
pagetype: 'after class'
symbol: <i class="fa fa-keyboard-o fa-lg"></i>
---

## Homework Day 1: Joining data tables practice

### Exercise 3: From join to plot
<!-- https://github.com/datacarpentry/semester-biology/blob/main/exercises/Portal-data-review-R.md -->
 1. Create a data frame with only data for the "species_id" "DO", with the columns `"year"`, `"month"`, `"day"`, `"species_id"`, and `"weight"`.
 2. Create a data frame with only data for species IDs `"PP"` and `"PB"` and for years starting in 1995, with the columns `"year"`, `"species_id"`, and `"hindfoot_length"`, with no missing values for `"hindfoot_length"`.
 3. Create a data frame with the average `"hindfoot_length"` for each `"species_id"` in each `"year"` with no null values.
 4. Create a data frame with the `"year"`, `"genus"`, `"species"`, `"weight"` and `"plot_type"` for all cases where the `"genus"` is `"Dipodomys"`.
 5. Make a scatter plot with `"weight"` on the x-axis and `"hindfoot_length"` on the y-axis. Use a `log10()` scale on the x-axis. Color the points by `"species_id"`. Include good axis labels.
 6. Make a histogram of weights with a separate subplot for each `"species_id"`. Do not include species with no weights. Set the `"scales"` argument to `"free_y"` so that the y-axes can vary. Include good axis labels.
 7. **Optional challenge**: Make a plot with histograms of the weights of three species, `"PP"`, `"PB"`, and `"DM"`, colored by `"species_id"`, with a different facet (i.e., subplot) for each of three `"plot_type"`'s `"Control"`, `"Long-term Krat Exclosure"`, and `"Short-term Krat Exclosure"`. Include good axis labels and a title for the plot. Export the plot to a PNG file.

### Exercise 4: Challenge
<!-- https://github.com/datacarpentry/semester-biology/blob/main/exercises/Portal-data-challenge-R.md -->

Develop a data manipulation pipeline for the Portal surveys table that produces a table of data for only the three _Dipodomys_ species (`"DM"`, `"DO"`, `"DS"`).
- The species IDs should be presented as lower case, not upper case. Search which function can help you do this.
- The table should contain information on the date, the species ID, the weight and hindfoot length.
- The data should not include null values for either weight or hindfoot length.
- The table should be sorted first by the species (so that each species is grouped together) and then by weight, with the largest weights at the top.

### You finished homework day 1!


![](https://upload.wikimedia.org/wikipedia/commons/1/1b/Merriam%27s_kangaroo_rat_%28Dipodomys_merriami%2C_F_Heteromyidae%29_%2811040259915%29.jpg)
<!-- ![](https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Kangaroo-rat.jpg/440px-Kangaroo-rat.jpg) -->
<!-- ![](https://upload.wikimedia.org/wikipedia/commons/9/98/Caloprymnus.jpg) -->
<!-- ![](https://www.biolib.cz/IMG/GAL/BIG/355962.jpg) -->
<!-- ![](https://miro.medium.com/max/800/0*yvXvL--ediuoJwzb.png) -->

---
---
---

## Homework Day 2: Shrub volume data set - part 2

### Exercise 4: Joining data tables

<!-- https://github.com/datacarpentry/semester-biology/blob/main/exercises/Dplyr-shrub-volume-join-R.md -->

In addition to the main data table on shrub dimensions, Dr. Granger has two additional data tables.
The first describes the manipulation for each experiment.
The second provides information about the different sites.
Check if the files `shrub-volume-experiments.csv` and `shrub-volume-data.csv` are in your work space.


1. Import the experiments data and then use `inner_join()` to combine it with the shrub volume data to add a `"manipulation"` column to the shrub data.
2. Import the [shrub volume sites data]({{ site.baseurl }}/data/shrub-volume-sites.csv) and then combine it with both the data on [shrub volume data]({{ site.baseurl }}/data/shrub-volume-experiments.csv) and the [experiments data]({{ site.baseurl }}/data/shrub-volume-experiments.csv) to produce a single data frame that contains all of the data.

### Exercise 5: Vectors
<!-- This exercise is a combination of the two following exercises: -->
<!-- https://github.com/datacarpentry/semester-biology/blob/main/exercises/Vectors-shrub-volume-vectors-R.md -->
<!-- https://github.com/datacarpentry/semester-biology/blob/main/exercises/Vectors-nulls-in-vectors-R.md -->

You have data on the length, width, and height of 10 individuals of the yew
[*Taxus baccata*](https://en.wikipedia.org/wiki/Taxus_baccata) stored in the
following vectors:

```
length <- c(2.2, 2.1, 2.7, 3.0, 3.1, 2.5, 1.9, 1.1, 3.5, 2.9)
width <- c(1.3, 2.2, 1.5, 4.5, 3.1, NA, 1.8, 0.5, 2.0, 2.7)
height <- c(9.6, 7.6, 2.2, 1.5, 4.0, 3.0, 4.5, 2.3, 7.5, 3.2)
```

Copy these vectors into your Rmd file, and use them to get the correct answers.

**Hint**: Remember the effect of missing values for R evaluations. You'll need to use `na.rm = TRUE` or remove missing values using `is.na()` to get the correct result.

1. The smallest value of length, width and height.
2. The largest value of length, width and height.
3. The sum of the values length, width and height, separately.
4. The average of the length, width and height.
5. The volume of each shrub (length × width × height).
   *Storing this as an object or variable will make some of the next problems easier*.
6. The sum of the volume of all of the shrubs.
7. A vector of the height of shrubs with lengths > 2.5.
8. A vector of the height of shrubs with heights > 5.
9. A vector of the heights of the first 5 shrubs (using `[]`).
10. A vector of the volumes of the first 3 shrubs (using `[]`).
11. A vector of the volumes of the last 5 shrubs with the code written so that it will return the last 5 values regardless of the length of the vector (i.e., it will give the last 5 values if there are 10, 20, or 50 individuals).


### Exercise 6: Data frames
<!-- https://github.com/datacarpentry/semester-biology/blob/main/exercises/Data-frames-shrub-volume-data-frame-R.md -->
One of your collaborators has posted [a comma-delimited text file]({{
site.baseurl }}/data/shrub-dimensions-labeled.csv) online for you to analyze.
The file contains dimensions of a series of shrubs (shrubID, length, width,
height) and they need you to determine their volumes
(`length * width * height`). You could do this using a spreadsheet, but the
project that you are working on is going to be generating lots of these files so
you decide to write a program to automate the process.

Download the data and save itto the appropriate folder, use `read.csv()` to import it into R, and use it to produce the following information:

1. A vector of shrub lengths
2. A vector of the volume of each of the shrubs
3. A data frame with just the shrubID and height columns
4. A data frame with the second row of the full data frame
5. A data frame with the first 5 rows of the full data frame

### You finished homework day 2!

![](https://www.kew.org/sites/default/files/2019-02/Taxus-baccata.jpg)
