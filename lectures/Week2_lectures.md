---
layout: page
element: lecture
title: 'Intro to R and RStudio'
language: R
pagetype: lecture
symbol: <i class="fa fa-comment fa-lg"></i>
---

> **Learning Objectives**
>
> - understand and explain why coding is advantageous for data management
> - learn principles to format R code for readability and clarity
> - practice adding comments and breaks to R code
> - call R scripts from within R scripts (sourcing)
> - properly organize an R project and workspace with RStudio
> - read and write tables
>

---

<!--
Address this on day 1 of the course!!!
- What is data science?
- Data science uses scientific tools to extract meaning from data
-->


## Day 1: Overview of R and RStudio

- Programming is a key tool for data science and many areas of the human experience
- What is programming?
- Programming means to write a set of written rules that give instructions to a computational device (such as a computer) to perform a set of tasks.
- R survey results
- What is R?
- What is an R project?
- Best practices in data science (in R)
  - working with projects, relative vs absolute paths
  - Demo: setting up an RStudio project
  - to save or not to save the workspace in R
  - the standard organization of a working directory
  - Start a README file describing the documents you create in your project.
  - Use a template following readme best practices from https://data.research.cornell.edu/content/readme
- Finding help in R

- Live coding: Intro to programming with R: vectors

* [Introduction to R](http://www.datacarpentry.org/R-ecology-lesson/01-intro-to-r.html)

**A minute feedback for class 3**

- Please provide some quick feedback for this session [here](https://docs.google.com/forms/d/e/1FAIpQLSchxHqqJEKhGUxIxJcl3EELFzyTP_BReBQPNu-SS3nqolo_Kg/viewform)

---
---

## Day 2:

**Live coding: data tables and organizing a project with RStudio**

* Data Carpentry lesson [Starting with data](http://www.datacarpentry.org/R-ecology-lesson/02-starting-with-data.html):
  - function `download.file()`
  - inbuilt functions vs package functions
  - installing packages: the `tidyverse` package
  - function `tidyverse::read_csv()`
  - functions to read excel tables
  - functions to read google tables
  - functions to explore data structures
    - content: `head()`, `tail()`, and `view()`
    - summary: `str()` and `summary()`
    - size: `dim()`, `nrow()` and `ncol()`
    - names: `names()`, `colnames()`, `rownames()`
  - indexing data frames
  - subsetting data frames
  - Learners (in break out rooms) then instructor: do the [challenge](https://datacarpentry.org/R-ecology-lesson/02-starting-with-data.html#Challenge12)
  - Learners: do [Activity 1](https://lunasare.github.io/data-science-research-biology/assignments/week2_activities/)

* Factors and formatting dates will be covered later.


  **A minute feedback for class 4**

  - Please provide some quick feedback for this session [here](https://docs.google.com/forms/d/e/1FAIpQLSf1Pn_yIUozl5FrkF75Cmx4kiuBwiXjVoaSDG63x_WzShs63w/viewform)
