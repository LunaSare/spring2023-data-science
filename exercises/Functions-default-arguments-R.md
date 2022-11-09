---
layout: exercise
topic: Functions
title: The general form of a formula
language: R
---

Rewrite your `get_mass_from length()` function from the previous exercise so that it takes as default the general values of `a = 39.9` and `b = 2.6` (the average values from [Seebacher 2001](http://www.jstor.org/stable/4524171)).

1. Use this function to estimate the mass of a Sauropoda (`a = 214.44`, `b = 1.46`) that
   is 22 m long.
2. Use this function to estimate the mass of a dinosaur from an unknown taxonomic group that is 16m long.
   Only pass the argument `length`, not `a` and `b`, so that their default values are used.
