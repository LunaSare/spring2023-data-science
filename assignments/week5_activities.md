---
layout: page
element: assignment
title: 'Intro to rmarkdown'
language: R
pagetype: homework
symbol: <i class="fa fa-keyboard-o fa-lg"></i>
---

> **Individual Activity: A document for your data life cycle**
>
> The goals of this activity are:
> - To remember the steps of the data life cycle
> - To practice mrakdown syntax
> - To use rmarkdown functions that render a PDF file from an Rmd file
> - To remember basic steps of version control with `git` when working with a remote repository on GitHub

1. Open the Rstudio project of your data science repository.
2. From Rstudio, create a new Rmd file called "my_data_life_cycle.Rmd"
3. In it, use markdown syntax and write down the list that you created for the assignemt "create your own data cycle", [here]({{ site.jamboard-data-life-cycle }}).
1. Save the Rmd file to the `documents` folder.
1. Render it as pdf.
1. Add, commit and push your changes to the remote repository on GitHub.





   <!--
   5. Run the following code `sum(dispersal_mode == "lemur")`. Is it the same as the number of plant species that are dispersed by lemurs?
   6. Now run the code `sum(TRUE)`, `sum(FALSE)`, `sum(c(TRUE, TRUE))`. Can you explain why  
   -->


<!-- ** Day 2**

> **Activity 2: Goals**
>
> -

---

{% include assignment.html %}

2. Clone your repository in a local directory using Rstudio
  - You can find last lecture slides [here]({{ site.baseurl }}/materials/01_RIntro_VersionControl/01_RIntro_VersionControl.html){:target="_blank"}
3. Open the .R file and check its general structure
4. Comment and create sections within the R code file (e.g., libraries, data, plots, etc)

```r
# LIBS -----------------------------
# Some notes
library(tidyverse)
library(lubridate)

# DATA -----------------------------
# Some notes
dat1<-read.csv("file2.csv")
```

5. Using ``help(function)`` or ``?function`` describe what is being done in each section of the code

6. Commit your changes

9. Relabel and, if it is necessary, create new folders to organize your project for reproducibility
  * Check [here](http://www.datacarpentry.org/semester-biology/materials/project-structure/){:target="_blank"} for further information and examples
10. Commit your final changes
11. Check your commits history on your Github repository


## Assignment potential solution

* [Here](https://github.com/GlobalEcologyBiogeography/projects-structure-susyelo.git) you can see an example of how to solve the assignment.
* You can also access the files directly [here](../../solutions/Week2_solution/) -->
