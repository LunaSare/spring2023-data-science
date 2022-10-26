---
layout: page
element: lecture
title: 'Phylogenetic trees'
language: R
---
> **Learning Objectives**
> This week, students will:
> - work with newick Files
> - learn to read phylogenies into R.
> - access and list the elements of a `phylo` object
> - understand the relationship between lists and the `phylo` class as data structures.
> - plot phylogenies with `ape::plot.phylo()` and `ggtree::ggtree()`
> - customize phylogenetic plots with `ggtree::ggtree()`
> - obtain phylogenetic data from the Open Tree of Life
> - get dated phylogenies using `datelife`
>
> **Practice Objectives**
> - Exploring the structure of an object
>
> **Non Objectives**
> - simulate phylogenies
> - plot phylogenies with `ape`

## Day 1: Reading and plotting phylogenies

### Setup your RStudio project (5 min)

- 🎗️ Structuring your files into a _project_ is a best practice for good data science!
- Open your _RStudio project_ for the class; I called mine "**fall-2022**".
- Open a new Rmd file, name it "**portal-phylogenies.Rmd**", and save it to your "**documents**" folder.

### The newick format (10 min)

- Download this [phylogenetic tree of species from the Portal Project Teaching Database]({{ site.baseurl }}/data/portal-tree.tre), by clicking on the link and saving it to your **data-raw** folder.
- Open the file by clicking on its name on the **Files** tab of _RStudio's Plots pane_. It should look like this:

![]({{ site.baseurl }}/materials/portal-tree-screen-shot.png)

- This is a newick file!
  - It is a text file that represents a phylogenetic tree
  - this format allows a computer to read the tree easily: it is in computer-readable form
  - each pair of _matched parenthesis_ `( )` represents an inner node
  - _character strings_ (names) within parentheses represent a tip
  - a _comma_ `, ` separates nodes and tips, and represents a lineage
  - the _semicolon_ `; ` represents the end of the tree
- ⚠️ The existence of the newick format is very important because we can't (yet) analyse data using a computer (either from tables or trees) if it is in image (png, jpg, pdf, etc.) format.

### The package `ape` (5 min)

- the name of the package `ape` is an acronym that stands for _Analysis of Phylogenetics and Evolution_
- it was mainly developed for the analysis of molecular sequences
- `install.packages("ape")`

