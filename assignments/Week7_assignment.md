---
layout: page
element: assignment
title: 'Visualizing data'
language: R
---


### In-class Activity (20 min): Acacia and ants

**Exercise 1**. Scatterplots
<!-- https://github.com/datacarpentry/semester-biology/blob/main/exercises/Graphing-acacia-ants-R.md -->

1. Make a scatter plot with `CIRC` on the x axis and `AXIS1` (the maximum canopy
   width) on the y axis. Label the x axis "Circumference" and the y axis "Canopy
   Diameter".
2. The same plot as (1), but with both axes scaled logarithmically (using `scale_x_log10()` and `scale_y_log10()`).
3. The same plot as (1), but with points colored based on the `ANT` column (the species of ant symbiont living with the acacia)
4. The same plot as (3)), but instead of different colors show different species of ant (values of `ANT` column) each in a separate subplot.
5. The same plot as (4) but add a simple model of the data by adding `geom_smooth()`.

**Exercise 2**. Histograms
<!-- https://github.com/datacarpentry/semester-biology/blob/main/exercises/Graphing-acacia-ants-histograms-R.md -->

1. Make a bar plot of the number of acacia with each mutualist ant species (using the `ANT` column).
2. Make a histogram of the height of acacia (using the `HEIGHT` column). Label
   the x axis "Height (m)" and the y axis "Number of acacia trees".
3. Make a plot that shows histograms of both `AXIS1` and `AXIS2`. Due to the way
   the data is structured you’ll need to add a 2nd `geom_histogram()` layer that
   specifies a new aesthetic. To make it possible to see both sets of bars
   you’ll need to make them transparent with the optional argument `alpha = 0.3`.
   Set the color for `AXIS1` to "red" and `AXIS2` to "black" using the `fill =`
   argument. Label the x axis "Canopy Diameter(m)" and the y axis "Number of Acacia".
4. Use `facet_wrap()` to make the same plot as (3) but with one subplot for each experimental
   treatment in `TREATMENT`. Set the number of bins in the histogram to 10.

Once your are done with the exercises:

1. Save your .Rmd file and knit to PDF.
1. Add the two files, commit and push to GitHub
1. Let your instructor know that changes have been published on GitHub

---
---

### Home exercises (20 min): Acacia vs trees

**Exercise 3**.
<!-- https://raw.githubusercontent.com/datacarpentry/semester-biology/main/exercises/Graphing-acacia-ants-data-manip-R.md -->

1. Download the file [TREE_SURVEYS.txt](https://figshare.com/ndownloader/files/5629536) and save it to your "data-raw" folder
2. Read the file with the function `read_tsv` from the package `readr` and assign it to an object called `trees`:
```r
trees <- read_tsv("TREE_SURVEYS.txt",
                  col_types = list(HEIGHT = col_double(),
                                   AXIS_2 = col_double()))
```
3. Add a new column to the `trees` data frame that is named `canopy_area` and contains
   the estimated canopy area calculated as the value in the `AXIS_1` column
   times the value in the `AXIS_2` column.
4. Subset the `trees` data frame with just the `SURVEY`, `YEAR`, `SITE`, and `canopy_area` columns.
5. Make a scatter plot with `canopy_area` on the x axis and `HEIGHT` on the y
   axis. Color the points by `TREATMENT` and create a subplot per species uding the function `facet_wrap()`. This will plot the points for each variable in
   the `SPECIES` column in a separate subplot. Label the x axis "Canopy Area
   (m)" and the y axis "Height (m)". Make the point size 2.
6. That's a big outlier in the plot from (2). 50 by 50 meters is a little too
   big for a real acacia tree, so filter the data to remove any values for `AXIS_1`
   and `AXIS_2` that are over 20 and update the data frame. Then, remake the graph.
7. For this question you will use the package `dplyr` and the pipe operator `%>%`. To learn more about the pipe operator and how to use it, [watch this introductory video](https://www.youtube.com/watch?v=ui3VZeuN8QY). <!-- Another good introductory video on pipes: https://www.youtube.com/watch?v=3PMBr1RhdqM -->
   Using the data without the outlier -- i.e., the data generated in (6),
   create a data fram called `abundance` that shows how the abundance of each species
   has been changing through time.
   To do this, use the functions `group_by()`, `summarize()`, and `n()` to make a data frame with `YEAR`,
   `SPECIES`, and a `species_abundance` column that has the number of individuals
   per species per year. For guidance, look at the examples of the functions `group_by()` (using `help(group_by)` and `summarize()` (using `help(summarize)`).
   Print out the `abundance` data frame.
8. Using the data frame generated in (7),
   make a line plot with points (by using `geom_line()` in addition to
   `geom_point()`) with `YEAR` on the x axis and `abundance` on the y axis with
   one subplot per species. To let you see each trend clearly, let the scale for
   the y axis vary among plots by adding `scales = "free_y"` as an optional argument to `facet_wrap()`.

**Exercise 4**.
<!-- https://github.com/datacarpentry/semester-biology/blob/main/exercises/Graphing-data-from-multiple-tables-R.md -->

We want to compare the circumference to height relationship in acacia to the same relationship for all trees in the region. These data are stored in two different tables. Make a graph with the relationship between `CIRC` and `HEIGHT` for all trees as gray circles in the background and the same relationship for acacia as red circles plotted on top of the gray circles. Scale both axes logarithmically. Include linear models for both sets of data. Provide clear labels for the axes.


Your plot should look something like [this](https://datacarpentry.org/semester-biology/solutions/Graphing-data-from-multiple-tables-R.jpeg).

Once your are done with the exercises:

1. Save your .Rmd file and knit to PDF.
1. Add the two files, commit and push to GitHub
1. Let your instructor know that changes have been published on GitHub
