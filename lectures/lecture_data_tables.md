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

### Installing vs loading packages

* Reminder: Packages are the main way that reusable code is shared in R
* Combination of code, data, and documentation
* R has a rich ecosystem of packages for data manipulation & analysis
* Download and install packages with the R console:
    * `install.packages("dplyr")`
* Even if we've installed a package it is automatically available to do analysis with
* This because different packages may have functions with the same names
* So don't want to have to worry about all of the packages we've installed every time we write a piece of code
* Using a package:
    * Load all of the functions in the package: `library("dplyr")`

#### Loading and viewing the dataset

* Load these files into `R` using the function `read.csv()`.
* Remember to use relative paths.

```r
surveys <- read.csv("surveys.csv")
species <- read.csv("species.csv")
plots <- read.csv("plots.csv")
```

* You can display a data table by clicking on it in `Environment`
* Three tables
    * `surveys` - main table, one row for each rodent captured, date on date,
      location, species ID, sex, and size
    * `species` - latin species names for each species ID + general taxon
    * `plots` - information on the experimental manipulations at the site

* Good tabular data structure
    * One table per type of data
        * Tables can be linked together to combine information.
    * Each row contains a single record.
        * A single observation or data point
    * Each column or field contains a single attribute.
        * A single type of information


#### Basic `dplyr`

* Modern data manipulation library for R

```r
surveys <- read.csv("surveys.csv")
```

#### Select

* Select a subset of columns.

```r
select(surveys, year, month, day)
```

* They can occur in any order.

```r
select(surveys, month, day, year)
```

> Do [Shrub Volume Data Basics 1-2]({{ site.baseurl }}/exercises/Dplyr-shrub-volume-data-basics-R).

#### Mutate

* Add new columns with calculated values using `mutate()`

```r
mutate(surveys, hindfoot_length_cm = hindfoot_length / 10)
```

* If we look at `surveys` now will it contain the new column?
* *Open `surveys`*
* All of these commands produce new values, data frames in this case
* To store them for later use we need to assign them to a variable

```r
surveys_plus <- mutate(surveys,
                       hindfoot_length_cm = hindfoot_length / 10)
```

* Or we could overwrite the existing variable if we don't need it

```r
surveys <- mutate(surveys,
                  hindfoot_length_cm = hindfoot_length / 10)
```

> Do [Shrub Volume Data Basics 3]({{ site.baseurl }}/exercises/Dplyr-shrub-volume-data-basics-R).

#### Arrange

* We can sort the data in the table using `arrange`
* To sort the surveys table by by weight

```r
arrange(surveys, weight)
```

* We can reverse the order of the sort by "wrapping" `weight` in another function, `desc` for "descending

```r
arrange(surveys, desc(weight))
```

* We can also sort by multiple columns, so if we wanted to sort first by `plot_id` and then by date

```r
arrange(surveys, plot_id, year, month, day)
```

> Do [Shrub Volume Data Basics 4]({{ site.baseurl }}/exercises/Dplyr-shrub-volume-data-basics-R).

#### Filter

* Use `filter()` to get only the rows that meet certain criteria.
* Combine the data frame to be filtered with a series of conditional statements.
* Column, condition, value
* To filter the data frame to only keep the data on species `DS`
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

* Like with vectors we can have a condition that is "not equal to" using "!="
* So if we wanted the data for all species except "DS

```r
filter(surveys, species_id != "DS")
```

* We can also filter on multiple conditions at once
* In computing we combine conditions in two ways "and" & "or"
* "and" means that all of the conditions must be true
* Do this in `dplyr` using additional comma separate arguments
* So, to get the data on species "DS" for the year 1995:

```r
filter(surveys, species_id == "DS", year > 1995)
```

* Alternatively we can use the `&` symbol, which stands for "and"

```r
filter(surveys, species_id == "DS" & year > 1995)
```

* This approach is mostly useful for building more complex conditions

* "or" means that one or more of the conditions must be true
* Do this using `|`
* To get data on all of the *Dipodomys* species

```r
filter(surveys, species_id == "DS" | species_id == "DM" | species_id == "DO")
```

> Do [Shrub Volume Data Basics 5-7]({{ site.baseurl }}/exercises/Dplyr-shrub-volume-data-basics-R).


### Filtering null values

* One of the common tasks we use `filter` for is removing null values from data
* Based on what we learned before it's natural to think that we do this by using the condition `weight != NA`

```r
filter(surveys, weight != NA)
```

* Why didn't that work?
* Null values like `NA` are special
* We don't want to accidentally say that two "missing" things are the same
    * We don't know if they are
* So we use special commands
* The function `is.na()` checks if a value is `NA`
* So if we wanted all of the data where the weigh is `NA`

```r
filter(surveys, is.na(weight))
```

* To remove null values we combine this with `!` for "not"

```r
filter(surveys, !is.na(weight))
```

