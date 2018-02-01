---
layout: page
element: assignment
title: 'Dimensions of biodiversity II <br> <span style="color:gray">Project Structure</span>'            
---

#### Learning Objectives

> Following this assignment students should be able to:
>
>  - Read files in R
> - Understand data manipulation functions in R
> - Summarise dataframes
> - Subset dataframes
> - Write csv files
> - Create basic plots

****

{% include assignment.html %}

1. Accept the "Manipulating data" assignment [here](https://classroom.github.com/a/QQkHNkhV){:target="_blank"}
2. Clone your repository in a local directory using Rstudio
3. For this assignment, we are going to use the Trait plant data from:

  *Razafindratsima OH, Brown KA, Carvalho F, Johnson SE, Wright PC, Dunham AE (2017) Data from: Edge effects on components of diversity and above-ground biomass in a tropical rainforest. Dryad Digital Repository. https://doi.org/10.5061/dryad.jn743*

4. Go to [this link](https://doi.org/10.5061/dryad.jn743){:target="_blank"} and download the .xlsx file.
5. Open the file in a spreadsheet program and save the trait tab into a .csv file (comma delimited)
6. In the "code.R" file from the assignment repository, write the necessary R code to:

  6.1. Read the csv file
  6.2. Show the number of unique families found in the data frame
  6.3. Show the number of species in each family
  6.4. Calculate the average fruit width in cm per dispersal mode
  6.5. Create a csv file with all the species that are dispersed by lemurs and have a fruit length > 8 mm
  6.6. Plot the number of species in each fruit colour category using (A) all the data, and (B) the lemur subset data



Notes: Do not forget to commit and push your main changes
