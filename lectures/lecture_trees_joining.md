---
layout: page
element: lecture
title: 'Joining trees and tables'
language: R
---

## Homework Review

1. Extract the OTT id of a biological group using the function `tnrs_match_names()`.
2. Get a subtree from the group using its OTT id.
3. If you get an error, try with a different group until you get a subtree from Open Tree
4. Plot your subtree

## Working with non-monophyletic taxa

- Example: a subtree of the genus _Canis_
- Finding "broken" and "invalid" taxa with `is_in_tree()`
- Getting the MRCA of a taxon with `tol_node_info()`
- Getting a subtree using a node id instead of the taxon OTT id with `tol_subtree(node_id = MY NODE ID)`

## Getting an induced tree from Open Tree of Life

- Get an induced subtree for a set of taxa and plot it with `tol_induced_subtree()`
- Example: Get an induced tree for the 3 orders of amphibians
- For families:
  ```
  amphibia_families <- datelife::get_ott_children(ott_ids = resolved_names["Amphibia",]$ott_id, ott_rank = "family")
  ```

## Installing the package `ggtree` (10 min)

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
ggtree(opentree_tree)
```

## Connecting a phylogeny with data from a table

- Preparation:
1. Download a data table of the species from the Portal Data base that inlcudes [taxonomy]({{ site.baseurl }}/data/portal-species-taxnomy.csv)
2. Save it in your **data-raw** folder.
3. Read it into R with `read.csv()`, and assign it to an object called `taxonomy`.
4. Download this [phylogenetic tree of species from the Portal Project Teaching Database]({{ site.baseurl }}/data/portal-tree.tre), by clicking on the link and saving it to your **data-raw** folder.
5. Open the file by clicking on its name on the **Files** tab of _RStudio's Plots pane_. It should look like this:

![]({{ site.baseurl }}/materials/portal-tree-screen-shot.png)

<!-- https://codertsv.github.io/meeting/tutorial/how-to-plot-phylogenetic-trees-in-R/ -->
<!-- https://yulab-smu.top/treedata-book/chapter6.html#group-taxa-vis -->

- To join a tree and a data table, we will use the `_join()` functions that we used previously to join tables
- How do they work? Example with `surveys` and `species`.
- To link a tree and a data table, the tree is the first argument and the table is second:
```r
full_join(portal_tree, taxonomy_matched, by= "label")
```
- What is the structure of the object?
- Attention! doing a full join does not work later down the analysis workflow, we need a left join to drop non matches
```r
tree_table <- left_join(portal_tree, taxonomy, by = "label")
```
- We can still plot our tree normally with `ggtree(tree_table)`
- But now we can use `aesthetics` to plor our tip labels with certain group by color:
```r
ggtree(tree, aes(color = taxa, fontface = "italic")) + # it freezes if there are any unmatched or NA labels in data table!!!
  xlim(0, 20) +
  geom_tiplab()
```

#### Exercise: A taxonomy table for `small_tree`

1. Find the appropriate scientific group labels for each genus in `small_tree` using [this tree as guide](https://en.wikipedia.org/wiki/Primate#Etymology).
2. Create a data frame with 3 columns:
  - a `"label"` column with the names of the tip labels of `small_tree`. Tip: extract the element `"tip.label"` from your phylo object to get a vector of tip labels that you can then join to the other vectors to create a data frame.
  - a `"taxa"` column with the scientific names of the group that each genus belongs to.
  - a `"common_name"` column with the common names of the group that each genus belongs to.
Tip: use the function `c()` to create the vectors that will be columns `"taxa"` and `"common_name"`
3. Join your tree and your table using `left_join()`.
4. Create two different tree plots using `taxa` and `common name` to color the tips of the tree.

- Homework: Connect the data table you chose for your final project to a tree you obtained from Open Tree of Life.

---
---

## Extras on tree viz

- `ggtree()` function is a wrapper of:
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
- how is the timescale calculated?

### Access Branch lengths (5 min)

- data in `"edge.length"` is used to plot the timescale in the `small_tree` visualization
- how is the timescale calculated in trees with no `"edge.length"`?
- Get branching times with `branching.times()`

#### Exercise 1: A scale for `small_tree` (10 min)

- Plot the small tree of five species of primates and include a scale.
```r
ggtree(small_tree) +
  geom_treescale()
