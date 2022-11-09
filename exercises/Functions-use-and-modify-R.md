---
layout: exercise
topic: Functions
title: Use and Modify Functions
language: R
---

1. Use the function `get_mass_from_length_theropoda()` to get the mass of a _Spinosaurus_ that is 16 m long based on its reassembled skeleton.
2. Create a new version of this function called `get_mass_from_length()` that takes the arguments `length`, `a` and `b`. Remember to change the body of the function accordingly, and use the following code to estimate the mass: `mass <- a * length ^ b`.
3. Use this new function to estimate the mass of a Sauropoda dinosaur (with parameters `a = 214.44`, and `b = 1.46`) that is 26 m long.
