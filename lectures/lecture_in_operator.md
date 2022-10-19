- The logical operator `%in%`
  - It asks _**are the values on the vector to my left present in the vector to my right?**_
  ```r
  1 %in% c(1,2,3)
  "a" %in% "a"
  c(1,2,3) %in% c(4,5,1)
  ```
  - The output is a logical vector that we can use for subsetting
  ```r
  # creating an intermediate variable
  is_in <- c(1,2,3) %in% c(4,5,1)
  c(1,2,3)[is_in]
  ```
  ```r
  # with a pipe
  c(1,2,3) %in% c(4,5,1) %>%
    c(1,2,3)[.]
  ```
  - For example, if we want to get all the column names from the `species` table that are also in the `surveys` table,
  ```r
  colnames(species) %in% colnames(surveys)
  ```
    1. with intermediate variables:
    ```r
    is_in <- colnames(species) %in% colnames(surveys)
    colnames(species)[is_in]
    ```
    2. with a pipe:
    ```r
    colnames(species) %in% colnames(surveys) %in%
      colnames(species)[.]
    ```

<!--
- We can use the whole logical vector OR
- We can use the function `which()` to get the numeric index position of values that are `TRUE`.
- The function `match()`
  - Produces a numeric vector with `NA` values when there are no matches
  - To use this for indexing, we need to remove the `NA`s
-->
