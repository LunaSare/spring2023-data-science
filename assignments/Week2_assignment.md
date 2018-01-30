---
layout: page
element: assignment
title: 'Dimensions of biodiversity I <br> <span style="color:gray">Intro to R and version control</span>'            
---

#### Learning Objectives

> Following this assignment students should be able to:
>
> - Properly structure and R project
> - create a new repository in git from Github
> - clone a repository from Github using Rstudio

****

{% include assignment.html %}

1. Go to the Ecoinformatics classroom in [Github Classroom](https://classroom.github.com/classrooms)
2. Click on the ``Projects Structure`` assignment
3. Clone your repository in a local directory using Rstudio
  - You can find last lecture slides [here]({{ site.baseurl }}/materials/01_RIntro_VersionControl/01_RIntro_VersionControl.html)
4. Open the .R file and check its general structure
5. Comment and create sections within the R code file (e.g., libraries, data, plots, etc)

```r
# LIBS -----------------------------
# Some notes
library(tidyverse)
library(lubridate)

# DATA -----------------------------
# Some notes
dat1<-read.csv("file2.csv")
```

6. Using ``help(function)`` or ``?function`` describe what is being done in each section of the code
7. Commit your changes
8. Relabel and, if it is necessary, create new folders to organise your project for reproducibility
  - Check [here](http://www.datacarpentry.org/semester-biology/materials/project-structure/) for further information and examples
9. Commit your final changes
10. Check your commits history on your Github repository

```
