---
layout: page
element: lecture
title: 'Reusing code - Apply functions'
language: R
pagetype: lecture
symbol: <i class="fa fa-comment fa-lg"></i>
---

## Vectorized functions

> **Learning Objectives**
>
> This week, students will:
> - Learn to run functions on multiple datasets by using:
>   - vectorized functions
>   - `apply` functions
>   - the function `rowwise()` from `dplyr`
> - Understand that the `group_by()` function from `dplyr` runs the same function on multiple data sets
> - Learn the difference between these four methods for code reusing
> - Manipulate character strings with the package `stringr` and `paste()`
>
> **Practice Objectives**
> - Creating functions
> - Deafult values for arguments
> - Reading tables
> - Using functions from `dplyr` and `ggplot2`
>
<!-- > **Non Objectives**
> -
> -
> -->


### Setup your RStudio project (5 min)

- 🎗️ Structuring your files into a _project_ is a best practice for good data science!
- Open your _RStudio project_ for the class; I called mine "**fall-2022**".
- Open a new file, name it "**apply.Rmd**", and save it to your "**documents**" folder.

<!-- ### Review

- Homework
- last class -->

### Vectorized functions (5 min)

#### Exercise 1: [Calculating the mass of a bunch of dinosaurs]({{ site.baseurl }}/exercises/Loops-size-estimates-vectorized-R) (35 min)

<!-- https://datacarpentry.org/semester-biology/exercises/Loops-size-estimates-vectorized-R -->

### `sapply()` (5 min)

#### Exercise 2: [Conditioning on length]({{ site.baseurl }}/exercises/Loops-size-estimates-with-maximum-R) (15 min)

<!-- https://datacarpentry.org/semester-biology/exercises/Loops-size-estimates-with-maximum-R -->
### `mapply()` (5 min)

#### Exercise 3: [A data set of dinosaur lengths]({{ site.baseurl }}/exercises/Loops-size-estimates-by-name-apply-R) (30 min)

<!-- https://datacarpentry.org/semester-biology/exercises/Loops-size-estimates-by-name-apply-R -->

### Discussion (20 min)

- How does using the functions you practiced today (vectorized and `apply` functions) is different from creating your own (regular) functions?
  - Creating and using a regular function:
    1. avoids repeating a group of code
    2. can be applied to a small number of values in a given amount of time
  - Using vectorized functions and apply functions:
    1. avoids repeating the same funcion over and over with different values
    2. can be applied to an almost infinite number of values in seconds
