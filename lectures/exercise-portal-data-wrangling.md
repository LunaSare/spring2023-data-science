---
layout: exercise
topic: Data wrangling
title: Data manipulation
language: R
---

<!-- ### Solo In-class Exercise (30 min) -->

<!-- https://github.com/datacarpentry/semester-biology/blob/f72ab33a6876b904c26ac566d13885096d4a0246/exercises/Portal-data-manip-R.md -->
1. Load the data set from the file `surveys.csv` into R using the function `read.csv()`.
2. Use `select()` to create a new data frame object called `surveys1` with just the `year`, `month`,
   `day`, and `species_id` columns in that order.
3. Create a new data frame called `surveys2` with the `year`, `species_id`, and weight **in kilograms** of each individual, with no null weights. Use `mutate()`, `select()`, and `filter()` with `!is.na()`. The weight in the table is given in grams so you will need to create a new column called "weight_kg" for weight in kilograms by dividing the weight column by 1000.
4. Use the `filter()` function to get all of the rows in the data frame `surveys2` for the species ID "SH".
