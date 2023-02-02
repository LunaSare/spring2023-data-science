### Basics of Vectors

* All values in R have a basic type: numeric, logical, character, integer
* A vector is a sequence of values that all have the same type
- numeric vectors:
  - We can use the _colon_ `:` operator to create sequences of numbers
  ```r
  1:3
  ```
  - With the `c()` function we can add numbers in any order we want
  ```r
  c(10, 1, 8) # random order
  ```
  - But with `:` we can create sequences as long as we want to with just a few key strokes:
  ```r
  1:10
  1:100
  1:4589567
  ```
  - The function `seq()` creates sequences with any step we specify (not only 1 as with `:`)
  ```r
  seq(from = 1, to = 100, by = 2)
  seq(from = 1, to = 100, by = 0.5)
  ```
  - We can start numeric sequences at any number, in reverse order, and using negative numbers,
    - with the `:` operator:
    ```r
    15:20
    100:50
    -100:50
    5:-5
    ```
    - and with `seq()` (pay attention to the sign of the step (`by = ` argument))
    ```r
    seq(15, 20)
    seq(100, 50, -2)
    seq(-100, 50, 2)
    ```
    * We can use numeric vectors to calculate common summary statistics
    - For example, if we have a vector of population counts

    ```
    count <- c(9, 16, 3, 10)
    mean(count)
    max(count)
    min(count)
    sum(count)
    summary(count)
    ```

- character vectors:
  * Created using the `c()` function, which stands for "combine"
  ```
  states <- c("FL", "FL", "GA", "SC")
  ```
  * Many functions in R take a vector as input and return a value  
  * The `str()` function shows that this is a vector of 4 character strings

  ```
  str(states)
  ```
  - Other useful functions to explore the structure of an object/variable
    - `type()`
    - `class()`
    - `length` which determines how many items are in a vector
    - `head()`, `tail()`, and `view()`

- subsetting vectors
* Select pieces of a vector by slicing the vector (like slicing a pizza)
* Use square brackets `[]`
* In general `[]` in R means, "give me a piece of something"
* `states[1]` gives us the first value in the vector
* `states[1:3]` gives us the first through the third values
* `1:3` works by making a vector of the whole numbers 1 through 3.
* So, this is the same as `states[1:3]` is the same as `states[c(1, 2, 3)]`
* You can use a vector to get any subset or order you want `states[c(4, 1, 3)]`

- logical vectors:
- can be created with `c()`
- cam also be created with relational operators: equality `==`, larger than, smaller than, not equal to:
* Some examples of relational statements are:

```r
1 == 1
1 == 2
1 != 2
1 > 2
1 > 1
1 >= 1
1 < 2
1 <= 2
"A" == "A"
"A" == "a"
"A" != "a"
```

- we can compare a longer vector and a smaller vector `1:10 == 7`
- this returns a vector of length eual to the larger vector

> Do [Basic Vectors]({{ site.baseurl }}/exercises/Vectors-basic-vectors-R/).

### Null values

* So far we've worked with vectors that contain no missing values
* But most real world data has values that are missing for a variety of reasons
* For example, kangaroo rats don't like being caught by humans and are pretty good at escaping before you've finished measuring them
* Missing values, known as "null" values, are written in R as `NA` with no quotes, which is short for "not available"
* So a vector of 4 population counts with the third value missing would look like

```
count_na <- c(9, 16, NA, 10)
```

* If we try to take the mean of this vector we get `NA`?

```
mean(count_na)
```

* Hard to say what a calculation including `NA` should be
* So most calculations return `NA` when `NA` is in the data
* Can tell many functions to remove the `NA` before calculating
* Do this using an optional argument, which is an argument that we don't have to include unless we want to modify the default behavior of the function
* Add optional arguments by providing their name (`na.rm`), `=`, and the value that we want those arguments to take (`TRUE`)

```
mean(count_na, na.rm = TRUE)
```

- relational operations with `NA`
```r
NA > 3  # is obviously NA because we don't know if the missing value is larger than 3 or not
NA == NA  # the same with this, we have two missing values but the true values could be quite different, so the correct answer is "I don't know."
```
> Do [Nulls in Vectors]({{ site.baseurl }}/exercises/Vectors-nulls-in-vectors-R/).

### Working with multiple vectors

* Build on example where we have information on states and population counts by adding areas

```
states <- c("FL", "FL", "GA", "SC")
count <- c(9, 16, 3, 10)
area <- c(3, 5, 1.9, 2.7)
```

#### Vector math

* We can divide the count vector by the area vector to get a vector of the density of individuals in that area

```
density <- count / area
```

* This works because when we divide vectors, R divides the first value in the first vector by the first value in the second vector, then divides the second values in each vector, and so on
* Element-wise: operating on one element at a time

#### Filtering

* Subsetting or "filtering" is done using `[]`
* Like with slicing, the `[]` say "give me a piece of something"
* Selects parts of vectors based on "conditions" not position
* Get the density values in site a

```r
density[states == 'FL']
```

* `==` is how we indicate "equal to" in most programming languages.
* Not `=`. `=` is used for assignment.

* Can also do "not equal to"

```r
density[states != 'FL']
```

* Numerical comparisons like greater or less than
* Select states that meet with some restrictions on density

```r
states[density > 3]
states[density < 3]
states[density <= 3]
```

* Can subset a vector based on itself
* If we want to look at the densities greater than 3
* `density` is both the vector being subset and part of the condition

```r
density[density > 3]
```

* Multiple vectors can be used together to perform element-wise math, where we do the same calculation for each position in the vectors
* We can also filter the values in vector based on the values in another vector or itself

> Do [Shrub Volume Vectors exercise]({{ site.baseurl }}/exercises/Vectors-shrub-volume-vectors-R/).
