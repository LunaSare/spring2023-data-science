---
layout: page
element: lecture
title: 'Visualizing data'
language: R
---

> **Learning Objectives**
>
> After this topic, students will be able to:
>
> - Install packages for data visualization in R
> - Use `ggplot` plotting functions
> - Add plots to an rmarkdown document
> - Explain what metadata is

---
## Day 1

### Class set up (5 min)

- Open your `data-science` RStudio project
- make sure that everything is up to date from the remote and that you have pushed all previous changes.
- make sure that your working directory is set up correctly with `getwd` and `setwd`
- Make sure that you have a "documents" folder. All your Rmd files will go in there.

### Intro to the working dataset and class set up (15 min)

- For the data visualization class, we will be working with the "UHURU" dataset, used for research that was published in 2014 in the journal of Ecology, in a paper entitled [Plant and small-mammal responses to large-herbivore exclusion in an African savanna: five years of the UHURU experiment](https://esajournals.onlinelibrary.wiley.com/doi/10.1890/13-1023R.1).
- All information about the UHURU data set is available on its [metadata description](https://esapubs.org/archive/ecol/E095/064/metadata.php).
- Describe the experiment and its goal using the images available in the metadata description.
- Authors made the raw data itself available on [figshare](https://figshare.com/collections/Plant_and_small-mammal_responses_to_large-herbivore_exclusion_in_an_African_savanna_five_years_of_the_UHURU_experiment/3306579).
- There are several data files associated to this publication, that can be downloaded from [figshare](https://figshare.com/articles/dataset/Data_Paper_Data_Paper/3558804?backTo=/collections/Plant_and_small-mammal_responses_to_large-herbivore_exclusion_in_an_African_savanna_five_years_of_the_UHURU_experiment/3306579).
- For this lecture, we will only work with the [ACACIA_DREPANOLOBIUM_SURVEY.txt](https://ndownloader.figshare.com/files/5629542) data file. Click on the name of the file to download it to your computer.
- _Acacia drepanolobium_ is one of aprox 160 species in the genus _Acacia_. These are trees that live in dry forests, and they are very common in Mexico. They have yellow bright, pom-pom liked flowers, and have a symbiotic relationship with ants. Look at some images of their flowers on [google](https://www.google.com/).
- In your `data-science` RStudio project create a new Rmd file.
- Save the new Rmd file in the "documents" folder with the name "uhuru-dataset-visualization.Rmd"
- Use markdown syntax to start a tiny description of the dataset that we will be using during class
- Finding out the working directory of our R chunks

### Reading TSV files (10 min)

- To start working with the dataset, we need to read it into R and create an object.
- Which function do we use for that?
- run `read.csv(file = "../data-raw/ACACIA_DREPANOLOBIUM_SURVEY.txt")`
- if a "read error" comes up, try the following:
  1. make sure that your data set file is in the "data-raw" folder
  1. make sure there aren't any typos in the file name
  1. make sure that your Rmd file is in the "documents" folder.
- if the "error in connection" or "error reading file persists, try using the absolute path of the file for now.
  - ⚠️ Avoid using absolute paths.
  - Using relative paths is one of the best practices for good data science.
- the data set is a "tab separated values" or TSV file.
- We need to use the argument `sep = ` from the `read.csv()` function
- run `read.csv(file = "../data-raw/ACACIA_DREPANOLOBIUM_SURVEY.txt", sep = "\t")`
- assign the output to an object called `acacia`
  - run `acacia <- read.csv(file = "../data-raw/ACACIA_DREPANOLOBIUM_SURVEY.txt", sep = "\t")`

### Data quality control check (10 min)

- what functions can we use to visually explore the structure and contents of our data set?
  - run `head(acacia)`
  - run `summary(acacia)`
  - run `View(acacia)`
- How do we know the `class` of our variables?
  - run `class(acacia)` and `typeof(acacia)`
  - run `class()` for each column in `acacia`
  - run `sapply(acacia, class)`
- Identify missing/incorrect values
- Use the `na.string = ` option from the `read.csv()` function to read the data set again and assign `NA` to missing/incorrect values
 - run `acacia <- read.csv(file = "/Users/lunasare/Desktop/data-science-course/fall-2022/data-raw/ACACIA_DREPANOLOBIUM_SURVEY.txt",
                           sep = "\t",
                           na.strings = "dead")`
- Make sure that the "HEIGHT" column is numeric
  - run `class(acacia$HEIGHT)`
  - run `class(acacia$HEIGHT) == "numeric"`
  - run `is.numeric(acacia$HEIGHT)`

### The package `ggplot2` intro (5 min)

### Basics (10 min)

### Rescaling axes (10 min)

### Grouping (10 min)

### In-class Activity:

### Statistical transformations (10 min)

### Layers (10 min)

### Changing values across layers (10 min)

### The grammar of graphics (5 min)

### Saving images (5 min)
