---
layout: exercise
topic: Loops
title: Size Estimates By Name Loop
language: R
---


If `dinosaur_lengths.csv` is not already in your working directory download a copy of the [data on dinosaur lengths with species names]({{ site.baseurl }}/data/dinosaur_lengths.csv). Load it into R.

1. Write a function `mass_from_length()` that uses the equation `mass <- a * length^b` to estimate the size of a dinosaur from its length.
This function should take two arguments, `length` and `species`. For each of the following inputs for `species`, use the given values of `a` and `b` for the calculation from [Seebacher 2001](http://www.jstor.org/stable/4524171):
        * For `Stegosauria`:  `a = 10.95` and `b = 2.64`
        * For `Theropoda`:  `a = 0.73` and `b = 3.63`
        * For `Sauropoda`:  `a` = `214.44` and `b = 1.46`
        * For any other value of `species`: `a = 25.37` and `b = 2.49`
2. Use this function and a for loop to calculate the estimated mass for each dinosaur, store the masses in a vector, and after all of the calculations are complete show the first few items in the vector using `head()`.
3. Add the results in the vector back to the original data frame. Show the first few rows of the data frame using `head()`.
4. Calculate the mean mass for each `species` using `dplyr`.
