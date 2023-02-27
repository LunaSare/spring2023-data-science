---
layout: exercise
topic: Visualizing data
title: The UHURU data set
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
