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
- Which function do we use for that?
  - `read.csv()`
- Use `read,csv()` to read the file "ACACIA_DREPANOLOBIUM_SURVEY.txt" that you saved in the "data-raw" folder
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

- "grammar of graphics plot"
- uses a more "natural" way of creating plots by describing what you want, not how to build it
- we construct graphs by addibg layers of graphical elements, instead of modifying the whole code
- install the package
- load the package
- the function `ggplot()` creates a base "ggplot" object that we can then add things to
- it worls like a blank canvas
- The two main arguments we will use for the function `ggplot()` are:
  - `data = ` assigns the the name of the data frame we want to plot
  - `mapping =` assign columns from the data that we want to plot on each axis
- the `aes()` function is used within the option `mapping = `
  - For example, to plot the relationship between the circumference and the height of the trees, we assign the circumference column "CIRC" to the x axis and the height column "HEIGHT" to the y axis as follows:
```
ggplot(data = acacia, mapping = aes(x = CIRC, y = HEIGHT))
```

### A scatter plot (10 min)

- Once we haave the base layer, we can start adding points
  1. Then, use the ` + ` sign to add the next layer
  1. It is standard to hit "Enter" after the plus so that each layer shows up on its own line
  1. to add a scatter plot we use the function `geom_point()`
```
ggplot(data = acacia, mapping = aes(x = CIRC, y = HEIGHT)) +
  geom_point()
```
- We can change the look of the scatter plot using arguments from the `geom_point()` function:
  - the shae of the points is determined by the `shape = ` argument.
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

### In-class Activity:

- Read the metadata for the research paper from Kartzinel et al. 2014, [Plant and small-mammal responses to large-herbivore exclusion in an African savanna: five years of the UHURU experiment](https://esapubs.org/archive/ecol/E095/064/metadata.php), published in the journal [Ecology](https://esajournals.onlinelibrary.wiley.com/doi/10.1890/13-1023R.1).

![]({{ site.baseurl }}/materials/metadata.png)
- In your Rmd document, create an introductory section to your dataset
- Describe the experiment and its goal using the images
- Describe the different variables that were measured
- Add some images of the different metadata
- add the corresponding units to the axis labels in your plots
- Look at the graph colored by treatment, what is the influence of experimental treatment?
- What happened to the acacias in the open plots?
- render to pdf
- add, commit and push the Rmd and the PDF files

---
---

## Day 2

### Introduction (5 min)

- We are working on the Rmd file uhuru-dataset-visualization.Rmd
 - all code and writing should be added there 
- reviewing and explaining stuff I missed from day 1
  - working directory in an r chink is not the same as a project working directory
  - change absolute paths to relative paths
  - shape argument in `geom_point()`,
  - shape numbers with `?pch`
  - subplots with `facet_wrap()`

### In-class Activity (5 min)

- Add some interpretations to your plots
- render to PDF

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

### In-class exercises:

Exercise 1. Scatterplots
<!-- https://github.com/datacarpentry/semester-biology/blob/main/exercises/Graphing-acacia-ants-R.md -->

1. Make a scatter plot with `CIRC` on the x axis and `AXIS1` (the maximum canopy
   width) on the y axis. Label the x axis "Circumference" and the y axis "Canopy
   Diameter".
2. The same plot as (1), but with both axes scaled logarithmically (using `scale_x_log10` and `scale_y_log10`).
3. The same plot as (1), but with points colored based on the `ANT` column (the species of ant symbiont living with the acacia)
4. The same plot as (3)), but instead of different colors show different species of ant (values of `ANT`) each in a separate subplot.
5. The same plot as (4) but add a simple model of the data by adding `geom_smooth`.

Exercise 2. Histograms
<!-- https://github.com/datacarpentry/semester-biology/blob/main/exercises/Graphing-acacia-ants-histograms-R.md -->

1. Make a bar plot of the number of acacia with each mutualist ant species (using the `ANT` column).
2. Make a histogram of the height of acacia (using the `HEIGHT` column). Label
   the x axis "Height (m)" and the y axis "Number of Acacia".
3. Make a plot that shows histograms of both `AXIS1` and `AXIS2`. Due to the way
   the data is structured you’ll need to add a 2nd geom_histogram() layer that
   specifies a new aesthetic. To make it possible to see both sets of bars
   you’ll need to make them transparent with the optional argument alpha = 0.3.
   Set the color for `AXIS1` to "red" and `AXIS2` to "black" using the `fill`
   argument. Label the x axis "Canopy Diameter(m)" and the y axis "Number of Acacia".
4. Use `facet_wrap()` to make the same plot as (3) but with one subplot for each
   treatment. Set the number of bins in the histogram to 10.

### Home exercises:

Exercise 3.
<!-- https://raw.githubusercontent.com/datacarpentry/semester-biology/main/exercises/Graphing-acacia-ants-data-manip-R.md -->

0. Download the file [TREE_SURVEYS.txt]() and save it to your "data-raw" folder
0. Read the file with the function `read_tsv` from the package `readr` and assign it to an object called `trees`
```r
trees <- read_tsv("TREE_SURVEYS.txt",
                  col_types = list(HEIGHT = col_double(),
                                   AXIS_2 = col_double()))
```
1. Add a new column to the `trees` data frame that is named `canopy_area` and contains
   the estimated canopy area calculated as the value in the `AXIS_1` column
   times the value in the `AXIS_2` column.
1. Subset the `trees` data frame with just the `SURVEY`, `YEAR`, `SITE`, and `canopy_area` columns.
2. Make a scatter plot with `canopy_area` on the x axis and `HEIGHT` on the y
   axis. Color the points by `TREATMENT` and plot the points for each value in
   the `SPECIES` column in a separate subplot. Label the x axis "Canopy Area
   (m)" and the y axis "Height (m)". Make the point size 2.
3. That's a big outlier in the plot from (2). 50 by 50 meters is a little too
   big for a real Acacia, so filter the data to remove any values for `AXIS_1`
   and `AXIS_2` that are over 20 and update the data frame. Then remake the graph.
4. Using the data without the outlier (i.e., the data generated in (3)),
   find out how the abundance of each species has been changing through time.
   Use `group_by`, `summarize`, and `n` to make a data frame with `YEAR`,
   `SPECIES`, and an `abundance` column that has the number of individuals in
   each species in each year. Print out this data frame.
5. Using the data the data frame generated in (4),
   make a line plot with points (by using `geom_line` in addition to
   `geom_point`) with `YEAR` on the x axis and `abundance` on the y axis with
   one subplot per species. To let you seen each trend clearly let the scale for
   the y axis vary among plots by adding `scales = "free_y"` as an optional argument to `facet_wrap`.

Exercise 4.
<!-- https://github.com/datacarpentry/semester-biology/blob/main/exercises/Graphing-data-from-multiple-tables-R.md -->

We want to compare the circumference to height relationship in acacia and to the same relationship for trees in the region. These data are stored in two different tables. Make a graph with the relationship between `CIRC` and `HEIGHT` for the trees as gray circles in the background and the same relationship for acacia as red circles plotted on top of the gray circles. Scale both axes logarithmically. Inlude linear models for both sets of data. Provide clear labels for the axes.