* We'll learn more about why this works in the same way as the other conditional statements when we study conditionals in detail later in the course


```r
filter(surveys, !is.na(weight))
```

* So ,`!is.na(weight)` is conceptually the same as "weight != NA"
* It is common to combine a null filter with other conditions using "and"
* For example we might want all of the data on a particular species that contains weights

```r
filter(surveys, species_id == "DS", !is.na(weight))
```

### In-class Exercise

**Exercise 1: Data manipulation**
<!-- https://github.com/datacarpentry/semester-biology/blob/f72ab33a6876b904c26ac566d13885096d4a0246/exercises/Portal-data-manip-R.md -->
0. Load `surveys.csv` into R using `read.csv()`.
1. Use `select()` to create a new data frame object with just the `year`, `month`,
   `day`, and `species_id` columns in that order.
2. Use `mutate()`, `select()`, and `filter()` with `!is.na()` to create a new
   data frame with
   the `year`, `species_id`, and weight **in kilograms** of each individual,
   with no null weights. The weight in the table is given in grams so you will
   need to create a new column for weight in kilograms by dividing the weight column by 1000.
3. Use the `filter()` function to get all of the rows in the data frame for the species ID `SH`.

---
---

<!-- Lecture modified from https://github.com/datacarpentry/semester-biology/blob/main/materials/combining-data-manip.md -->

### The usual analysis workflow: intermediate variables
* Combine a series of data manipulation actions
* Do each action in sequential order
* Run a command
* Store the output in a variable
* Use that variable later in the code
* Repeat
* Obtain the data for only DS, sorted by year, with only the year and and weight columns

```
ds_data <- filter(surveys, species_id == "DS", !is.na(weight))
ds_data_by_year <- arrange(ds_data, year)
ds_weight_by_year <- select(ds_data_by_year, year, weight)
```

### Pipes

* Intermediate variables can get cumbersome if there are lots of steps.
* `%>%` or `|>` ("pipe") takes the output of one command and passes it as input to the
 next command
* `%>%` is the original pipe in R. It is called the "magrittr" pipe, and you have to load the `magrittr` package to use it (this gets loaded automatically by `dplyr`)
* Either pipe is fine for this class
    * `|>` will work everywhere as long as you have a new enough version of R
    * `magrittr` has some fancier functionality that may be useful in some cases
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

* *Questions?*

```
surveys %>%
 filter(species_id == "DS", !is.na(weight))
```
```
ds_weight_by_year <- surveys %>%
 filter(species_id == "DS", !is.na(weight)) %>%
 arrange(year) %>%
 select(year, weight)
```

* Shortcut to get the pipe: Ctrl-shift-m
* You can change this to give the base R pipe
    * Tools -> Global Options -> Code -> Use native pipe operator

### What if I want to pipe to an argument other than the first argument?

```
surveys |>
  filter(species_id == "DS", !is.na(weight)) |>
  arrange(year) |>
  select(year, weight) |>
  lm(weight ~ year, data = _)
```

### In-class Exercise 2

<!-- > Do [Portal Data Manipulation Pipes 1]({{ site.baseurl }}/exercises/Portal-data-manip-pipes-R). -->

**Exercise 2: Data pipes**
<!-- https://github.com/datacarpentry/semester-biology/blob/f72ab33a6876b904c26ac566d13885096d4a0246/exercises/Portal-data-manip-pipes-R.md -->
Use pipes (either `|>` or `%>%`) to combine the following operations to manipulate the data.

1. Use `mutate()`, `select()`, and `filter()` with `is.na()` to create a new data frame with
   the `year`, `species_id`, and weight **in kilograms** of each individual,
   with no null weights.
2. Use the `filter()` and `select()` to get the `year`, `month`, `day`, and
   `species_id` columns for all of the rows in the data frame where `species_id`
   is `SH`.

---
---

## Day 2

### In-class Exercise 3

**Exercise 3: Data agreggation**
<!-- https://github.com/datacarpentry/semester-biology/blob/main/exercises/Portal-data-aggregation-R.md -->
1. Use the `group_by()` and `summarize()` functions to get a count of the number
   of individuals in each species ID.
2. Use the `group_by()` and `summarize()` functions to get a count of the number
   of individuals in each species ID in each year.
3. Use the `filter()`, `group_by()`, and `summarize()` functions to get the mean
   mass of species `DO` in each year.

https://github.com/datacarpentry/semester-biology/blob/main/exercises/Portal-data-joins-R.md
https://github.com/datacarpentry/semester-biology/blob/main/exercises/Portal-data-review-R.md
https://github.com/datacarpentry/semester-biology/blob/main/exercises/Portal-data-challenge-R.md


### Homework:

> Do [Shrub Volume Data Basics 8]({{ site.baseurl }}/exercises/Dplyr-shrub-volume-data-basics-R).
