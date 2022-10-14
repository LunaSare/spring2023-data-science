---
layout: page
element: lecture
title: 'Data wrangling'
language: R
---

<!--
[Measuring biodiversity]({{ site.baseurl }}/materials/01_BiodiversityMeasures/01_BiodiversityMeasures.html)

[Manipulating data]({{ site.baseurl }}/materials/02_Manipulating_data/02_ManipulatingData.html) -->

## Day 1
<!-- Lecture from https://github.com/datacarpentry/semester-biology/blob/main/materials/dplyr.md
Exercises from https://github.com/datacarpentry/semester-biology/tree/f72ab33a6876b904c26ac566d13885096d4a0246/exercises/
Portal data-->
### Intro to the data set and class set up (15 min)

* We will be working with data from the Portal Project Teaching Database.
* All data is available on [figshare](https://figshare.com/articles/dataset/Portal_Project_Teaching_Database/1314459).
* It is a simplified version of data from study [Ernest etal. 2016. Long-term monitoring and experimental manipulation of a Chihuahuan Desert ecosystem near Portal, Arizona, USA](https://esajournals.onlinelibrary.wiley.com/doi/full/10.1890/15-2115.1).
* See Portal, Arizona in the [map](https://www.google.com/maps/place/Portal,+Arizona+85632/@31.9137011,-109.1589591,14z/data=!3m1!4b1!4m5!3m4!1s0x86d995001c757413:0x1e02844f7993e453!8m2!3d31.9137028!4d-109.1414495?hl=en).
* The original database is published at [Ecological Archives](http://esapubs.org/archive/ecol/E090/118/)
* Long-term experimental study of small mammals in Arizona:
  * 24 experimental and control plots
  * Experimental manipulations over the years include removal of all or some rodent species, all or some ants, seed additions, and various alterations of the annual plant community.
* The dataset is composed of three tables, which includes information on the site, date, species identification, weight and sampling plot (within the site) for some small mammals in Arizona.
* Each table is stored as a CSV file.
* CSV stands for "comma separated values"
* CSV is common way of storing data that can be used across programming and data management software
* _Click on species.csv and View File_
* If we look at one of these files we can see that
    * It is plain text, so any program can read it
    * The first row is the header row, with different column headers separated by commas
    * All of the other rows are the data, again with different columns separated by commas
    * And so each of the values is separated by commas, hence "comma separated values"

#### Setup your RStudio project

* Open your `data-science` RStudio project (modeling good practice)
* Download [surveys.csv](https://ndownloader.figshare.com/files/2292172), [species.csv](https://ndownloader.figshare.com/files/3299483), and [plots.csv](https://ndownloader.figshare.com/files/3299474) files into your "data-raw" folder. Click on the names of the files to download them.
  * Need to know where the data is? Right click -> `Save link as`.
- In your `data-science` RStudio project create a new Rmd file.
- Save the new Rmd file in the "documents" folder with the name "small-mammals.Rmd"
- Use markdown syntax to create a description of this dataset


#### Loading and viewing the dataset

* Load these files into `R` using the function `read.csv()` from the package `utils`.
* Remember to use relative paths.

```r
surveys <- read.csv("surveys.csv")
species <- read.csv("species.csv")
plots <- read.csv("plots.csv")
```

* You can display a data table by clicking on it in the "Environment" tab
* Three tables
    * `surveys` - main table, one row for each rodent captured, date on date,
      location, species ID, sex, and weight in grams and hindfoot length in millimeters.
    * `species` - latin species names for each species ID + general taxon
    * `plots` - information on the experimental manipulations at the site

* This data set is an example of a good tabular data structure
    * One table per type of data
        * Tables can be linked together to combine information.
    * Each row contains a single record.
        * A single observation or data point
    * Each column or field contains a single attribute.
        * A single type of information


### The `dplyr` R package

![](https://dplyr.tidyverse.org/logo.png)

* A modern library of R functions for data manipulation
* <https://dplyr.tidyverse.org/>
* "`dplyr` is a grammar of data manipulation, providing a consistent set of verbs that help you solve the most common data manipulation challenges".
* Use the cheat sheet:

![](https://raw.githubusercontent.com/rstudio/cheatsheets/main/pngs/thumbnails/data-transformation-cheatsheet-thumbs.png)


#### Installing vs loading packages

* Reminder: Packages are the main way that reusable code is shared in R
* Combination of code, data, and documentation
* R has a rich ecosystem of packages for data manipulation & analysis
* Download and install packages with the R console:
    * `install.packages("dplyr")`
* Even if we've installed a package it is NOT automatically available to do analysis with
* This is because sometimes different packages have functions with the same name
* So don't want to have to worry about functions and packages we've installed every time we write a piece of code
* To use a package:
    * Load all of the functions in the package with `library("dplyr")`
    * Use the syntax `package_name::function_name`

#### Selecting columns

* Create a new data frame with your columns of interest, in any order you prefer using the function `select()`.
* For example, get a new data frame with the column "year", "month" and "day" from the `surveys` data frame:

```r
select(surveys, year, month, day)
```

* The function `select()` does not modifiy the original object. Check this by comparing the output we just produced to `surveys`:

```r
head(surveys)
```

* Columns will follow the same order given in the function:

```r
select(surveys, month, day, year)
```

<!-- > Do [Shrub Volume Data Basics 1-2]({{ site.baseurl }}/exercises/Dplyr-shrub-volume-data-basics-R). -->

#### Mutating data

* The function `mutate()` creates new data columns based on data from existing columns
* It allows to calculate new values using data from the original columns
* For example, the column "hindfoot_length" stores measurements in millimeters (mm). Let's calculate a new column showing the length of the hindfoot in centimeters (cm):

```r
mutate(surveys, hindfoot_length_cm = hindfoot_length / 10)
```

* Similar to `select()`, when we open `surveys`, it does not contain a new column, because the function
`mutate()` does not modify the original object; it produces a new object with the new column.
* To store the new data frame for later use we need to assign it to an object:

```r
surveys_plus <- mutate(surveys,
                       hindfoot_length_cm = hindfoot_length / 10)
```

* Or we could overwrite the existing data frame if we don't need it

```r
surveys <- mutate(surveys,
                  hindfoot_length_cm = hindfoot_length / 10)
```

<!-- > Do [Shrub Volume Data Basics 3]({{ site.baseurl }}/exercises/Dplyr-shrub-volume-data-basics-R). -->

#### Arranging (sorting) data

* We can sort the data in the table using `arrange`
* Let's sort the surveys table by "weight":

```r
arrange(surveys, weight)
```

* We can also sort by multiple columns, so if we wanted to sort first by `plot_id` and then by date

```r
arrange(surveys, plot_id, year, month, day)
```

* Similar to `select()` and `mutate()`, the function `arrange()` does not modifiy the original object. Check this by comparing the output we just produced to `surveys`:

```r
head(surveys)
```

* We can reverse the order of the sort by _wrapping_ "weight" in the function `desc()` (for "descending order"):

```r
arrange(surveys, desc(weight))
```

<!-- * If you want to know how `desc()` works:

```r
numbers <- c(1,2,3,10,4,5)
desc()
``` -->

<!-- > Do [Shrub Volume Data Basics 4]({{ site.baseurl }}/exercises/Dplyr-shrub-volume-data-basics-R). -->

#### Filtering values

* Use `filter()` to keep only the rows that meet certain criteria.
* We use conditional or logical statements for the filtering criteria.
* Some examples of conditional statements are:

```r
1 == 1
1 == 2
1 != 2
1 > 2
1 > 1
1 >= 1
1 < 2
1 <= 2
"A" == "A"
"A" == "a"
"A" != "a"
```

* As with all other function that we have seen, the first argument specifies the data set we want to work with:
* The second and following arguments are conditional statements that specify the filtering criteria.
* For usage inside the function `filter()`, conditional statements are coded as:
  `column name`  `conditionl statement` `value`
* For example, to filter the `surveys` data frame to only keep the data with the species id "DS":
    * Type the name of the function, `filter`
    * Parentheses
    * The name of the data frame we want to filter, `surveys`
    * The column the want to filter on, `species_id`
    * The condition, which is `==` for "is equal to"
    * And then the value, `"DS"`
    * `DS` here is a string, not a variable or a column name, so we enclose it in quotation marks

```r
filter(surveys, species_id == "DS")
```

* Like the examples above, we can have a conditional statement that is _not equal to_ using `!=`.
* For example, to filter the data for all species except "DS":

```r
filter(surveys, species_id != "DS")
```

* We can also filter on multiple conditions at once by adding more conditional statements
* To indiciate that we want all the conditions to be TRUE, we have two ways:
  1. We can add more conditions for filtering by separating them with a comma `,`.
* For example, to get the data on species "DS" for the year 1995 and above:

```r
filter(surveys, species_id == "DS", year > 1995)
```

  2. Alternatively, we can use the ampersand `&` symbol, which is called the _AND operator_:

```r
filter(surveys, species_id == "DS" & year > 1995)
```

* Combining conditions with a comma `,` or with the _AND operator_ `&` indicates that we want all conditions to be met.
* To indicate that not all conditions have to be true (one or more of the conditions can be true), we combine conditions using the pipe symbol `|`, which is called _OR operator_.
* For example, to get data for all of the *Dipodomys* species, with different species id ("DS", "DM", and "DO")

```r
filter(surveys, species_id == "DS" | species_id == "DM" | species_id == "DO")
```

* The `&` and `|` allow building conditions that are as complex as needed.

<!-- > Do [Shrub Volume Data Basics 5-7]({{ site.baseurl }}/exercises/Dplyr-shrub-volume-data-basics-R). -->


### Filtering missing values

<!-- Some exaplanation from https://stackoverflow.com/questions/25100974/na-matches-na-but-is-not-equal-to-na-why -->

* `NA` is a special value in R that represents data that is missing and should be treated differently.
* Think of `NA` as "I do not know what's there".
* One of the common tasks we use `filter` for is removing missing values from data
* We know that the column `weight` has many missing values, so let's filter out these values.
* Based on what we learned before it's natural to think that we do this by using the condition `weight != NA`

```r
filter(surveys, weight != NA)
```

* But that does not work. Let's try some equivalences:

```r
NA > 3  # is obviously NA because we don't know if the missing value is larger than 3 or not
NA == NA  # the same with this, we have two missing values but the true values could be quite different, so the correct answer is "I don't know."
surveys$weight == NA
```

* Null values like `NA` are special: they are incomparable.
* We don't want to accidentally say that two "missing" things are the same, because we don't know if they are
* So we use special functions
* The function `is.na()` checks if a value is `NA`

```r
is.na(NA)
is.na(3)
is.na(surveys$weight)
```

```r
filter(surveys, is.na(weight))
```

* To remove null values we combine the function `is.na()` with the _NOT operator_ `!`:

```r
is.na(3)
!is.na(3)
filter(surveys, !is.na(weight))
```

* Keep the function `is.na()` in mind. You will use it often to filter missing values in combination with other conditions.
* For example, we might want all of the data on a particular species that has weight data:

```r
filter(surveys, species_id == "DS", !is.na(weight))
```

### In-class Exercise (30 min)

**Exercise 1: Data manipulation**
<!-- https://github.com/datacarpentry/semester-biology/blob/f72ab33a6876b904c26ac566d13885096d4a0246/exercises/Portal-data-manip-R.md -->
1. Load `surveys.csv` into R using `read.csv()`.
2. Use `select()` to create a new data frame object called `surveys1` with just the `year`, `month`,
   `day`, and `species_id` columns in that order.
3. Create a new data frame called `surveys2` with the `year`, `species_id`, and weight **in kilograms** of each individual, with no null weights. Use `mutate()`, `select()`, and `filter()` with `!is.na()`. The weight in the table is given in grams so you will need to create a new column called "weight_kg" for weight in kilograms by dividing the weight column by 1000.
4. Use the `filter()` function to get all of the rows in the data frame `surveys2` for the species ID "SH".

---
---

## Day 2
<!-- Lecture modified from https://github.com/datacarpentry/semester-biology/blob/main/materials/combining-data-manip.md -->

### The usual analysis workflow: intermediate variables
* Combine a series of data manipulation actions
* Do each action in sequential order
* Run a command
* Store the output in a variable
* Use that variable later in the code
* Repeat

### Pipes

* Intermediate variables can get cumbersome if there are lots of steps.
* `%>%` or `|>` (the _pipe operator_) takes the output of one command and passes it as valur for the first argument of the
 next command.
* The `|>` pipe will work everywhere as long as you have a new enough version of R and RStudio
* `%>%` is the original pipe in R. It is called the "magrittr" pipe, and you have to load the `magrittr` package to use it (this gets loaded automatically by `dplyr`)
* `magrittr` has some fancier functionality that may be useful in some cases
* You can use any pipe you like.
* Shortcut to get the pipe: `Ctrl-shift-m`.
  * You can change this to give the base R pipe: Tools -> Global Options -> Code -> Use native pipe operator
* How does the pipe work: want to take the mean of a vector?
* Normally we would run the `mean` function with the vector as the input:

```
x = c(1, 2, 3)
mean(x)
```

* Instead we could pipe the vector into the function

```
x %>% mean()
```

* So `x` becomes the first argument in `mean`
* If we want to add other arguments they get added to the function call
```
x = c(1, 2, 3, NA)
mean(x, na.rm = TRUE)
x %>% mean(na.rm = TRUE)
```

Exercise

1. Use pipes to obtain the data for "DS" in the "species_id" column, sorted by year, with only the year and weight columns
1. In sequental form, the code to get that looks like this:

```r
ds_data <- filter(surveys, species_id == "DS", !is.na(weight))
ds_data_by_year <- arrange(ds_data, year)
ds_weight_by_year <- select(ds_data_by_year, year, weight)
```

Solution:
```
ds_weight_by_year <- surveys %>%
 filter(species_id == "DS", !is.na(weight)) %>%
 arrange(year) %>%
 select(year, weight)
```

### In-class exercise 2

<!-- > Do [Portal Data Manipulation Pipes 1]({{ site.baseurl }}/exercises/Portal-data-manip-pipes-R). -->

**Exercise 2: Data pipes**
<!-- https://github.com/datacarpentry/semester-biology/blob/f72ab33a6876b904c26ac566d13885096d4a0246/exercises/Portal-data-manip-pipes-R.md -->
Use pipes (either `|>` or `%>%`) to combine the following operations to manipulate the data:

1. Use `mutate()`, `select()`, and `filter()` with `is.na()` to create a new data frame with
   the `year`, `species_id`, and weight **in kilograms** of each individual,
   with no null weights. Create a new data object called `surveys1`
2. Use `filter()` with `is.na()` and `select()` to get the `year`, `month`, `day`, and
   `species_id` columns for all of the rows in the data frame where `species_id`
   is `SH` and with no null weights. Create a new data object called `surveys2`

---

### What if I want to pipe to an argument other than the first argument?

We use the underscore to indicate the position of the piped argument

```
surveys |>
 filter(species_id == "DS", !is.na(weight)) |>
 arrange(year) |>
 select(year, weight) |>
 lm(weight ~ year, data = _)
```

---

### Data grouping (also called data agreggation)

<!-- https://datacarpentry.org/semester-biology/materials/dplyr-aggregation/ -->
### Basic grouping

* The function `group_by()` combines rows into groups based on ONE or MORE columns.
* `group_by()` function has two arguments: 1) data to work on; 2) names for column or columns to group by
* Let's group `surveys` by `year`:

```r
group_by(surveys, year)
```

* The output is a `tibble`, a different looking kind of `data.frame`.
  * The `tibble` contains the source, the groupings, and the data type information.

* We can also group by multiple columns.
* For example, group by "plot id" and by "year":

```r
group_by(surveys, plot_id, year)
```

### Summarizing data from groupings

* After grouping a data frame we can use the function `summarize()` to analyze each group.
* The function `n()` counts the number of rows for each grouping. It is a special function that only works within `dplyr` functions.
* `summarize()` function takes as arguments:
  * a grouped table, output of `group_by()`
  * One additional argument for each calculation we want to do for each group
    * New column name to store calculated value
    * the equal sign `=`
    * The calculation that we want to perform for each group

```r
surveys_by_year <- group_by(surveys, year)
year_counts <- summarize(surveys_by_year, abundance = n())
```

* Count the number of individuals in each plot in each year

```r
surveys_by_plot_year <- group_by(surveys, plot_id, year)
plot_year_counts <- summarize(surveys_by_plot_year, abundance = n())
```

* Just like with other `dplyr` functions we could write this using pipes instead

```r
plot_year_counts <- surveys |>
  group_by(plot_id, year) |>
  summarize(abundance = n())
```

<!-- > Do [Portal Data Aggregation 1-2]({{ site.baseurl }}/exercises/Portal-data-aggregation-R/). -->
<!-- > Do [Portal Data Aggregation 3]({{ site.baseurl }}/exercises/Portal-data-aggregation-R/). -->

### In-class Exercise 3

**Exercise 3: Data agreggation**
<!-- https://github.com/datacarpentry/semester-biology/blob/main/exercises/Portal-data-aggregation-R.md -->
1. Use the `group_by()` and `summarize()` functions to get a count of the number
   of individuals in each species ID.
2. Use the `group_by()` and `summarize()` functions to get a count of the number
   of individuals in each species ID in each year.
3. Use the `filter()`, `group_by()`, and `summarize()` functions to get the mean
   mass of species `DO` in each year.

* We can also do multiple calculations using summarize
* We can use any function that returns a single value from a vector; e.g., `mean()`, `max()`, `min()`
* We'll calculate the number of individuals in each plot year combination and their average weight

```r
plot_year_count_weight <- surveys |>
  group_by(plot_id, year) |>
  summarize(abundance = n(), avg_weight = mean(weight))
```

* Why did we get `NA`?
    * `mean(weight)` returns `NA` when `weight` has missing values (`NA`)
* Can fix using `mean(weight, na.rm = TRUE)`

```r
plot_year_count_weight <- surveys |>
  group_by(plot_id, year) |>
  summarize(abundance = n(),
            avg_weight = mean(weight, na.rm = TRUE))
```

* Still has `NaN` for species that have never been weighed
* Can filter using `!is.na`

```r
plot_year_count_weight <- surveys |>
  group_by(plot_id, year) |>
  summarize(abundance = n(),
            avg_weight = mean(weight, na.rm = TRUE)) |>
  filter(!is.na(avg_weight))
```



<!--
https://github.com/datacarpentry/semester-biology/blob/main/exercises/Portal-data-joins-R.md
https://github.com/datacarpentry/semester-biology/blob/main/exercises/Portal-data-review-R.md
https://github.com/datacarpentry/semester-biology/blob/main/exercises/Portal-data-challenge-R.md
 -->
<!-- > Do [Shrub Volume Data Basics 8]({{ site.baseurl }}/exercises/Dplyr-shrub-volume-data-basics-R).
We are doing all teh shrub volume exercises as homework-->
