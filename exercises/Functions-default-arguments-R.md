---
layout: exercise
topic: Functions
title: Default Arguments
language: R
---

Rewrite your `get_mass_from length()` function from [Use and Modify]({{ site.baseurl }}/exercises/Functions-use-and-modify-R) so that its arguments have default values of `a = 39.9` and `b = 2.6` (the average values from [Seebacher 2001](http://www.jstor.org/stable/4524171)).

1. Use this function to estimate the mass of a Sauropoda (`a = 214.44`, `b = 1.46`) that
   is 22 m long (by setting `a` and `b` when calling the function).
2. Use this function to estimate the mass of a dinosaur from an unknown taxonomic group that is 16m long.
   Only pass the function `length`, not `a` and `b`, so that the default values are used.
