---
layout: page
element: lecture
title: 'Visualizing data'
language: R
pagetype: lecture
symbol: <i class="fa fa-comment fa-lg"></i>
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

[Visualising Data guide]({{ site.baseurl }}/materials/05_Data_visualization/05_Data_visualization.html)

## Day 1

### Class set up (5 min)

- Open your `data-science` RStudio project
- make sure that everything is up to date from the remote and that you have pushed all previous changes.
- make sure that your working directory is set up correctly to the root of the project with `getwd` and `setwd`
- Make sure that you have a "documents" folder. All your Rmd files will go in there.

### Intro to the working dataset and class set up (15 min)

- For the data visualization class, we will be working with the "UHURU" dataset, that was published in 2014 in the journal of Ecology, in a paper entitled [Plant and small-mammal responses to large-herbivore exclusion in an African savanna: five years of the UHURU experiment](https://esajournals.onlinelibrary.wiley.com/doi/10.1890/13-1023R.1).
- All information about the UHURU data set is available on its [metadata description](https://esapubs.org/archive/ecol/E095/064/metadata.php).
- Go to the images available in the metadata description.
  - Instructor verbally describes the experiment and its goal using the images
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
- To read tables into R we use the function `read.csv()`
- Use `read.csv()` to read the file "ACACIA_DREPANOLOBIUM_SURVEY.txt" that you saved in the "data-raw" folder
  - run `read.csv(file = "../data-raw/ACACIA_DREPANOLOBIUM_SURVEY.txt")`
  - if a "read error" comes up, try the following:
    1. make sure that your data set file is in the "data-raw" folder
    1. make sure there aren't any typos in the file name
    1. make sure that your Rmd file is in the "documents" folder.
  - if the "error in connection" or "error reading file persists, try using the absolute path of the file for now. But keep in mind:
    - ⚠️ Avoid using absolute paths as much as possible!
    - Using relative paths is one of the best practices for good data science.
- When the code runs correctly, what does the output look like?
  - we do not get a table
  - values are separated by the characters "\t" and not commas ","
- "\t" is how we indicate a Tab character in programming
- the data set is a "tab separated values" or TSV file.
- `read.csv()` read CSV files by default
- to read TSV files we need to use the argument `sep = ` in the `read.csv()` function
- run `read.csv(file = "../data-raw/ACACIA_DREPANOLOBIUM_SURVEY.txt", sep = "\t")`
  - does the output look like a table now?
- assign the output to an object called `acacia`
  - run `acacia <- read.csv(file = "../data-raw/ACACIA_DREPANOLOBIUM_SURVEY.txt", sep = "\t")`

### Data quality control check (10 min)

- what functions can we use to visually explore the structure and contents of our data set?
  - run `head(acacia)` to see the first 6 rows and all columns
  - run `summary(acacia)` to see a summary of data from each column
  - run `View(acacia)` to see the whole table
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

### Intro to the package `ggplot2` (10 min)

- "ggplot" stands for "grammar of graphics plot"
- uses a more "natural" way of creating plots by describing what you want, not how to build it
- we construct graphs by adding layers of graphical elements, instead of modifying the whole code
- install the package with `install.packages()`
- load the package with `library()`
- the function `ggplot()` creates a base "ggplot" object that we can then add things to
- it works like a blank canvas
- The two main arguments we will use for the function `ggplot()` are:
  - `data = ` assigns the the name of the data frame we want to plot
  - `mapping =` assign columns from the data that we want to plot on each axis
- the `aes()` function is used within the option `mapping = `
  - For example, to plot the relationship between the circumference and the height of the trees, we assign the circumference column "CIRC" to the x axis and the height column "HEIGHT" to the y axis as follows:
```
ggplot(data = acacia, mapping = aes(x = CIRC, y = HEIGHT))
```

### A scatter plot (10 min)

- Once we have the base layer, we can start adding points
  1. Then, use the ` + ` sign to add the next layer
  1. It is standard to hit "Enter" after the plus so that each layer shows up on its own line
  1. to add a scatter plot we use the function `geom_point()`
```
ggplot(data = acacia, mapping = aes(x = CIRC, y = HEIGHT)) +
  geom_point()
```
- We can change the look of the scatter plot using arguments from the `geom_point()` function:
  - the shape of the points is determined by the `shape = ` argument.
  - the size of the points is determined by the argument `size = `.
    - Small numbers like `1` or `2` will plot small points.
    - Large numbers like `10` or `11` will plot larger points.
    - You can give decimal numbers, like `0.1` to plot really small points, or give really large numbers, like `150`, to plot super big points.
  - the color of the points is determined by the argument `color = `.
    - Colors should be written as a character vector. For example, `"blue"` will plot blue points.
    - For a list of in-built R colors, run the function `colors()`
  - the transparency of the points, which is called alpha, is determined by the argument `alpha = `
    - transparency goes from 0 to 1, 0 being the most transparent and 1 being the most solid.
    - a transparency of `0.5` will plot points that have a medium transparency.
```
ggplot(data = acacia, mapping = aes(x = CIRC, y = HEIGHT)) +
  geom_point(size = 3, color = "blue", alpha = 0.5)
```

### Adding labels (5 min)

- to add labels and a title to our plot, we use the `labs()` function:
```
ggplot(data = acacia, mapping = aes(x = CIRC, y = HEIGHT)) +
  geom_point(size = 3, color = "blue", alpha = 0.5) +
  labs(x = "Circumference", y = "Height",
       title = "Acacia Survey at UHURU")
```


### Grouping: Plotting data by another variable (10 min)

- For example, what if we want to see the effect of the experimental treatment (stored in the column "TREATMENT")
- we have two main ways to group data by a third variable:
  1. plot data on the same graph, but using different colors for each value from the third variable
   - we will remove the argument `color = ` from `geom_point()`
   - then we will add the argument `color = ` to our first layer, inside `ggplot()`
   - there we will provide the name of the third variable as option:   
```
ggplot(acacia, aes(x = CIRC, y = HEIGHT, color = TREATMENT)) +
  geom_point(size = 3, alpha = 0.5)
```
  1. plot data on a subplot for each value from the third variable, with no color:
```
ggplot(acacia, aes(x = CIRC, y = HEIGHT)) +
  geom_point(size = 3, alpha = 0.5) +
  facet_wrap(~TREATMENT)
```
  or with color:
  ```
  ggplot(acacia, aes(x = CIRC, y = HEIGHT, color = TREATMENT)) +
    geom_point(size = 3, alpha = 0.5) +
    facet_wrap(~TREATMENT)
  ```

### In-class Activity/Homework (10 min)

- [The UHURU data set]({{ site.baseurl }}/assignments/exercises/week7-uhuru-dataset-r)

<!-- {{ site.baseurl }}/assignments/exercises/week7-uhuru-dataset-r.md -->

---
---

## Day 2

### Introduction (30 min)

- We are working on the Rmd file "uhuru-dataset-visualization.Rmd"
 - all code and writing should be added there
  - working directory in an R code chunk is not the same as a project working directory
  - make sure you are using relative paths (never use absolute paths)
  - shape argument in `geom_point()`,
  - the function `color()`
  - shape numbers with `?pch`
  - subplots with `facet_wrap()`

### Rescaling axes (5 min)
- We can transform the scale of the axes in many ways
- This does not change the data itself, just the presentation of it
- to do a log 10 rescale of our axis, we use the functions `scale_x_log10()` and `scale_y_log10()`
```
ggplot(data = acacia, mapping = aes(x = CIRC, y = HEIGHT)) +
  geom_point(size = 3, color = "blue", alpha = 0.5) +
  scale_y_log10() +
  scale_x_log10()
```

### Fitting linear models (10 min)

- the `geom_smooth()` function allows finding trends in our data
```
ggplot(acacia, aes(x = CIRC, y = HEIGHT)) +
  geom_point(size = 3, alpha = 0.5) +
  geom_smooth()
```
- we can group by treatment and fit a linear model to each grouped
- what happens when we fit a linear model to data grouped by treatment?
```
ggplot(acacia, aes(x = CIRC, y = HEIGHT, color = TREATMENT)) +
  geom_point(size = 3, alpha = 0.5) +
  geom_smooth()
```
- use the argument `linetype = ` to assign different lines by treatment
```
ggplot(acacia, aes(x = CIRC, y = HEIGHT, color = TREATMENT, linetype = TREATMENT)) +
  geom_point(size = 3, alpha = 0.5) +
  geom_smooth()
```
- use the argument `method = ` from the function `geom_smooth()` to assign a specific method for model fitting
```
ggplot(acacia, aes(x = CIRC, y = HEIGHT, color = TREATMENT)) +
  geom_point(size = 3, alpha = 0.5) +
  geom_smooth(method = "lm") # try with "glm"
```

### Data distribution: Histograms and bar plots (10 min)

- Function `geom_bar()` creates bar plots and can be used for categoric or discrete variables
- Create a bar plot of number of plants for each treatment:
```
ggplot(data = acacia, mapping = aes(x = TREATMENT)) +
  geom_bar()
```  
- Function `geom_histogram()` creates histograms and can only be used for continuous variables
- you can define the number of bins with `bins = ` and the bin width with `binwdth = `
- the `fill = ` argument allows defining the color inside the bars
- Let's show the distributon of circumference values with red colored bars:
```
ggplot(acacia, aes(x = CIRC)) +
  geom_histogram(fill = "red")
```
- Now show the proportion of data colored by treatment
```
ggplot(acacia, aes(x = CIRC, color = TREATMENT)) +
  geom_histogram(bins = 20)
```
- Or use the treatment data to assign a fill color with a gray outline:
```
ggplot(acacia, aes(x = CIRC, fill = TREATMENT)) +
  geom_histogram(bins = 20, color = "gray")
```

### Layering multiple data (10 min)

- To plot different data or variables on the same plot, we can change these values across layers
```
ggplot() +
  geom_point(data = acacia,
             mapping = aes(x = CIRC, y = HEIGHT,
                           color = TREATMENT)) +
  geom_smooth(data = acacia,
              mapping = aes(x = CIRC, y = HEIGHT))
```
- we can even plot categorical and continuous data on the same plot:
```
ggplot() +
  geom_point(data = acacia,
             mapping = aes(x = CIRC, y = HEIGHT,
                           color = TREATMENT)) +
  geom_smooth(data = acacia,
              mapping = aes(x = CIRC, y = HEIGHT)) +
  geom_histogram(data = acacia,
                 mapping = aes(x = CIRC, color = TREATMENT),
                 alpha = 0.1)
```
- We can plot data from two different columns as Y or X, by adding a layer and changing the corresponding value in the aesthetic
- We can use data from two different data sets by changing the value of `data = `
- as you can see we can combine all tools and use them in any "`geom_`" function in different ways!

### Saving plots as image files (5 min)

- We will use the function `ggsave()`
- `filename =` is its main argument. It indicates:
  - the path where the image will be saved
  - the name that we want to give to the saved image
  - the type of file we will save given as an extension (.pdf, .jpg, .png)
- You run this function after you have run all the code to create your plot
```
ggsave("acacia_by_treatment.jpg")
```
- other arguments that you may use control the size of the image in inches:
```
ggsave("acacia_by_treatment.pdf", height = 5, width = 5)
```

### In-class Activity (20 min)

- [Acacia and ants]({{ site.baseurl }}/lectures/in-class-visualizing-uhuru/)

**A minute feedback for class 13**

- Please provide some quick feedback for this session [here]({{ site.feedback.class13 }})

### Home exercises (20 min)

- [Acacia Vs trees]({{ site.baseurl }}/exercises/homework_visualizing/)
