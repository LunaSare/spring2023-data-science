---
layout: exercise
topic: Data wrangling
title: Piping placeholders
language: R
---

**Exercise 4**

Use pipes to evaluate and summarize the relationship between `weight` and `year` for the species `"DS"`. Make sure that you filter for missing values in `weight`.
The code in sequential form would look like the following:

```r
surveys_DS <- filter(surveys, species_id == "DS", !is.na(weight))
surveys_DS_lm <- lm(weight ~ year, data = surveys_DS)
summary(surveys_DS_lm)
```
