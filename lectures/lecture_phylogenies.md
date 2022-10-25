---
layout: page
element: lecture
title: 'Phylogenetic trees'
language: R
---
> **Learning Objectives**
> This week, students will learn to:
> - read phylogenies into R.
> - plot phylogenies
> - know the 4 main parts of a phylo object
> - know lists and classes as data structures.
> - obtain phylogenetic data from the Open Tree of Life
> - date phylogenies using data from the Open Tree of Life
>
> **Practice Objectives**
> -
>
> **Non Objectives**
> - simulate simple phylogenies in R.
>

## Day 1: Reading and plotting phylogenies

### Setup your RStudio project (5 min)

- 🎗️ Structuring your files into a _project_ is a best practice for good data science!
- Open your _RStudio project_ for the class; I called mine "**fall-2022**".
- Open a new Rmd file, name it "**portal-phylogenies.Rmd**", and save it to your "**documents**" folder.

### The newick format

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


### Read a phylogeny into R

- the function `read.tree()` from the package `ape`
  - `install.packages("ape")`
- To read a phylogeny from a newick file in your computer, provide the path and file name
  - 🎗️ Use relative paths!
```
ape::read.tree("relative/path/newick-file-name.tre")
```
- To read a phylogeny from a URL address:
  - Go to `ape`'s [book website](http://ape-package.ird.fr/APER.html) and copy the link to **primfive.tre**
  - Provide the URL address as a character vector:
  ```
  ape::read.tree("url.adress/file.tre")
  ```
- Exercise:
  - Read into R the newick tree in the file **"portal-tree.tre"**, create an object named `portal_tree`.
  ```
  portal_tree <- read.tree(file = "../data-raw.portal-tree.tre")
  ```
  - Read into R the newick tree from URL **"http://ape-package.ird.fr/APER/APER2/primfive.tre"**, create an object named `small_tree`.
  ```
  small_tree <- read.tree(file = "http://ape-package.ird.fr/APER/APER2/primfive.tre")
  ```
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

### Plot a phylogeny with the package `ape`

- `plot.phylo()` function from the package [`ape`](http://ape-package.ird.fr/#:~:text=ape%20is%20a%20package%20written,development%20of%20new%20analytical%20methods.):
```
plot.phylo(portal_tree)
plot.phylo(small_tree)
```
- the name of the package `ape` is an acronym that stands for _Analysis of Phylogenetics and Evolution_
- it was mainly developed for the analysis of molecular sequences
- plotting phylogenies with `ape` requires [a lot of customization](http://ape-package.ird.fr/misc/DrawingPhylogenies.pdf)

![](http://ape-package.ird.fr/APER/APER2/APER2_cover.jpg)
![](http://ape-package.ird.fr/video/bdna.webm)

### Plot a phylogeny with the package `ggtree`

- the package [`ggtree`](https://yulab-smu.top/treedata-book/)
- An extension of the `ggplot2` package, developed specifically for phylogenetic tree visualization
- It is hosted in [Bioconductor](https://www.bioconductor.org/) (not [CRAN](https://cran.r-project.org/).
- do `length(available())` if you want to know the number of R packages available for installation, both from CRAN and Bioconductor
- "CRAN hosts over **15000 packages** and is the official repository for user contributed R packages. Bioconductor provides open source software oriented towards bioinformatics and hosts over **1800 R packages**", from [An Introduction to R](https://intro2r.com/packages.html#packages)
- [Bioconductor Vs CRAN](https://www.r-bloggers.com/2015/08/differences-in-the-network-structure-of-cran-and-bioconductor/)
![](https://revolution-computing.typepad.com/.a/6a010534b1db25970b01bb086253c2970d-800wi)
- the function `install()` from the package [`BiocManager`](https://cran.r-project.org/web/packages/BiocManager/vignettes/BiocManager.html) installs Bioconductor packages
  - `install.packages("BiocManager")`
  - `BiocManager::install("ggtree")`
- The main function to visualize trees is also called `ggtree()`
```
ggtree(portal_tree)
```

- It is a wrapper of
```
ggplot(tree, aes(x, y)) +
  geom_tree() +
  theme_tree()
```

- `ggtree` also uses the _plus_ symbol `+` to add layers

### Display a scale
- the function `geom_treescale()`
```
ggtree(portal_tree) +
  geom_treescale()
```
```
ggtree(small_tree) +
  geom_treescale()
```

### Get branch lengths

```
branching.times(small_tree)
```


### Add tip and node labels

- The function `geom_tiplab()`
  - the `fontface = ` argument
```
ggtree(portal_tree) +
  geom_tiplab(size = 3, color = "purple", fontface = 3) # or fontface = "italic"
```
- Specify limits of the x axis to add space for tip labels
```
... + xlim(NA,20)
```
- The function `geom_nodelab()`
```
ggtree(portal_tree) +
  geom_nodelab(size = 3, color = "blue")
```

### Remove singleton nodes
-
```
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


### Exercise 1: A phylogeny for a sample of amniotes

1. Write the necessary code to modify at least **three** of the node labels from `portal_tree` that are not empty, replacing them by their common names.
2. Plot the `portal_tree` with node labels using the common names. Include tip labels in italics.
3. Use the function `ggsave()` to save the plot in PNG format into the **figures** folder.

<!-- https://educalingo.com/en/dic-fr/amniote -->

![](https://static.educalingo.com/img/fr/800/amniota.jpg)

### Add node labels

- The phylo object `small_tree` has no node labels
```
small_tree$node.label
```
- To add the position of the node as node label:
```
ggtree(small_tree) +
  geom_tiplab(size=3, color="purple", fontface = "italic") +
  xlim(NA,1.5) +
  geom_nodelab(aes(label = node), geom = "label")
```


### Exercise 2: The phylogeny of primates

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


---
---

## Day 2: Joining phylogenies to data tables

### Data table of taxonomy

### Get a phylogeny for a group of species names

- `install.packages("rotl")`
- The Open Tree of Life