```
- What is the difference in terms of data structure between the two trees?
  - Trees differ in number of tips (43 vs 5)
  ```r
  length(portal_tree$tip.label)
  length(small_tree$tip.label)
  ```
  - They also differ in that `small_tree` has no node labels, but it has an `"edge.length"` element that `portal_tree` does not have.
  - This is where branch length data is stored. Access it with `branching.times(small_tree)`.

A mouse lemur (Primates)             |  A kangaroo rat (Rodentia)
:-----------------------------------:|:-------------------------:
![](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShfK5NkjsPH7HwiF7KLNm-auSVcmdL73qabg&usqp=CAU) | ![](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSw0pkznjKJc3xnIOEN4JtepLLJkskifCnjPA&usqp=CAU)


### Plot tip labels (5 min)

- Use the function `geom_tiplab()`
- the `fontface = ` argument allows plotting species names in italics
```r
ggtree(portal_tree) +
  geom_tiplab(size = 3, color = "purple", fontface = 3) # or fontface = "italic"
```

- If tip labels are truncated, give more plotting space with the function `xlim()`
  - `xlim()` requires two numbers, specifying the start and end of the x axis.
  - specifying an `NA` will let R choose the default limit for the axis:
```r
... +
  xlim(NA,20)
```

#### Exercise: Tip labels for `small_tree` (5 min)

- Plot the small tree of five species of primates; include a scale, and tip labels.
- Use the function `branching_times()` to set up an appropriate limit for the x axis, so tips are fully displayed (not truncated).

<!-- Genus _Homo_   | _Pongo_ | _Macaca_ | _Ateles_ | _Galago_
:-------------:|:-------:|:--------:|:--------:|:---------:
![](https://cdn.mos.cms.futurecdn.net/oXMefWEmiLfPBSjteR78qD.jpg) | ![]() | ![]() | ![]() |  -->

![](http://www.zooborns.com/.a/6a010535647bf3970b01675f4e9c38970b-500wi)


### Tree representation: layouts (5 min))

- The argument `layout = ` for the function `ggtree()`.
- It has several options: 	
one of `"rectangular"`, `"dendrogram"`, `"slanted"`, `"ellipse"`, `"roundrect"`, `"fan"`, `"circular"`, `"inward_circular"`, `"radial"`, `"equal_angle"`, `"daylight"` or `"ape".`

```
ggtree(tr = portal_tree, layout = "roundrect")
```

- More options:

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
- It is possible to use facets as with `ggplot()`
- We will use the package `aplot`
- Install it from CRAN:
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

#### Exercise: Tree representation.

1. Try the following layouts on your tree of Portal species:
```
ggtree(portal_tree, layout="ape")
ggtree(portal_tree, layout="rectangular")
ggtree(portal_tree, layout="roundrect")
ggtree(portal_tree, layout="slanted")
ggtree(portal_tree, layout="ellipse")
ggtree(portal_tree, layout="dendogram")
ggtree(portal_tree, layout="circular")
ggtree(portal_tree, layout="radial")
ggtree(portal_tree, layout="fan", open.angle = 90)
ggtree(portal_tree, layout="equal_angle")
ggtree(portal_tree, layout="daylight")
ggtree(portal_tree, layout="unrooted")
```

2. Create a plot containing a subplot for each one of them.
3. As title for each subplot, indicate if the tree representation is rooted or unrooted.
4. Which layout options display the same tree visualization?



### The `phylo` class structure (10 min)
- Type the name of the objects you just created and look at the output
- What information is printed to screen?
- Use functions to explore the structure of the objects you just created:
  - `class(opentree_tree)`, `opentree_tree` is an object of class `"phylo"`
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
