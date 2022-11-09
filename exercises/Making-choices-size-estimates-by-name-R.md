---
layout: exercise
topic: Making Choices
title: Mass estimates by biological group
language: R
---
<style type="text/css">
    ul { list-style-type: none; }
</style>

This is a follow up to exercise [Use and Modify Functions]({{ site.baseurl }}/exercises/Functions-use-and-modify-R).

To make it even easier to work with your dinosaur mass estimation functions, create a function that lets you specify a dinosaur group, and then have the function automatically choose the right parameters for mass estimation for that group.

1. Create a new function `get_mass_from_length_by_name()` that:
  - takes two arguments, the `length` and the `name` of the dinosaur group.
  - Inside this function use `if`/`else if`/`else` statements to check if the name is one of the following values and if so set `a` and `b` to the appropriate values (from [Seebacher 2001](http://www.jstor.org/stable/4524171)).
    * Stegosauria:  `a = 10.95` and `b = 2.64`.
    * Theropoda:  `a = 0.73` and `b = 3.63`.
    * Sauropoda:  `a = 214.44` and `b = 1.46`.
    * If the name is not any of these values, the function should return `NA`.
  - Once the function has chosen the correct `a` and `b` values, have it run `get_mass_from_length()` with the appropriate values and return the estimated mass.
2. Run the function for:
  - a) A Stegosauria that is 10 meters long.
  - b) A Theropoda that is 8 meters long.
  - c) A Sauropoda that is 12 meters long.
  - d) A Ankylosauria that is 13 meters long.

3. (Challenge)  Modify your function so that if the group given in `name` does not have `a` and `b` values, print out a message saying that there is no information to get the mass of the given group. The message should contain the name of the group, for example "No known estimation for Ankylosauria". Use the function `paste()` to do this. Doing this successfully will modify your answer to 2d, which is fine

4. (Challenge) Change your function so that it uses two different values of `a` and `b` for Stegosauria:
  - a) When Stegosauria is greater than 8 meters long use the equation above.
  - b) When it is less than 8 meters long use `a = 8.5` and `b = 2.8`.
  - c) Run the function for a Stegosauria that is 6 meters long.

5. (Optional) Rewrite your function so that instead of calculating mass directly it sets the values of a and b to the values for the species (or to NA if the species doesn't have values for a and b) and then calls another function to do the basic `mass = a * length ^ b` calculation.
