
Phylogenetic contrasts

https://stackoverflow.com/questions/45817925/phylogenetic-correlation-test

Pearson instead of PGLS:

http://blog.phytools.org/2017/08/pearson-correlation-with-phylogenetic.html

PGLS

http://www.phytools.org/Cordoba2017/ex/4/PGLS.html

```r
ggtree(portal_tree) +
  geom_nodelab(size = 3, color = "blue")
  ```
  - Our `portal_tree` has more node labels than tip labels!
  - This means it has singleton nodes
  - they are common when we do not have a full sample of lineages
  - they represent the existence of an ancestor shared with a lineage that was not sampled



### Remove singleton nodes

- function `ape::has.singles()` and `ape::collapse.singles()`
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



### Get a phylogeny for a group of species names

- `install.packages("rotl")`
- The Open Tree of Life

### Formatting tip labels

- If you want to replace the underscore in the name by a white space:
```r
clean_labels <- gsub("_", " ", portal_tree$tip.label)
```

---
---
Post from José Hidasi Neto on https://rfunctions.blogspot.com/2014/02/measuring-phylogenetic-signal-in-r.html

Hello Again!

The content of this post has been moved to: https://clubedaciencia.com.br/measuring-phylogenetic-signal-in-r/

Today I'm going to show you how to easily measure some of the most used phylogenetic signal measures.

Phylogenetic signal is often defined as a tendency of closely related species resembling each other in relation to their phenotypes more than if compared to other random species.

To know more about that: http://sysbio.oxfordjournals.org/content/57/4/591.full

I'll give very brief explanations about four measures and show how to calculate them in R. It will be a simple thing. And of course, feel free to comment or correct anything =]. At the end of the post there is a video of me playing a song (Lilium) on the piano, just for fun.

As a reference I will use the following paper by Münkemüller et al. (try to read it, ok?):
http://onlinelibrary.wiley.com/doi/10.1111/j.2041-210X.2012.00196.x/abstract


The four measures are: Moran's I, Abouheif's C mean, Pagel's λ and Blomberg's K.

# Before we proceed: trait evolution under a pure brownian motion model defines the phylogenetic relationship as the only predictor of trait similarity among species.

# Also, do the following things in R:

################################

### Install these packages:

install.packages("picante")
install.packages("ape")
install.packages("adephylo")
install.packages("ade4")
install.packages("phylobase")
install.packages("geiger")
install.packages("phytools")

### Load them:

library(picante)
library(ape)
library(adephylo)
library(ade4)
library(phylobase)
library(geiger)
library(phytools)

### Then, download these two files:
http://www.mediafire.com/view/fbu6n6ankcyu1w9/ungudata.csv
http://www.mediafire.com/view/9klh024zzfvommg/ungutree.txt

### And load them into R (for ungdat, we will give names to rows according to the first column):
ungdat<-read.csv(choose.files(),sep=",")
row.names(ungdat)<-ungdat[,1]
ungdat<-ungdat[,-1]

ungtree<-read.tree(choose.files())

# You may need to change the sep="," argument to sep=";" depending on your computer.
# These two files are modified versions of ungulates data found in 'ape' package.

################################

1. Moran's I



Moran's I is known as a measure of spatial autocorrelation. However, in a phylogenetic approach, it uses the phylogenetic proximity among species instead of 'spatial proximity'. It can be seen as "an autocorrelation coefficient describing the relation of cross-taxonomic trait variation to phylogeny". When I equals 0, species resemble each other as much as predicted under a brownian motion model. When I is lower than 0, species resemble each other less than predicted under a brownian motion model. Alternatively, when I is higher than 0, closely related species are more similar in relation to the studied trait. Moran's test of phylogenetic signal is similar to Abouheif's, but it uses a matrix of phylogenetic proximities with a null diagonal.

For more info: http://www.jstor.org/discover/10.2307/2332142?uid=2&uid=4&sid=21103538151363
For more info: http://www.jstor.org/discover/10.2307/2992183?uid=2&uid=4&sid=21103538151363
For more info: http://www.ncbi.nlm.nih.gov/pubmed/18022657

