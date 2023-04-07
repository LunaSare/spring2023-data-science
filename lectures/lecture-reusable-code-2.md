---
layout: page
element: lecture
title: 'Reusing code - Loops'
language: R
pagetype: lecture
symbol: <i class="fa fa-comment fa-lg"></i>
---

> **Learning Objectives**
>
> This week, students will:
> - Learn the structure of loops
>
> **Practice Objectives**
> - Vectorized functions
> - Creating functions
>
<!-- > **Non Objectives**
> -
> -
> -->

### Review

- Question from last class: To get all the functions within a family, we can use the function `methods()`

```
methods(is)
methods(summary)
methods(summarize)
```

### Setup your RStudio project (5 min)

- 🎗️ Structuring your files into a _project_ is a best practice for good data science!
- Open your _RStudio project_ for the class; I called mine "**spring2023**".
- Open a new file, name it "**loops.Rmd**", and save it to your "**documents**" folder.

## Day 1

### Looping by values in an object

- The basic structure of a for loop
- For example:
```
# If we have an initial vector of values
lengths <- c(13.3, 15, 100)
# We can run code using each value stored in a vector
for (value in lengths) {
  mass <- 0.73 * value^2
  print(mass)
  # we can't use return() in for loops
}
```
- Exercises 1 and 2: [Basics of for loops]({{ site.baseurl }}/exercises/Loops-basic-for-loops-R) (5 min)

### Looping by index

- An index in R is the numeric position of values inside a data structure in R.
- For example:
```
flowers <- c("lilacs", "daisies", "jasmins")
flowers[2]
```
- To access an element in the vector, we need to use a number as index inside square brackets
- That returns the value that is in the position given by the number.
- We can use numbers as indices to loop over values inside a vector.
```
for (i in 1:3) {
  print(i)
  print(flowers[i])
}
```
- Exercise 3: [Basics of for loops]({{ site.baseurl }}/exercises/Loops-basic-for-loops-R) 5 min)

### Storing results from loops
- So far we have just printed results from equations running inside our loops.
- Usually, we need to save the results of running a for loop, so that we can use them later.
- When we are using a function, we use an assignment to store the results from the function.
```
my_results <- 0.73 * lengths^2
```
- In loops we do not have that option. We can't do:
```
my_result <- for (variable in vector) {
}
```
- The only way to save results from each iteration of the loop is by saving them into an empty object.
- To create an empty vector, we use the function `vector()`.
- For example, run the following loop:
```
flowers <- c("lilacs", "daisies", "jasmins")
for (i in 1:length(flowers)) {
  upper <- toupper(flowers[i])
  print(upper)
}
```
- Then, create an empty vector to store results
```
my_results <- vector(mode = "character", length = length(flowers))
my_results
```
- Finally, use this empty vector and indices inside a loop to store results:
```
for (i in 1:length(flowers)) {
  upper <- toupper(flowers[i])
  my_results[i] <- upper
}
my_results
```
- Exercise 4: [Basics of for loops]({{ site.baseurl }}/exercises/Loops-basic-for-loops-R) (5 min)

### Looping over multiple objects

- When we have multiple vectors, we can use numeric indices to use values from all vectors at a time within a loop.
- Exercise 5: [Basics of for loops]({{ site.baseurl }}/exercises/Loops-basic-for-loops-R) (5 min)
<!-- https://datacarpentry.org/semester-biology/exercises/Loops-basic-for-loops-R/ -->


## Day 2

### Looping using functions

#### Exercise 2: [Mass of dinosaurs with loops]({{ site.baseurl }}/exercises/Loops-size-estimates-by-name-loop-R) (30 min)

<!-- https://datacarpentry.org/semester-biology/exercises/Loops-size-estimates-by-name-loop-R/ -->

### Looping over files

Practical uses of `for` loops

#### Exercise 3: [Automatic analysis of muliple files]({{ site.baseurl }}/exercises/Loops-multi-file-analysis-R) (30 min)

<!-- https://datacarpentry.org/semester-biology/exercises/Loops-multi-file-analysis-R/ -->



<!-- https://github.com/datacarpentry/semester-biology/blob/main/exercises/Functions-string-data-R.md -->
