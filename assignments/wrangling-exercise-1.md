---
layout: exercise
topic: Data wrangling
title: Data manipulation
language: R
---

**Exercise 1**

<!-- https://github.com/datacarpentry/semester-biology/blob/f72ab33a6876b904c26ac566d13885096d4a0246/exercises/Portal-data-manip-R.md -->

For this exercise, we will be working with the [surveys.csv](https://ndownloader.figshare.com/files/2292172) data set.

1. Load `surveys.csv` into R using `read.csv()` and assign it to an object called `surveys`
2. Use `select()` to create a new data frame object called `surveys1` with just the `year`, `month`,
   `day`, and `species_id` columns in that order.
3. Create a new data frame called `surveys2` with the `year`, `species_id`, and a new column called  `weight_kg` that contains the weight **in kilograms** of each individual, with no null weights. For this, you can use `mutate()`, `select()`, and `filter()` with the option `!is.na()`. The weight in the table is given in grams so you will need to create a new column called `weight_kg` for weight in kilograms by dividing the weight column by 1000.
4. Use the `filter()` function to create a new object called `surveys3` that has all of the rows in the data frame `surveys1` for the species ID "SH".
How many rows does the resulting table has?
5. Knit to PDF, git add, commit and push to your remote repository.
Make sure not to print any table as a whole in your knitted PDF. You can use `head()` or `str()` to display your resulting tables.
