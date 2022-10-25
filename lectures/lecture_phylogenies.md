---
layout: page
element: lecture
title: 'Phylogenetic trees'
language: R
---
> **Learning Objectives**
>
> This week, students will learn to:
>
> - read phylogenies into R.
> - plot phylogenies
> - know the 4 main parts of a phylo object
> - simulate simple phylogenies in R.
> - know lists as data structures.
> - obtain phylogenetic data from the Open Tree of Life
> - date phylogenies using data from the Open Tree of Life
>
> **Practice Objectives**
>
> **Non Objectives**
>

## Day 1: Reading and plotting phylogenies

### Setup your RStudio project (5 min)

- 💡 Structuring your files into a _project_ is a best practice for good data science!
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

- `install.packages("ape")`
- From a newick file in your computer, by providing the path and file name: `ape::read.tree("../data-raw/portal-tree.tre")`
- From a URL address: `ape::read.tree("")`
- Read into R the newick tree in the file **"portal-tree.tre"**, create an object named `portal_tree`.
- Read into R the newick tree in the URL **""**, create an object named `small_tree`.
- Type the name of the objects you just created.
- Look at the structure of the objects:
  - `class(portal_tree)`, `portal_tree` is an object of class `"phylo"`
  - `length(tree)`, it has length 4
  - `names(tree)`, and it has names
  - Just as with data frames, we can access the named elements of a `"phylo"` object using the _dollar sign_ `$`
    - `portal_tree$edge`, `class(portal_tree$edge)`
    - `portal_tree$Nnode`,
    - `portal_tree$tip.label`
    - `portal_tree$node.label`
  - `str(tree)`, shows a summary of the elements of the `"phylo"` object
  - `typeof(tree)`, the `"phylo"` class defines an object of type `"list"`
<!-- - Now click on the name of the object on _RStudio's Environment pane_. -->
- a `"list"` is a data structure, data type or object type, that can combine various objects of different types.
- the class `"phylo"` is a list that combines a matrix, a numeric vector of length one and two character vectors.
<!-- http://www.phytools.org/Cordoba2017/ex/2/Intro-to-phylogenies.html#:~:text=The%20%22phylo%22%20object%20in%20R&text=The%20object%20created%20in%20memory,different%20objects%20of%20different%20types. -->
- the `"phylo"` class tells R all the information to represent a phylogenetic tree

### Plot a phylogeny with R

- the package `ape` has the function `plot.phylo()`:
  - `plot.phylo(portal_tree)`
  - `plot.phylo(small_tree)`
  - it requires much customization
