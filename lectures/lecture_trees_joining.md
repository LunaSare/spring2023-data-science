---
layout: page
element: lecture
title: 'Joining trees and tables'
language: R
---

## Plotting a phylogeny with the package `ggtree` (5 min)

### Installing the package `ggtree` (10 min)
- `ggtree` is an extension of the `ggplot2` package, developed specifically for phylogenetic tree visualization
- The author has made available an [extensive book with examples](https://yulab-smu.top/treedata-book/)
- `ggtree` is hosted in [Bioconductor](https://www.bioconductor.org/) (not [CRAN](https://cran.r-project.org/).
- do `length(available())` if you want to know the number of R packages available for installation, both from CRAN and Bioconductor
- "CRAN hosts over **15000 packages** and is the official repository for user contributed R packages. Bioconductor provides open source software oriented towards bioinformatics and hosts over **1800 R packages**", from [An Introduction to R](https://intro2r.com/packages.html#packages)
- [Bioconductor Vs CRAN](https://www.r-bloggers.com/2015/08/differences-in-the-network-structure-of-cran-and-bioconductor/)
![](https://revolution-computing.typepad.com/.a/6a010534b1db25970b01bb086253c2970d-800wi)
- The function `install.packages()` that we know well only workf for CRAN packages
- To install an R package from Bioconductor, use the function `install()` from the package [`BiocManager`](https://cran.r-project.org/web/packages/BiocManager/vignettes/BiocManager.html):
  1. Install `BiocManager` from CRAN with `install.packages("BiocManager")`
  2. Then install `ggtree` from Bioconductor with `BiocManager::install("ggtree")`

### Exercise 1
1. Download this [phylogenetic tree of species from the Portal Project Teaching Database]({{ site.baseurl }}/data/portal-tree.tre), by clicking on the link and saving it to your **data-raw** folder.
2. Open the file by clicking on its name on the **Files** tab of _RStudio's Plots pane_. It should look like this:
  ![]({{ site.baseurl }}/materials/portal-tree-screen-shot.png)
3. Use the main function of the package `ggtree` (it is also called `ggtree()`) to visualize `portal-tree.tre`:
```r
ggtree(portal_tree)
```
4. What differences can you note between a `ggtree()` plot and one generated with `plot.phylo()`?
<!-- https://codertsv.github.io/meeting/tutorial/how-to-plot-phylogenetic-trees-in-R/ -->
<!-- https://yulab-smu.top/treedata-book/chapter6.html#group-taxa-vis -->

## The `phylo` class structure (10 min)
- Type the name of the tree you just created and look at the output
- What information is printed to screen?
- Use functions to explore the structure of the objects you just created:
  - `class(portal_tree)`, `portal_tree` is an object of class `"phylo"`
  - `length(tree)`, it has length 4
  - `names(tree)`, and it has names
  - Just as with data frames, we can access the named elements of a `"phylo"` object using the _dollar sign_ `$`
    - `portal_tree$edge`, `class(portal_tree$edge)`
    - `portal_tree$Nnode`,
    - `portal_tree$tip.label`
    - `portal_tree$node.label`
  - `str(tree)`, shows a summary of the elements of the `"phylo"` object
  - `typeof(tree)`, the `"phylo"` class is an object of type `"list"`
<!-- - Click on the name of the object on _RStudio's Environment pane_. -->
- 🎗️ classes and types are data structures that R uses to store/extract information
- a `"list"` is a data type (or object type), that can hold one or more objects of different types.
- the class `"phylo"` is a list that combines a matrix, a numeric vector of length one and two character vectors.
<!-- http://www.phytools.org/Cordoba2017/ex/2/Intro-to-phylogenies.html#:~:text=The%20%22phylo%22%20object%20in%20R&text=The%20object%20created%20in%20memory,different%20objects%20of%20different%20types. -->
- the `"phylo"` class provides R with all the information it needs to represent a phylogenetic tree

## Connecting a phylogeny with data from a table

- Preparation:
  1. Download a data table of the species from the Portal Data base that inlcudes [taxonomy]({{ site.baseurl }}/data/portal-species-taxnomy.csv)
  2. Save it in your **data-raw** folder.
  3. Read it into R with `read.csv()`, and assign it to an object called `taxonomy`.
- To join a tree and a data table, we will use the `_join()` functions that we used previously to join tables
  - Mini review; example with `surveys` and `species`:
  ```
  species <- read.csv("../data-raw/species.csv")
  surveys <- read.csv("../data-raw/surveys.csv")
  intersect(colnames(species), colnames(surveys))
  library(dplyr)
  joined_left <- left_join(surveys, species, by = "plot_id")
  joined_inner <- inner_join(surveys, species, by = "plot_id")
  ```
  - What is the difference between `left_join` and `inner_join`?
- To link a tree and a data table, the tree has to be the first argument and the table will be second
- Also, the column that we will be joining by is always `"label"`
- Make sure there is a "label" column that has some names from your tips in your table
```r
tree_table <- left_join(portal_tree, taxonomy_matched, by= "label")
```
- What is the structure of the object?
- Attention! doing a full join does not work later down the analysis workflow, we need a left join to drop non matches
```r
full_join(portal_tree, taxonomy, by = "label")
```
- We can still plot our tree normally with `ggtree(tree_table)`
- But now we can use `aesthetics` to color some tip labels by a varianle of choice:
```r
ggtree(tree, aes(color = taxa, fontface = "italic")) + # it freezes if there are any unmatched or NA labels in data table!!!
  xlim(0, 20) +
  geom_tiplab()
```

### Exercise 2: A taxonomy table for `small_tree`

1. Find the appropriate scientific group labels for each genus in `small_tree` using [this tree as guide](https://en.wikipedia.org/wiki/Primate#Etymology).
2. Create a data frame with 3 columns:
  - a `"label"` column with the names of the tip labels of `small_tree`. Tip: extract the element `"tip.label"` from your phylo object to get a vector of tip labels that you can then join to the other vectors to create a data frame.
  - a `"taxa"` column with the scientific names of the group that each genus belongs to.
  - a `"common_name"` column with the common names of the group that each genus belongs to.
Tip: use the function `c()` to create the vectors that will be columns `"taxa"` and `"common_name"`
3. Join your tree and your table using `left_join()`.
4. Create two different tree plots using `taxa` and `common name` to color the tips of the tree.


### Exercise 3: Connecting a tree and a table for your final project
1. Connect the data table you chose for your final project to a tree with taxa on your table that you obtained from Open Tree of Life.
2. Plot the tree and color the tips following one variable on the data table.

#### Homework - Exercise 4: Mapping weight data from surveys CSV table to the portal tree (10 min)
  1. Get the average weight and hindfoot length per species.
  2. Create a new data frame that contains the taxonomy data plus the averaged data per species that you got on last question.
  3. Create two plots with data on the tips, one with the average weight and the other with average hindfoot length. Make sure to also add tip labels, formatted in italics.

-------
-------

## Creating an R package for your final project (locally)
<!-- Based on https://www.erikhoward.net/blog/how-to-create-an-r-data-package/ -->
- Creating a new R package in RStudio:
  1. File -> New Project -> New Directory -> R Package
  1. Enter a [good name](https://stackoverflow.com/questions/24201568/what-constitutes-a-good-package-name-according-to-cran) and folder for your package. I'll call mine `portalDataR`
  1. Click “Create git repository”
  1. Click “Create Project” button to create your new project

- What is an R package? A repository that contains:
  - Metadata (what is metadata) in a DESCRIPTION file
  - An R/ folder that contains R code
  - Packages can also contain data. If there’s a data/ subdirectory in the package directory, R will make any data files there available under the package namespace.

- Edit the DESCRIPTION file
  - Give your package a good `Title` and `Description`
  - Make sure you have the format for `Authors` and `Maintainer` correct. R is picky about that
  - Include which version of R your package depends on
  - If you have any entry that spans multiple lines, make sure to indent it
  - You may have to add more dependencies but since this is only a data package, R is our only dependency.

- Adding data to a package
  - The function `use_data_raw()` from the package `devtools` creates a folder where we can register the creation of our datasets
  - Create a new R script file called `data-prep.R`
  - Write down all the code to read the data into R
  - Save the data in R format using `devtools::use_data(YOUR_DATA_OBJECT_NAME, overwrite = TRUE)`
  - This function creates `RData` files in the `data/` folder and overwrites any pre-existing files.

- Documenting the data
- Adding a vignette
<!--
Creating a website using blogdown
https://www.shilaan.com/post/building-your-website-using-r-blogdown/
-->
