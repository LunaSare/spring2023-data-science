---
layout: page
element: lecture
title: 'Joining data'
language: R
pagetype: lecture
symbol: <i class="fa fa-comment fa-lg"></i>
---

<!--
[Measuring biodiversity]({{ site.baseurl }}/materials/01_BiodiversityMeasures/01_BiodiversityMeasures.html)

[Manipulating data]({{ site.baseurl }}/materials/02_Manipulating_data/02_ManipulatingData.html) -->

## Day 1

- Why do we need to join data tables?
  - We often have data from the same project/experiment in multiple tables, as it is one of the best practices for data science, because:
    - it avoids redundant information (like listing the full taxonomy for every individual of a species)
    - it makes storage more efficient,
    - makes data processing more efficient (such as changing data in one place, not hundreds of places),
    - Each table contains a single kind of information
  - We often need to join multiple tables from the same data set for analysis
- The [Portal Project Teaching Database](https://www.weecology.org/data-projects/portal-teaching-db/) has this properties, so we will be working with it.

#### Setup your RStudio project

* Remember! Working in projects is considered a best practice in data science.
* Go ahead and open your RStudio project for the class. I called mine `fall-2022`.
* Open your rmarkdown file "small-mammals.Rmd". We will keep on working in it.
- If you have not done so, click on the names of the following files to download them:
  - [surveys.csv](https://ndownloader.figshare.com/files/2292172) - main table, one row for each rodent captured, date on date,
    location, species ID, sex, and weight in grams and hindfoot length in millimeters.
  - [species.csv](https://ndownloader.figshare.com/files/3299483) - latin species names for each species ID + general taxon
  - [plots.csv](https://ndownloader.figshare.com/files/3299474) - information on the experimental manipulations at the site
  - Save the three CSV files into your "data-raw" project folder.
* Make sure that you have loaded the three CSV files into `R` using the function `read.csv()` from the package `utils`.
* Remember to use relative paths.

```r
surveys <- read.csv("surveys.csv")
species <- read.csv("species.csv")
plots <- read.csv("plots.csv")
```

* Once loaded we can display a data table by clicking on it in the "Environment" tab.
* This data set is a great example of a good tabular data structure
    * One table per type of data
        * Tables can be linked together to combine information.
    * Each row contains a single record.
        * A single observation or data point
    * Each column or field contains a single attribute.
        * A single type of information

### Joining two data Tables

- To combine two tables based on the values from a shared column, we use the functions
  - `inner_join()`
  - `left_join()`
  - `right_join()`
  - `outter_join()`
- These functions take at least three arguments.
  - The first two arguments specify the two tables that we want to join.
  - The third argument `by = `specifies the name of the shared column as a character string (enclosed in quotations `" "`)
- To join the tables `surveys` and `species` by their only shared column "species_id" into a new `combined` table:
```r
combined <- inner_join(surveys, species, by = "species_id")
```
- How would you do this with a pipe?
```r
surveys |>
  inner_join(species, by = "species_id")
```
- Check row numbers from original tables and `combined`
```r
nrow(surveys)
nrow(combined)
```
- Inner joins keep information from both tables when both tables have a matching value in the join column
- Rows with missing "species_id" values are dropped
- The function `left_join` keeps all values from the "left table"  (the first table)

### Joining two or more data Tables

- To combine two or more tables we use the same functions, incrementally.
- For example

### Joint in-class exercise
<!-- https://github.com/datacarpentry/semester-biology/blob/main/exercises/Portal-data-joins-R.md -->
Run the following calculations using a single pipe:
1. Use `inner_join()` to create a table that contains the information from both
   the `surveys` table and the `species` table.
2. Use `inner_join()` twice to create a table that contains the information from
   all three tables.
3. Use `inner_join()` and `filter()` to get a data frame with the information
   from the `surveys` and `plots` tables where the `plot_type` is `Control`.


### Solo in-class exercise
<!-- https://github.com/datacarpentry/semester-biology/blob/main/exercises/Portal-data-dplyr-review-R.md -->
   We want to do an analysis comparing the size of individuals on the `Control`
 plots to the `Long-term Krat Exclosures`. Create a data frame with the
 `year`, `genus`, `species`, `weight` and `plot_type` for all cases where the
 plot type is either `Control` or `Long-term Krat Exclosure`. Only include
 cases where `Taxa` is `Rodent`. Remove any records where the `weight` is
 missing.

### Solo in-class exercise
<!-- https://github.com/datacarpentry/semester-biology/blob/main/exercises/Portal-data-review-R.md -->
 1. Create a data frame with only data for the `species_id` `DO`, with the columns `year`, `month`, `day`, `species_id`, and `weight`.
 2. Create a data frame with only data for species IDs `PP` and `PB` and for years starting in 1995, with the columns `year`, `species_id`, and `hindfoot_length`, with no null values for `hindfoot_length`.
 3. Create a data frame with the average `hindfoot_length` for each `species_id` in each `year` with no null values.
 4. Create a data frame with the `year`, `genus`, `species`, `weight` and `plot_type` for all cases where the `genus` is `"Dipodomys"`.
 5. Make a scatter plot with `weight` on the x-axis and `hindfoot_length` on the y-axis. Use a `log10` scale on the x-axis. Color the points by `species_id`. Include good axis labels.
 6. Make a histogram of weights with a separate subplot for each `species_id`. Do not include species with no weights. Set the `scales` argument to `"free_y"` so that the y-axes can vary. Include good axis labels.
 7. (Challenge) Make a plot with histograms of the weights of three species, `PP`, `PB`, and `DM`, colored by `species_id`, with a different facet (i.e., subplot) for each of three `plot_type`'s `Control`, `Long-term Krat Exclosure`, and `Short-term Krat Exclosure`. Include good axis labels and a title for the plot. Export the plot to a `png` file.

### Solo in-class exercise
<!-- https://github.com/datacarpentry/semester-biology/blob/main/exercises/Portal-data-challenge-R.md -->

Develop a data manipulation pipeline for the Portal `surveys` table that produces a table of data for only the three _Dipodomys_ species (`DM`, `DO`, `DS`).
The species IDs should be presented as lower case, not upper case.
The table should contain information on the date, the species ID, the weight and hindfoot length.
The data should not include null values for either weight or hindfoot length.
The table should be sorted first by the species (so that each species is grouped together) and then by weight, with the largest weights at the top.
