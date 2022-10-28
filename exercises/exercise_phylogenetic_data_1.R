work_dir <- getwd()

# download data tables from the Portal Project Teaching Database

surveys <- read.csv("https://ndownloader.figshare.com/files/2292172")
head(surveys)
colnames(surveys)

species <- read.csv("https://ndownloader.figshare.com/files/3299483")
head(species)

# UNNECESSARY for this workflow: join `surveys` data with `species` names
library(dplyr)
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

# match species names from portal data to OTT, 
# names must be a character vector, not a data frame

ott_matches <- rotl::tnrs_match_names(names = species_names)
ott_filtered <- ott_matches %>% 
  dplyr::filter(!is.na(unique_name)) %>% # drop names that were not matched
  dplyr::filter(flags == "")

# get a vector of ott ids to use in the next step
ott_ids <- ott_filtered$ott_id
length(ott_ids)
# get and save the OpenTree induced subtree
portal_tree <- rotl::tol_induced_subtree(ott_ids = ott_ids, 
                                     label_format = "name")

# replace OTT tip labels by original search string from the species portal data CSV:

mm <- match(portal_tree$tip.label, 
      gsub(" ", "_", ott_filtered$unique_name))
original_species_names <- stringr::str_to_sentence(ott_filtered$search_string[mm])
data.frame(portal_tree$tip.label, original_species_names)
portal_tree$tip.label <- gsub(" ", "_", original_species_names)

library(ape)
# ape::write_tree always replaces spaces by underscores, so we need to chnage this upon reading
ape::write.tree(portal_tree, file = "data/portal-tree.tre")

# test that it worked correctly
tree <- ape::read.tree("https://github.com/LunaSare/data-science-research-biology/raw/main/data/portal-tree.tre")
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
small_tree$
ggtree(small_tree) +
  geom_tiplab(size=3, color="purple", fontface = "italic") +
  xlim(NA,1.5) + 
  geom_nodelab(aes(label = node), geom = "label")

portal_tree <- collapse.singles(portal_tree)

branching.times(small_tree)

ggtree(small_tree) +
  geom_nodelab(aes(label = node), size = 3, color = "blue", geom = "label")