![](http://ape-package.ird.fr/APER/APER2/APER2_cover.jpg)
![](http://ape-package.ird.fr/video/bdna.webm)

### Read a phylogeny into R (10 min)

- `read.tree()` function from the package `ape`
- Usage to read a phylogeny from a newick file in your computer:
  - provide the path and file name
  - 🎗️ Use relative paths!
  ```
  ape::read.tree("relative/path/newick-file-name.tre")
  ```
- Usage to read a phylogeny from a URL address:
  - Provide the URL address as a character vector:
  ```
  ape::read.tree("url.adress/newick-file-name.tre")
  ```
- Example:
  - Read into R the newick tree in the file **"portal-tree.tre"**
  - create an object named `portal_tree`:
  ```
  portal_tree <- read.tree(file = "../data-raw.portal-tree.tre")
  ```
  - Read into R the newick tree from URL **"http://ape-package.ird.fr/APER/APER2/primfive.tre"**,
  - To copy the URL, go to `ape`'s [book website](http://ape-package.ird.fr/APER.html) and copy the link to **primfive.tre**
  - create an object named `small_tree`:
  ```
  small_tree <- read.tree(file = "http://ape-package.ird.fr/APER/APER2/primfive.tre")
  ```

### The `phylo` class structure (10 min)

_Compare all outputs as applied to a data frame, such as `surveys <- read.csv("../data-raw/surveys.csv")`_
- Type the name of the objects you just created and look at the output
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

### Plot a phylogeny with the package `ape` (5 min)

- `plot.phylo()` function from the package [`ape`](http://ape-package.ird.fr/#:~:text=ape%20is%20a%20package%20written,development%20of%20new%20analytical%20methods.):
```
plot.phylo(portal_tree)
plot.phylo(small_tree)
```
- plotting phylogenies with `ape` requires [a lot of customization](http://ape-package.ird.fr/misc/DrawingPhylogenies.pdf).
- we will not cover that in this course,

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

### Plot a phylogeny with the package `ggtree` (5 min)

- The main function to visualize trees is also called `ggtree()`:
```r
ggtree(portal_tree)
```

- It is a wrapper of:
```r
ggplot(tree, aes(x, y)) +
  geom_tree() +
  theme_tree()
```

- `ggtree` -- as `ggplot`, uses the _plus_ symbol `+` to add plotting layers.

### Display a scale (5 min)

- Use the function `geom_treescale()`
```r
ggtree(portal_tree) +
  geom_treescale()
```

### Exercise 1 (10 min)

- Plot the small tree of five species of primates and include a scale.
- What is the difference in terms of data structure between the two trees?
```r
ggtree(small_tree) +
  geom_treescale()
```
- Trees differ in number of tips (43 vs 5)
```r
length(portal_tree$tip.label)
length(small_tree$tip.label)
```
- Thay also differ in that `small_tree` has no node labels, but it has an `"edge.length"` element that `portal_tree` does not have.
- This is where branch length data is stored

A mouse lemur (Primates)             |  A kangaroo rat (Rodentia)
:-----------------------------------:|:-------------------------:
![](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShfK5NkjsPH7HwiF7KLNm-auSVcmdL73qabg&usqp=CAU) | ![](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSw0pkznjKJc3xnIOEN4JtepLLJkskifCnjPA&usqp=CAU)

### Branch lengths (5 min)

- data in `"edge.length"` is used to plot the timescale in the `small_tree` visualization
- how is the timescale calculated in trees with no `"edge.length"`?
- Get branching times with `branching.times(small_tree)`


### Add tip labels (5 min)

- Use the function `geom_tiplab()`
- the `fontface = ` argument allows plotting species names in italics
```r
ggtree(portal_tree) +
  geom_tiplab(size = 3, color = "purple", fontface = 3) # or fontface = "italic"
```

- If tip labels are truncated, give more plotting space with the function `xlim()`
- `xlim()` requires two numbers, start and end of x axis. Giving an `NA` will let R choose the default xlim:
```r
... +
  xlim(NA,20)
```

### Exercise 2 (5 min)

- Plot the small tree of five species of primates; include a scale, and tip labels.
- Use the function `branching_times()` to set up an appropriate limit for the x axis, so tips are fully displayed (not truncated).

<!-- Genus _Homo_   | _Pongo_ | _Macaca_ | _Ateles_ | _Galago_
:-------------:|:-------:|:--------:|:--------:|:---------:
![](https://cdn.mos.cms.futurecdn.net/oXMefWEmiLfPBSjteR78qD.jpg) | ![]() | ![]() | ![]() |  -->

![](http://www.zooborns.com/.a/6a010535647bf3970b01675f4e9c38970b-500wi)


---
---

## Day 2: Joining phylogenies to data tables

### The structure of a phylogenetic tree

![](https://slideplayer.com/slide/3369393/12/images/7/Branch+Length+%28Distance%29+~+Time.jpg)

### Add node labels (20 min)

- The function `geom_nodelab()`
```r
ggtree(portal_tree) +
  geom_nodelab(size = 3, color = "blue")
```

### Remove singleton/redundant nodes
-
```r
has.singles(portal_tree)

has.singles(small_tree)

portal_tree <- collapse.singles(portal_tree)

has.singles(portal_tree)

ggtree(portal_tree) +
  geom_nodelab(size = 3, color = "blue")
```

### Customize node labels
- We can change labels (and any value, really) on a `"phylo"` object in the same way we access vectors and data frames
- Clean node labels from the `portal_tree`
  1. Extract the vector of node labels
  ```
  node_labels <- portal_tree$node.label
  ```
  2. Use the function `grep()` to get the numeric index of unnamed nodes (nodes that start with `"mrcaott"`)
  ```
  unnamed_nodes_position <- grep("mrcaott", node_labels)
  ```
  3. Check that it worked:
  ```
  node_labels[unnamed_nodes_position] %>%
    head()
  unnamed_nodes_position %>%
    head()
  node_labels[7]
  node_labels[9]
  node_labels[11]
  node_labels[12]
  node_labels[13]
  node_labels[14]
  ```
  4. Overwrite unnamed nodes with an empty string,
    - first one by one
    ```
    head(node_labels, n = 10)
    node_labels[7] <- ""
    head(node_labels, n = 10)
    node_labels[9] <- ""
    head(node_labels, n = 10)
    ```
    - overwrite all at once:
    ```
    node_labels[unnamed_nodes_position] <- ""
    node_labels
    ```
  5. Overwrite the `"node.label"` element of `portal_tree`
  ```
  portal_tree$node.label <- node_labels
  portal_tree$node.label
  ```


### Exercise 3: A phylogeny for a sample of amniotes

1. Write the necessary code to modify at least **three** of the node labels from `portal_tree` that are not empty, replacing them by their common names.
2. Plot the `portal_tree` with node labels using the common names. Include tip labels in italics.
3. Use the function `ggsave()` to save the plot in PNG format into the **figures** folder.

<!-- https://educalingo.com/en/dic-fr/amniote -->

![](https://static.educalingo.com/img/fr/800/amniota.jpg)

### Add node labels

- We already know that `small_tree` has no node labels, but we can verify:
```r
small_tree$node.label
```
- To use the position of a node as node label:
```r
ggtree(small_tree) +
  geom_tiplab(size=3, color="purple", fontface = "italic") +
  xlim(NA,1.5) +
  geom_nodelab(aes(label = node), geom = "label")
```


### Exercise 4: Positioning node labels

1. The phylo object `small_tree` has no node labels:
  - Find the appropriate node labels using [this tree as guide](https://en.wikipedia.org/wiki/Primate#Etymology)
  - Create a character vector with the node labels, pay attention to the order
  - Add the vector of node labels to `small_tree`, make sure it is names `"node.label"`
2. Plot `small_tree` with node labels using scientific names. Include tip labels in italics.
3. Use the function `ggsave()` to save the plot in PNG format into the **figures** folder.

<!-- https://educalingo.com/en/dic-fr/amniote -->

![](https://static.educalingo.com/img/fr/800/amniota.jpg)




### Tree layouts

- The argument `layout = `
```
ggtree(portal_tree, layout="roundrect")
```

- Exercise: Try the following layouts on your tree of Portal species:
```
ggtree(portal_tree, layout="slanted")
ggtree(portal_tree, layout="ellipse")
ggtree(portal_tree, layout="circular")
ggtree(portal_tree, layout="fan", open.angle=120)
ggtree(portal_tree, layout="fan", open.angle=15)
ggtree(portal_tree, layout="equal_angle")
ggtree(portal_tree, layout="daylight")
```

### Subplots
<!-- https://yulab-smu.top/treedata-book/chapter12.html -->
- package `aplot`
```
install.packages("aplot")
```
- usage of function `plot_list()`:
```
plot_list(plot1, plot2, tag_levels = "A")
```
- Example with option `tag_levels =`
```
plot_list(ggtree(portal_tree, layout="circular"),
          ggtree(portal_tree, layout="fan", open.angle=15),
          tag_levels = "A")
```
- Example with option `labels =`
```
plot_list(ggtree(portal_tree, layout="circular"),
          ggtree(portal_tree, layout="fan", open.angle=15),
          labels = c("Circular", "Fan"))
```

### Formatting tip labels

- If you want to replace the underscore in the name by a white space:
```r
clean_labels <- gsub("_", " ", portal_tree$tip.label)
```

### Data table of taxonomy

https://codertsv.github.io/meeting/tutorial/how-to-plot-phylogenetic-trees-in-R/
https://yulab-smu.top/treedata-book/chapter6.html#group-taxa-vis

### Get a phylogeny for a group of species names

- `install.packages("rotl")`
- The Open Tree of Life
