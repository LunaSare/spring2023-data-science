---
layout: page
element: lecture
title: 'Data wrangling'
language: R
pagetype: lecture
symbol: <i class="fa fa-comment fa-lg"></i>
---

<!--
[Measuring biodiversity]({{ site.baseurl }}/materials/01_BiodiversityMeasures/01_BiodiversityMeasures.html)

[Manipulating data]({{ site.baseurl }}/materials/02_Manipulating_data/02_ManipulatingData.html) -->

## Day 1: Data wrangling
<!-- Lecture from https://github.com/datacarpentry/semester-biology/blob/main/materials/dplyr.md
Exercises from https://github.com/datacarpentry/semester-biology/tree/f72ab33a6876b904c26ac566d13885096d4a0246/exercises/
Portal data-->
### Intro to the data set and class set up (15 min)

* We will be working with data from the Portal Project Teaching Database.
* All data is available on [figshare](https://figshare.com/articles/dataset/Portal_Project_Teaching_Database/1314459).
* It is a simplified version of data from study [Ernest etal. 2016. Long-term monitoring and experimental manipulation of a Chihuahuan Desert ecosystem near Portal, Arizona, USA](https://esajournals.onlinelibrary.wiley.com/doi/full/10.1890/15-2115.1).
* See Portal, Arizona in the [map](https://www.google.com/maps/place/Portal,+Arizona+85632/@31.9137011,-109.1589591,14z/data=!3m1!4b1!4m5!3m4!1s0x86d995001c757413:0x1e02844f7993e453!8m2!3d31.9137028!4d-109.1414495?hl=en).
* The original database is published at [Ecological Archives](http://esapubs.org/archive/ecol/E090/118/)
* Long-term experimental study, showing a time-series for a small mammal community in southern Arizona. This is part of a project studying the effects of rodents and ants on the plant community that has been running for almost 40 years. The rodents are sampled on a series of 24 plots, with different experimental manipulations controlling which rodents are allowed to access which plots.
  * 24 experimental and control plots
  * Experimental manipulations over the years include removal of all or some rodent species, all or some ants, seed additions, and various alterations of the annual plant community.
* The dataset is composed of three tables, which includes information on the site, date, species identification, weight and sampling plot (within the site) for some small mammals in Arizona.
* Each table is stored as a CSV file.


* CSV stands for "comma separated values"
* CSV is common way of storing data that can be used across programming and data management software
* If we look at one of these files we can see that
    * It is plain text, so any program can read it
    * The first row is the header row, with different column headers separated by commas
    * All of the other rows are the data, again with different columns separated by commas
    * And so each of the values is separated by commas, hence "comma separated values"

#### Setup your RStudio project

* Remember! Working in projects is considered a best practice in data science.
* Open your RStudio project. I called mine `data-science`.
* Click on the names of the following files to download them:
  - [surveys.csv](https://ndownloader.figshare.com/files/2292172) - main table, one row for each rodent captured, date on date,
    location, species ID, sex, and weight in grams and hindfoot length in millimeters.
  - [species.csv](https://ndownloader.figshare.com/files/3299483) - latin species names for each species ID + general taxon
  - [plots.csv](https://ndownloader.figshare.com/files/3299474) - information on the experimental manipulations at the site
* Save the three CSV files into your "data-raw" folder.
  * Don't know where the CSV files are? Right click -> `Save link as`.
- Create a new Rmd file and save it in the "documents" folder with the name "small-mammals.Rmd".
- Use markdown syntax to create a description of this dataset.


#### Loading and viewing the dataset

* Load the three CSV files into `R` using the function `read.csv()` from the package `utils`.
* Remember to use relative paths.

```r
surveys <- read.csv("surveys.csv")
species <- read.csv("species.csv")
plots <- read.csv("plots.csv")
```

* Once loaded you can display a data table by clicking on it in the "Environment" tab.
* This data set is a great example of a good tabular data structure
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
* When in doubt, use the cheat sheet:

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
* For example, the column `"hindfoot_length"` stores measurements in millimeters (mm). To create a new column showing the length of the hindfoot in centimeters (cm), we have to divide the values in mm from the original column `"hindfoot_length"` by 10:

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

* We can sort the data in the table using the function `arrange()`
* Let's sort the surveys table by the values on the column `"weight"`:

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

* We can reverse the order of the sort by _wrapping_ `"weight"` in the function `desc()` (for "descending order"):

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
* We use _relational or logical statements_ to evaluate and establish the criteria to filter on.
* Some examples of relational statements are:

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

* As with all other function that we have seen, the first argument specifies the data set we want to work with
* The second and following arguments are relational/conditional statements that specify the filtering criteria.
* For usage inside the function `filter()`, relational/conditional statements are coded as:
  `column name`  `relational/conditional statement` `value`
* For example, to filter the `surveys` data frame to only keep the data with the species id "DS":
    * Type the name of the function and **open parentheses**, `filter()`
    * The name of the data frame we want to filter, `surveys`
    * The column the want to filter on, `"species_id"`
    * The relational statement, which is `==` for _is equal to_
    * And then the value we want to evaluate, `"DS"`
    * `"DS"` here is a string, not a variable or a column name, so we enclose it in quotation marks

```r
filter(surveys, species_id == "DS")
```

* Like the examples above, we can have a relational statement that is _not equal to_ using `!=`.
* For example, to filter the data for all species except "DS":

```r
filter(surveys, species_id != "DS")
```

* We can also filter on multiple criteria at once by adding more relational statements
* To indiciate that we want all the criteria to be TRUE, we have two ways:
  1. We can add more criteria for filtering by separating them with a comma `,`.
* For example, to get the data on species `"DS"` for the year `1995` and above:

```r
filter(surveys, species_id == "DS", year > 1995)
```

  2. Alternatively, we can use the _ampersand_ `&` symbol, which is called the _AND operator_:

```r
filter(surveys, species_id == "DS" & year > 1995)
```

* Combining criteria with a comma `,` or with the _AND operator_ `&` indicates that we want all criteria to be met.
* To indicate that not all statements have to be true (that is, one or more of the statements can be true), we combine statements using the _vertical bar_ symbol `|`, which is called the _OR operator_.
* For example, to get data for all of the *Dipodomys* species, with different species id ("DS", "DM", and "DO")

```r
filter(surveys, species_id == "DS" | species_id == "DM" | species_id == "DO")
```

* The `&` and `|` allow building filtering criteria that are as complex as needed.

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

* Keep the function `is.na()` in mind. You will use it often to filter missing values in combination with other statements.
* For example, we might want all of the data on a particular species that has weight data:

```r
filter(surveys, species_id == "DS", !is.na(weight))
```

### Solo In-class Exercise (30 min)

**Exercise 1: Data manipulation**
<!-- https://github.com/datacarpentry/semester-biology/blob/f72ab33a6876b904c26ac566d13885096d4a0246/exercises/Portal-data-manip-R.md -->
1. Load `surveys.csv` into R using `read.csv()`.
2. Use `select()` to create a new data frame object called `surveys1` with just the `year`, `month`,
   `day`, and `species_id` columns in that order.
3. Create a new data frame called `surveys2` with the `year`, `species_id`, and weight **in kilograms** of each individual, with no null weights. Use `mutate()`, `select()`, and `filter()` with `!is.na()`. The weight in the table is given in grams so you will need to create a new column called "weight_kg" for weight in kilograms by dividing the weight column by 1000.
4. Use the `filter()` function to get all of the rows in the data frame `surveys2` for the species ID "SH".

---
---

## Day 2: Pipes
<!-- Lecture modified from https://github.com/datacarpentry/semester-biology/blob/main/materials/combining-data-manip.md -->

### The usual analysis workflow: intermediate variables and nesting functions

* We usually use intermediate variables when writing code
  * We run one line of code for each action in sequential order
  * Store the output in a variable
  * Use that variable later in the code
  * Repeat

* For example, to get the square root of the mean of a vector of numbers, we would run the `mean()` function with a numeric vector as the input, assign it to a variable, and then run the function `sqrt()` using that newly created object as input:


```r
x = c(1, 2, 3)
mean_x <- mean(x)
sqrt_x <- sqrt(mean_x)
sqrt_x
```

* And, in nested form:

```r
sqrt(mean(x = c(1,2,3)))
```

### Pipes

* Intermediate variables and nested functions can get cumbersome (and confusing) if there are lots of steps.
* `%>%` or `|>` (the _pipe operator_) takes the output of one command and passes it as value for the first argument of the
 next command.
* The `|>` pipe will work everywhere as long as you have a new enough version of R and RStudio
* `%>%` is the original pipe in R. It is called the "magrittr" pipe, and you have to load the `magrittr` package to use it (this gets loaded automatically by `dplyr`)
* `magrittr` has some fancier functionality that may be useful in some cases
* You can use any pipe you like.
* Shortcut to get the pipe: `Ctrl-shift-m`.
  * You can change this to give the base R pipe: Tools -> Global Options -> Code -> Use native pipe operator
* To calculate the mean of a numeric vector, we can directly pipe the vector into the function `mean()`, no need to create an object:
```r
c(1, 2, 3) %>% mean()
```
* The numeric vector becomes the first argument in `mean`
* We can add other arguments to the functions as needed. For example, to remove missing values from the mean:
```r
x = c(1, 2, 3, NA)
mean(x, na.rm = TRUE)
x %>% mean(na.rm = TRUE)
```
* For example, taking the mean of `surveys$weight` using a pipe gives the same result as doing it using the classic sequential form:
```r
mean(surveys$weight, na.rm = TRUE)
surveys$weight |>
  mean(na.rm = TRUE)
```
* The usefulness (and clarity) of pipes becomes apparent when trying to run more complicated analysis, that require creating intermediate variables or nesting code:
```r
c(1, 2, 3, NA) |>
  mean(na.rm = TRUE) |>
  sqrt()
```

### Joint In-class exercise 3

<!-- > Do [Portal Data Manipulation Pipes 1]({{ site.baseurl }}/exercises/Portal-data-manip-pipes-R). -->
<!-- https://github.com/datacarpentry/semester-biology/blob/f72ab33a6876b904c26ac566d13885096d4a0246/exercises/Portal-data-manip-pipes-R.md
Instructions:
Students will work alone to write the code in sequential form (using intermediate variables). The instructor can help and guide.
Then, instructor will ask students help to transform the sequential code to a pipeline and demo it to the whole class.
Instructor will demo the use of three functions to verify that the code is producing the expected outputs:
  - `colnames()` to display the column names of a data frame
  - `any()` to find myssing values in a vector
  - `nrow()` to get the numer of rows of a data frame

-->
1. Write the necessary code using intermediate variables to manipulate the data as follows:
  - (a) Use `mutate()`, `select()`, and `filter()` with `is.na()` to create a new data frame with the `year`, `species_id`, and weight **in kilograms** of each individual, with no null weights. Create a new data object called `surveys1`. Remember: The weight in the table is given in grams so you will need to create a new column called "weight_kg" for weight in kilograms by dividing the weight column by 1000.
  - (b) Use `filter()` with `is.na()` and `select()` to get the `year`, `month`, `day`, and `species_id` columns for all of the rows in the data frame where `species_id` is `SH` and with no null weights. Create a new data object called `surveys2`.
2. Write the same code but using pipes (either `|>` or `%>%`).

---

### Solo In-class exercise 4

The following code is written using intermediate variables. It obtains the data for "DS" in the "species_id" column, sorted by year, with only the year and weight columns. Write the same code to get the same output but using pipes instead.

```r
ds_data <- filter(surveys, species_id == "DS", !is.na(weight))
ds_data_by_year <- arrange(ds_data, year)
ds_weight_by_year <- select(ds_data_by_year, year, weight)
```
<!--
<details>
<summary> Solution: </summary>

```r
ds_weight_by_year <- surveys %>%
 filter(species_id == "DS", !is.na(weight)) %>%
 arrange(year) %>%
 select(year, weight)
```

</details>
 -->

---

### What if I want to pipe to an argument other than the first argument?

* To indicate the position of the piped argument we use the _underscore_ symbol `_` for the `|>` pipe and the _dot_ symbol `.` for the `%>%` magrittr pipe.
* This is used when the output goes to an argument other than the first argument of the function.
* For example, the function `lm()` fits a linear model relationship between two variables.
* This function takes the `formula =` as the first argument and the `data =` containing our two variables as the second argument.
* For example, to evaluate if weight has decreased or increased with time, in sequential/nested form:
```r
lm(weight ~ year, data = surveys)
```
* And using pipes and the placeholder:
```r
surveys |>
 lm(weight ~ year, data =_)
```

```r
surveys %>%
 lm(weight ~ year, data =.)
```
* We can get the summary of the fitted model with the function `summary()`; in nested form:
```r
summary(lm(weight ~ year, data = surveys))
```


### Solo In-class exercise 5

Use pipes to evaluate and summarize the relationship between weight and year for the species "DS". Make sure that you filter for missing values in weight.
The code in sequential form would look like the following:
```r
surveys_DS <- filter(surveys, species_id == "DS", !is.na(weight))
surveys_DS_lm <- lm(weight ~ year, data = surveys_DS)
summary(surveys_DS_lm)
```
<!--
```r
surveys |>
 filter(species_id == "DS", !is.na(weight)) |>
 lm(weight ~ year, data =_) |>
 summary()
```
-->


---

### Data grouping (also called data agreggation)

<!-- https://datacarpentry.org/semester-biology/materials/dplyr-aggregation/ -->
### Basic grouping

* The function `group_by()` combines rows into groups based on ONE or MORE columns.
* `group_by()` function has two arguments: 1) data to work on; 2) name of column (or columns) to group by
* For example, to group `surveys` by `year`:

```r
group_by(surveys, year)
```

* The output is a `tibble`, a different looking kind of `data.frame`.
  * The `tibble` contains information on the data source, the groupings, and the data type.
* We can also group by multiple columns.
* For example, group by "plot id" and by "year":

```r
group_by(surveys, plot_id, year)
```

### Summarizing data from groupings

* After grouping a data frame we can use the function `summarize()` to analyze each group.
* The function `n()` counts the number of rows for each grouping. It is a special function that only works within `dplyr` functions.
* The `summarize()` function takes as first argument a grouped table, an output of `group_by()`
* Then, it takes one additional argument for each new column with summarized data you want to add.
* The format of this arguments is `New column name`, followed by the equal sign `=`, finished by the calculation that we want to perform for each group
* For example, to get the abundance of individual pers year, we will use the function `n()`

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

* We can use any function that returns a single value from a vector; e.g., `mean()`, `max()`, `min()`, `sum()`
* For example, we can calculate the number of individuals in each plot-year group and their average weight

```r
surveys |>
  group_by(plot_id, year) |>
  summarize(abundance = n(), avg_weight = mean(weight))
```

* We get all `NA` in the "avg_weight" column :/
* Remember: `mean()` (and max, min and sum) returns `NA` when the input vector  has missing values (`NA`s)
* To fix this we use the argument `na.rm = TRUE`:
```r
mean(surveys$weight, na.rm = TRUE)
```

* Now, applied to the pipe:
```r
surveys |>
  group_by(plot_id, year) |>
  summarize(abundance = n(),
            avg_weight = mean(weight, na.rm = TRUE))
```

* We still get missing valies (in the form of `NaN`) because there are species that have never been weighed!
* We can `filter()` this using `!is.na()`

```r
surveys |>
  group_by(plot_id, year) |>
  summarize(abundance = n(),
            avg_weight = mean(weight, na.rm = TRUE)) |>
  filter(!is.na(avg_weight))
```


<!-- > Do [Portal Data Aggregation 1-2]({{ site.baseurl }}/exercises/Portal-data-aggregation-R/). -->
<!-- > Do [Portal Data Aggregation 3]({{ site.baseurl }}/exercises/Portal-data-aggregation-R/). -->

### Solo In-class Exercise 6

**Exercise 3: Data agreggation**
<!-- https://github.com/datacarpentry/semester-biology/blob/main/exercises/Portal-data-aggregation-R.md -->
1. Use the `group_by()` and `summarize()` functions to get a count of the number
   of individuals in each species ID.
2. Use the `group_by()` and `summarize()` functions to get a count of the number
   of individuals in each species ID in each year.
3. Use the `filter()`, `group_by()`, and `summarize()` functions to get the mean
   mass of species `DO` in each year.

<!--
https://github.com/datacarpentry/semester-biology/blob/main/exercises/Portal-data-joins-R.md
https://github.com/datacarpentry/semester-biology/blob/main/exercises/Portal-data-review-R.md
https://github.com/datacarpentry/semester-biology/blob/main/exercises/Portal-data-challenge-R.md
 -->
<!-- > Do [Shrub Volume Data Basics 8]({{ site.baseurl }}/exercises/Dplyr-shrub-volume-data-basics-R).
We are doing all teh shrub volume exercises as homework-->
