---
layout: exercise
topic: Data wrangling
title: Data aggregation
language: R
---

**Exercise 5**

<!-- https://github.com/datacarpentry/semester-biology/blob/main/exercises/Portal-data-aggregation-R.md -->

For this exercise, you will be working with the [surveys.csv](https://ndownloader.figshare.com/files/2292172) data set.

1. Load `surveys.csv` into R using `read.csv()` and assign it to an object called `surveys`.
1. Use the `group_by()` and `summarize()` functions to get a count of the number
   of individuals with each species ID.
2. Use the `group_by()` and `summarize()` functions to get a count of the number
   of individuals with each species ID in each year.
3. Use the `filter()`, `group_by()`, and `summarize()` functions to get the mean
   mass of species with `species_id` equals to `DO` in each year.
