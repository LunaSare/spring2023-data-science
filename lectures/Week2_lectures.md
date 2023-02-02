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


## Day 1: Intro to R and Rstudio

### Review
- What is a GUI?
- In computer paths, what are the two meanings of the forward slash `/`?
- What is programming?
  - Programming means to write a set of written rules that give instructions to a computational device (such as a computer) to perform a set of tasks.
  - Programming is a key tool in data science
  - There are many different programming and scripting languages; they all have different strengths.
- What is a CLI? Which CLIs have we used so far?
- R [survey results](https://docs.google.com/forms/d/1MgTN7yxMo2hJ0G6_uNHXlUu_QjAEDwFKJJuBkCFHR9g/edit#responses)

### Intro
- What is R?
  - R is also a CLI
  - R is a software that interprets the language
  - R is a programming and a scripting language
  - Started as a statistics and data analysis environment
  - But can also build websites, run simulations, build books, build interactive apps, ...
- What is a script?
  - A file that contains (stores) a sequence of written commands (instructions) that is executed (ran, carried out) by another program (not the computer itself).
- What are the advantages of scripts VS point-and-click workflows?
  1. No need to remember the workflow
  1. Rerun the workflow any time
  1. Others can inspect your workflow
  1. Get feedback and improve
  1. Deeper and better understanding of the workflow
- What is reproducibility?
  - The ability of someone else (including your future self) to obtain the same results from the same dataset when doing the same analysis.
- What qualities of R make it good for reproducibility?
  1. It allows saving scripts from an analysis workflow
  1. With Rmarkdown, it generates static documents displaying code, results and graphics (as PDF or html)
  1. It is free, open-source and cross-platform
  1. It has a large community of users  
- What else is good about R?
  1. It is interdisciplinary and extensible
  1. It creates high-quality graphics
  1. R works on data of all shapes and sizes

### Knowing your way around R and Rstudio
### Expressions and variables/objects

- What is RStudio?
  - IDE - Integrated Development Environment
  - Makes developing code in R easier by including a number of tools in one place
- What are the 4 panes of RStudio?
  1. The R console; similar to the terminal, as in that it is a CLI, it directly executes any instruction that we write.
    - In R, commands are called expressions
      - demo `pwd`
      - The expression `getwd()`
      - demo `2 + 2` on the R console and on bash
      - demo other calculations in R with unit conversion
        - Exercise: convert the weight of a lab mouse (20 grams) to pounds
        - Consider 1 kg = 2.2 lbs
  1. The scripts pane
    - Creating a script in R
    - Demo running `2 + 2` from a script
    - Adding comments to a script with `#`
    - Saving a script
    - Joint exercise: [Basic Expressions]({{ site.baseurl }}/exercises/Expressions-and-variables-basic-expressions-R)
  1. The Files/Plots/Packages/Help/Viewer
    - It shows the file structure
    - It shows the help
    - Other ways of getting help with `?` and `??`
  1. The environment/history pane
    - What is the R workspace?
      - It is the current working environment in R
      - A working environment is [a temporary space on your CPU's RAM that “disappears” at the end of the R session](http://learnr.usu.edu/base_r/environment/2_5_directory_workspace.php)
      - It includes any user-defined objects
        - What is an object in R?
          - It is a name with a value associated to it.
          - It is [a variable; an instance of a class](https://www.projectpro.io/recipes/create-objects-r#:~:text=object%20in%20R%3F-,What%20are%20R%20objects%3F,are%20all%20objects%20in%20R)
          - It is [a data structure having some attributes and methods which act on its attributes](https://www.datamentor.io/r-programming/object-class-introduction/).
          - How to create objects in R?
          - the `<-` assignment operator
            - `weight_kg <- 20` executes the code, creates the object/variable
            - `(weight_kg <- 20)` prints value of variable to screen
          - Solo/joint exercise [Basic Variables]({{ site.baseurl }}/exercises/Expressions-and-variables-basic-variables-R)
          - Homework exercises [More variables]({{ site.baseurl }}/exercises/Expressions-and-variables-more-variables-R) and [Variable names]({{ site.baseurl }}/exercises/Expressions-and-variables-variable-names-R).
      - It is good practice to never save the R workspace and always start sessions fresh
      - Demo: How to never save the workspace in R
    - What is the R history?
      - You can access the history with the up and down arrows
      - Also with the function `history()`

### Rstudio projects

- What is the working directory in R?
  - It is one of many best practices for data science and reproducibility
  - It is a self-contained folder storing a set of related data, analyses, and text together
  - It is the "place" from where R will be looking for and saving any files
  - Allows writing code that only relies on files within the working directory folder
  - It allows using relative paths instead of absolute paths
- why are relative paths good for reproducibility?
  - It allows you to move your project around on your computer and share it with others without worrying about whether or not the underlying scripts will still work
- Working dirs in R are set up with projects
  - Demo: setting up an RStudio project
  - Run `getwd()` again
  - the standard organization of a working directory
    -  `data` folder
    -  `data-raw` folder
    -  `scripts` folder
    -  `figs` folder
    - a README file

### Exercise: the README file
- Start a README file describing the folders you just created in your project.
- Save it with the .txt extension
- The README must have at least two sections:
  1. General Information
    - A title for the project
    - Name/institution/address/email information for person responsible for the project
    - Date that the project was started
    - Keywords describing the project
    - Programming language(s) used
    - Funding sources
    - License, read [What is the most appropriate license for my data?](https://help.figshare.com/article/what-is-the-most-appropriate-licence-for-my-data)
  2. File overview
    - Write down the name and a description for each folder in your project
- For more information on README best practices, read [Guide to writing "readme" style metadata](https://data.research.cornell.edu/content/readme) from the Research Data Management Service Group at Cornell University.


### Basics of functions
- functions and their arguments
- similarities and differences of R functions with shell commands
  - name of function
  - options and arguments go inside parenthesis instead of separated by blank spaces
    - `sqrt(25)`
  - variables can be passed as arguments
    ```
    weight <- 121.38
    sqrt(weight)
    ```
- the `str()` function shows the type of a value or object/variable
  - All values (and therefore all variables) have types
  - `str(weight)`
- How many arguments can a function take?
  * Functions can take multiple arguments.
      * Round `weight_lb` to one decimal place
      * Typing `round()` shows there are two arguments
      * Number to be rounded and number of digits

      ```r
      round(weight, 1)
      ```
* Functions return values, so as with other values and expressions, if we don't save the output of a function then there is no way to access it later
* Functions do not change the value of a variable
* For example, looking at `weight_lb` we see that it hasn't been rounded
  ```r
  weight
  ```
* To save the output of a function we assign it to an object/variable.
  ```r
  weight_rounded <- round(weight, 1)
  weight_rounded
  ```
- Exercise [Built-in functions]({{ site.baseurl }}/exercise/Functions-built-in-functions-R)
<!-- - Homework exercise []() -->

**A minute feedback for class 5**

- Please provide some quick feedback for this session [here]({{ site.feedback.class5 }})

---
---

## Day 2: Intro to vectors

### Review

- bash shell
  - `echo` and `print` commands
  - the exclamation mark `!` command, [many uses](https://www.baeldung.com/linux/exclamation-mark-interactive-shells):
    - repeating the last command
    - searching the beginning of a command in the history
    - reuse the file path from teh previous command `!$`
    - start a shell script `#!/usr/bin/bash`
  - escaping `!` to use as a character string
- difference between `>` and `>>` exercise:
```
echo "hello" > hello.txt
nano hello.txt
echo "hello" >> hello.txt
nano hello.txt  
echo "leopard" > hello.txt
```

{% include_relative vectors-R.md %}



**A minute feedback for class 6**

- Please provide some quick feedback for this session [here]({{ site.feedback.class6 }})


<!--
**Live coding: data tables**

* Data Carpentry lesson [Starting with data](http://www.datacarpentry.org/R-ecology-lesson/02-starting-with-data.html):
  - function `download.file()`
  - inbuilt functions vs package functions
  - installing packages: the `tidyverse` package
  - function `tidyverse::read_csv()`
  - functions to read excel tables
  - functions to read google tables
  - functions to explore table structures
    - content: `head()`, `tail()`, and `view()`
    - summary: `str()` and `summary()`
    - size: `dim()`, `nrow()` and `ncol()`
    - names: `names()`, `colnames()`, `rownames()`
  - indexing data frames
  - subsetting data frames
  - Learners (in break out rooms) then instructor: do the [challenge](https://datacarpentry.org/R-ecology-lesson/02-starting-with-data.html#Challenge12)
  - Learners: do [Activity 1](https://lunasare.github.io/data-science-research-biology/assignments/week2_activities/)

* Factors and formatting dates will be covered later.
-->
