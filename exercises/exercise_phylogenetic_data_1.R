work_dir <- getwd()

# download data tables from the Portal Project Teaching Database

surveys <- read.csv("https://ndownloader.figshare.com/files/2292172")
head(surveys)
colnames(surveys)

species <- read.csv("https://ndownloader.figshare.com/files/3299483")
head(species)

# UNNECESSARY for this workflow: join `surveys` data with `species` names

intersect(colnames(species), colnames(surveys))

combo <- dplyr::inner_join(species, surveys, by = "species_id")

# get a vector or data frame of species names from the `species` table:
library(magrittr)
library(tidyr)
species %>% 
  tidyr::unite(species_names, genus, species, sep = " ") %>% 
  dplyr::select(species_names) -> species_names
class(species_names) # a data frame
species_names <- unlist(as.vector(species_names))

## easiest way:
paste(species$genus, species$species) -> species_names
class(species_names) # a vector

# get a phylogeny, names must be a character vector, not a data frame

ott_matches <- rotl::tnrs_match_names(names = species_names) %>% 
  dplyr::filter(!is.na(unique_name)) %>% # drop names that were not matched
  dplyr::filter(flags == "")

ott_ids <- ott_matches$ott_id

my_tree <- rotl::tol_induced_subtree(ott_ids = ott_ids, 
                                     label_format = "name", 
                                     file = "data/portal_tree.tre")
my_tree

library(ape)
tree <- ape::read.tree("https://github.com/LunaSare/data-science-research-biology/raw/main/data/portal_tree.tre")
portal_tree <- ape::read.tree(file = "data/portal-tree.tre")

class(tree)
typeof(tree)
length(tree)
names(tree)
str(tree)
ape::plot.phylo(tree2)
tree
class(tree$edge)

install.packages("BiocManager")
BiocManager::install("ggtree")
library(ggtree)
ggtree(portal_tree)
tree_plot <- ggtree(portal_tree)
head(BiocManager::available())
small_tree <- read.tree(file = "http://ape-package.ird.fr/APER/APER2/primfive.tre")

ggplot(portal_tree, aes(x, y)) + geom_tree() + theme_tree()

ggtree(small_tree) + 
  geom_tiplab(size=3, color="purple") +
  geom_nodelab(size = 10, color = "gray")

ggtree(portal_tree, layout="circular", open.angle=15)

ggtree(small_tree) +
  geom_treescale()

plot_list(ggtree(portal_tree, layout="circular"), 
          ggtree(portal_tree, layout="fan", open.angle=15), 
          labels = c("Circular", "Fan"))

node_labels <- portal_tree$node.label
unnamed_nodes_position <- grep("mrcaott", node_labels)
head(unnamed_nodes_position)
node_labels[9]
node_labels[unnamed_nodes_position]

node_labels[unnamed_nodes_position] %>%
  head()

head(node_labels, 10)

node_labels[unnamed_nodes_position] <- ""
portal_tree$node.label <- node_labels

ggtree(portal_tree) +
  geom_tiplab(size=3, color="purple", fontface = "italic") +
  geom_nodelab(size = 3, color = "blue") +
  xlim(NA,18)
ggsave(filename = "test.png")
plot.phylo(small_tree)

has.singles(portal_tree)
has.singles(small_tree)

portal_tree <- collapse.singles(portal_tree)
