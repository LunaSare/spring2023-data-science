---
layout: exercise
topic: Visualizing data
title: Fitting models with multiple data sets
language: R
---

This is a follow up to [Exercise 3: Removing outliers]({{ site.baseurl }}/visualizing-exercise-removing-outliers/).

We want to compare the circumference to height relationship in acacia to the same relationship for all trees in the region. These data are stored in two different tables thats should already be in your "data-raw" folder, [TREE_SURVEYS.txt](https://figshare.com/ndownloader/files/5629536) and [ACACIA_DREPANOLOBIUM_SURVEY.txt](https://ndownloader.figshare.com/files/5629542). Make a graph with the relationship between `CIRC` and `HEIGHT` for all trees as gray circles in the background and the same relationship for acacia as red circles plotted on top of the gray circles. Scale both axes logarithmically. Include a linear model fitting for both sets of data, trying different linear models specified using the argument `method =`. Provide clear labels for the axes.

Your plot should look something like [this](https://datacarpentry.org/semester-biology/solutions/Graphing-data-from-multiple-tables-R.jpeg).

Once your are done with the exercises:

1. Save your .Rmd file and knit to PDF.
1. Add the two files, commit and push to GitHub
1. Let your instructor know that changes have been published on GitHub
