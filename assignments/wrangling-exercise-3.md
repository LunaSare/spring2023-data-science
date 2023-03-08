---
layout: exercise
topic: Data wrangling
title: Pipe practice
language: R
---

**Exercise 3**

The following code is written using intermediate variables. It obtains the data for `"DS"` in the `"species_id"` column, sorted by `year`, with only the `year` and `weight` columns. Write the same code to get the same output but using pipes instead.

```r
ds_data <- filter(surveys, species_id == "DS", !is.na(weight))
ds_data_by_year <- arrange(ds_data, year)
ds_weight_by_year <- select(ds_data_by_year, year, weight)
```
