### Add node labels (5 min)

- The function `geom_nodelab()` adds names to nodes of a tree
```r
ggtree(portal_tree) +
  geom_nodelab(size = 3, color = "blue")
```
- Our `portal_tree` has more node labels than tip labels!
- This means it has singleton nodes
  - they are common when we do not have a full sample of lineages
  - they represent the existence of an ancestor shared with a lineage that was not sampled

### Remove singleton nodes
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



### Get a phylogeny for a group of species names

- `install.packages("rotl")`
- The Open Tree of Life

### Formatting tip labels

- If you want to replace the underscore in the name by a white space:
```r
clean_labels <- gsub("_", " ", portal_tree$tip.label)
```
