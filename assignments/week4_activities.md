---
layout: page
element: assignment
title: 'Intro to version control'
language: R
pagetype: activities
symbol: <i class="fa fa-keyboard-o fa-lg"></i>
---

> **Session 1: Instructions**
>
> -
>

---
---

> **Session 2: Instructions**
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

9. Relabel and, if it is necessary, create new folders to organise your project for reproducibility
  * Check [here](http://www.datacarpentry.org/semester-biology/materials/project-structure/){:target="_blank"} for further information and examples
10. Commit your final changes
11. Check your commits history on your Github repository


## Assignment potential solution

* [Here](https://github.com/GlobalEcologyBiogeography/projects-structure-susyelo.git) you can see an example of how to solve the assignment.
* You can also access the files directly [here](../../solutions/Week2_solution/)
