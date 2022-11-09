---
layout: exercise
topic: Functions
title: Writing Functions
language: R
---

<style type="text/css">
    ul { list-style-type: none; }
</style>


1. Copy the following function into an R chunk of your Rmd file and replace the spaces `________` with variables names for the input and output.
    ```r
    convert_pounds_to_grams <- function(________) {
        grams = 453.6 * pounds
        return(________)
    }
    ```

2. Use the function to calculate how many grams there are in 3.75 pounds.
3. What are the following parts of the function called:
  - a)
  ```r
  convert_pounds_to_grams
  ```
  - b)
  ```r
  {
      grams = 453.6 * pounds
      return(________)
  }
  ```
  - c)
  ```r
  function(________)
  ```
