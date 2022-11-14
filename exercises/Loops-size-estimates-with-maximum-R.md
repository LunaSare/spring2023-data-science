---
layout: exercise
topic: Loops
title: Conditioning on length
language: R
---


1. Create a new version of your `mass_from_length_theropoda()` function from Part 1 of [Exercise 1]({{ site.baseurl }}/exercises/Loops-size-estimates-vectorized-R) called `mass_from_length_max()`.
  - This function should only calculate a mass if the value of `length` passed to the function is less than 20.
  - If `length` is greater than 20, return `NA` instead.
2. Use `sapply()` and this new function to estimate the mass for the `theropoda_lengths` data from [Exercise 1]({{ site.baseurl }}/exercises/Loops-size-estimates-vectorized-R).
