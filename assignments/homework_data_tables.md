---
layout: page
element: assignment
title: 'Data wrangling'
language: R
pagetype: activities
symbol: <i class="fa fa-keyboard-o fa-lg"></i>
---

## Shrub volume data set

### Exercise 1: Data wrangling basics
<!-- https://github.com/datacarpentry/semester-biology/blob/main/exercises/Dplyr-shrub-volume-data-basics-R.md -->
Dr. Granger is interested in studying the factors controlling the size and
carbon storage of shrubs. She has conducted an experiment looking at the effect
of three different treatments on shrub volume at four different locations. She
has placed the data file on the web for you to download:

1. Download the file [shrub-volume-data.csv]({{ site.baseurl }}/data/shrub-volume-data.csv) and save it into your "data-raw" folder.
2. Create a new Rmd file called "shrub_volume.Rmd". Write a short paragraph describing the data set before starting your analysis. Include a figure.
3. Import the data set using `read.csv()`. Assign it to an object called `shrubs`.
4. Select the data from the "length" column and print it out (using `select()`).
5. Select the data from the site and experiment columns and print it out (using `select()`).
6. Add a new column named "area" containing the area of the shrub, which is the length times the width (using `mutate()`).
7. Sort the data by length (using `arrange()`).
8. Filter the data to include only plants with heights greater than 5 (using `filter()`).
9. Filter the data to include only plants with heights greater than 4 and widths greater than 2 (using `,` or `&` to include two conditions).
10. Filter the data to include only plants from Experiment 1 or Experiment 3 (using `|` for "or").
11. Filter the data to remove rows with null values in the `height` column (using `!is.na`)
12. Create a new data frame called `shrub_volumes` that includes all of the original data and a new column containing the volumes (length * width * height), and display it.

### Exercise 2: Data agreggation
<!-- https://github.com/datacarpentry/semester-biology/blob/main/exercises/Dplyr-shrub-volume-aggregation-R.md -->
Dr. Granger wants some summary data of the plants at her sites and for her experiments.
If the file [shrub-volume-data.csv]({{ site.baseurl }}/data/shrub-volume-data.csv) is not already in your work space download it.

The following code calculates the average height of a plant at each site:

```r
shrub_dims <- read.csv('shrub-volume-data.csv')
by_site <- group_by(shrub_dims, site)
avg_height <- summarize(by_site, avg_height = mean(height))
```

1. Modify the code to calculate and print the average height of a plant in each
   experiment.
2. Use `max()` to determine the maximum height of a plant at each site.
3. Write the same code but as a pipeline (using the pipe `|>` or `*>*`) to get the same result.

### Exercise 3: Fix the code
<!-- https://github.com/datacarpentry/semester-biology/blob/main/exercises/Dplyr-fix-the-code-R.md -->
<!-- This is a follow-up to [Shrub Volume Aggregation]({{ site.baseurl }}/exercises/Dplyr-shrub-volume-aggregation-R). -->
<!-- If you don't already have the [shrub volume data]({{ site.baseurl }}/data/shrub-volume-data.csv) in your working directory download it. -->

The following code is supposed to import the shrub volume data and calculate the
average shrub volume for each site and, separately, for each experiment.

```r
read.csv("shrub-volume-data.csv")
shrub_data |>
  mutate(volume = length * width * height) |>
  group_by(site) |>
  summarize(mean_volume = max(volume))
shrub_data |>
  mutate(volume = length * width * height)
  group_by(experiment) |>
  summarize(mean_volume = mean(volume))
```

1. Fix the errors in the code so that it does what it's supposed to.
2. Add a comment to the end of each line of code explaining what it does.
