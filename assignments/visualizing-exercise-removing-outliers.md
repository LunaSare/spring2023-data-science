---
layout: exercise
topic: Visualizing data
title: Removing outliers
language: R
---

1. Download the file [TREE_SURVEYS.txt](https://figshare.com/ndownloader/files/5629536) and save it to your "data-raw" folder
2. Read the file with the function `read_tsv` from the package `readr` and assign it to an object called `trees`:
```r
trees <- read_tsv("TREE_SURVEYS.txt",
                  col_types = list(HEIGHT = col_double(),
                                   AXIS_2 = col_double()))
```
3. Use the `$` to add a new column to the `trees` data frame that is named `canopy_area` and contains
   the estimated canopy area calculated as the value in the `AXIS_1` column
   times the value in the `AXIS_2` column.
4. Create a subset the `trees` data frame with just the `SURVEY`, `YEAR`, `SITE`, and `canopy_area` columns.
5. Make a scatter plot with `canopy_area` on the x axis and `HEIGHT` on the y
   axis. Color the points by `TREATMENT` and create a subplot per species using the function `facet_wrap()`. This will plot the points for each variable in
   the `SPECIES` column in a separate subplot. Label the x axis "Canopy Area
   (m)" and the y axis "Height (m)". Make the point size 2.
6. That's a big outlier in the plot from (2). 50 by 50 meters is a little too
   big for a real acacia tree, so filter the data to remove any values for `AXIS_1`
   and `AXIS_2` that are over 20 and update the data frame. Then, remake the graph.