How to Measure:

########
Entering R
########

# First, you need one file that combines both the phylogenetic and trait data
phylotraits <- phylo4d(ungtree, ungdat)

# Then, we do moran test using some Monte Carlo simulations (default is 999 randomizations)
moran.test <- abouheif.moran(phylotraits,method="Abouheif")

moran.test

## You can see the observed value of Moran's I for each variable and its p value. We do not see any trait with strong phylogenetic signal effects. Moreover, we can see some plots for these results using:

plot(moran.test)



########

2. Abouheif's Cmean



Abouheif's test turns out to be a Moran's test, but Abouheif's matrix of phylogenetic proximities has a non-zero diagonal. These proximities are based both on Moran's I and Geary's c tests (two traditional measures of spatial autocorrelation).

For more info: http://biology.mcgill.ca/faculty/abouheif/articles/Abouheif%201999.pdf
For more info: http://www.ncbi.nlm.nih.gov/pubmed/18022657

How to Measure:

########
Entering R
########

# First, you need one file that combines both the phylogenetic and trait data
phylotraits <- phylo4d(ungtree, ungdat)

# Then, we do moran test using some Monte Carlo simulations (default is 999 randomizations)
abouheif.test <- abouheif.moran(phylotraits,method="oriAbouheif")

abouheif.test

## You can see the observed value of Moran's I for each variable and its p value. We can observe some traits suggesting strong phylogenetic signal effects. Moreover, we can see some plots for these results using:

plot(abouheif.test)


# Bimodality is probably due to low n.

########

3. Pagel's λ

Basically, "λ is the transformation of the phylogeny that ensures the best fit of trait data to a Brownian Motion model".

When λ equals 1, the structure of the phylogeny alone can explain changes in traits (explain covariance matrix of traits). In this scenario, traits follow a pure brownian motion model of evolution. On the other hand, when λ equals 0, the phylogeny has to become a 'star phylogeny' (i.e. to lose all its structure) to be able to explain trait evolution under a brownian motion model. Therefore, the phylogeny alone is not able to explain trait evolution. Also, λ can be greater than 1, what would suggest that the rate of evolution of a trait is higher at the root than it is at the tips.

For more info: http://www.nature.com/nature/journal/v401/n6756/abs/401877a0.html
For more info: http://www.jstor.org/discover/10.1086/343873?uid=2&uid=4&sid=21103539886813

How to Measure:

########
Entering R
########

# First, you need to define which trait you want to test and give names to each value according to species
trait<-ungdat[,4]
names(trait)<-rownames(ungdat)

# We chose Litter Size as the trait we are testing for phylogenetic signal. Then, we do the test with 999 randomizations:
phylosig(ungtree, trait, method="lambda", test=TRUE, nsim=999)

########

4. Blomberg's K



Blomberg's K is a relatively recent measure of phylogenetic signal. It is defined as the ratio between two other ratios. The first (observed) is the Mean Squared Error of tip data divided by the Mean Squared Error of data calculated using variance-covariance matrix derived from the phylogeny. The second ratio (expected) is the same thing, but using data from a model under the assumption of brownian motion of trait evolution. Thus, K<1 indicates that closely related species resemble each other less than expected under the Brownian motion model of trait evolution. K>1 means that closely related species are more similar than predicted by the model. In other words, greater values of K suggest strongest effects of phylogenetic signal.

For more info: http://www.bioone.org/doi/abs/10.1554/0014-3820(2003)057%5B0717%3ATFPSIC%5D2.0.CO%3B2

How to Measure:

########
Entering R
########

# First, you need to define which trait you want to test and give names to each value according to species
trait<-ungdat[,4]
names(trait)<-rownames(ungdat)

# We chose Litter Size as the trait we are testing for phylogenetic signal. Then, we do the test with 999 randomizations:
phylosig(ungtree, trait, method="K", test=TRUE, nsim=999)


###################################################

See my my recent post about Phylogenetic Comparative Methods:
http://rfunctions.blogspot.com.br/2017/07/phylogenetic-comparative-methods-pcms.html
