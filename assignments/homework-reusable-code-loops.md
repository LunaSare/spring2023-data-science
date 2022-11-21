---
layout: page
element: assignment
title: 'Reusing code - Loops'
language: R
pagetype: 'after class'
symbol: <i class="fa fa-keyboard-o fa-lg"></i>
---

## Homework

<!-- Challenges from https://datacarpentry.org/semester-biology/assignments/r-iteration-1/-->

> **Instructions**
> - Open a new file called "**loops-after.Rmd**" and save it in your "**documents**" folder.
> - Write the code to solve the following exercises in R chunks.
> - Add comments to each line of code explaining with your own words what the code is doing.
> - Once you are finished, knit to PDF.
> - Git add, commit and push the new files (PDF and Rmd) to your remote repository.
>

The UHURU experiment in Kenya has conducted a survey of *Acacia* and other tree species in ungulate exclosure treatments.
Each of the individuals surveyed were measured for tree height (`HEIGHT`), circumference (`CIRC`) and canopy size in two directions (`AXIS_1` and `AXIS_2`).


### Exercise 1: Tree volumes

{% include_relative exercises/Loops-crown-volume-calculation-R.md %}

---

### Exercise 2: Tree growth

{% include_relative exercises/Loops-tree-growth-R.md %}
