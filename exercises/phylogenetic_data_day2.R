library(magrittr)
library(ggtree)
library(tidyr)
library(dplyr)
library(tidytree)

# download data tables from the Portal Project Teaching Database

surveys <- read.csv("https://ndownloader.figshare.com/files/2292172")
head(surveys)
colnames(surveys)

species_raw <- read.csv("https://ndownloader.figshare.com/files/3299483")
head(species_raw)

# add a column to the `species` table that contains the search string for a TNRS match
  # I will paste "genus" and "species" columns into a new column, separated by blank spaces and all lower case
library(magrittr)
library(tidyr)
species_mutated <- species %>% 
  dplyr::mutate(search_string = tolower(paste(genus, species, sep = " ")))

# TNRS match species names from portal data to Open Tree Taxonomy 
  # names must be a character vector, not a data frame

ott_matches <- rotl::tnrs_match_names(names = species_mutated$search_string) 

# double check that we have a matching column name:
intersect(colnames(species_mutated), colnames(ott_matches))

# join species_mutated with ott_matches:

ott_data <- full_join(x = species_mutated, y = ott_matches, by = "search_string")

colnames(ott_data)
# select relevant columns for phylogenetic annotation
  # search_string has the original names, but we do not need it for now
  # unique_name has the OTT matched names that are also in the tree, we will rename that to label

taxonomy <- ott_data %>% 
  select(search_string, 
         species_id, 
         genus, 
         species, 
         taxa, 
         unique_name, 
         approximate_match, 
         ott_id,
         is_synonym,
         flags)

# change the name of the unique_name column to "label":

colnames(taxonomy)
colnames(taxonomy)[1] <- "label"
colnames(taxonomy)[6] <- "ott_name"
colnames(taxonomy)

# match label column to tip labels in tree:
# make first letter uppercase

taxonomy$label <- stringr::str_to_sentence(taxonomy$label)

# then, replace blabk by underscore:
taxonomy$label <- gsub(" ", "_", taxonomy$label)

# write the joined taxonomy table as csv
write.csv(taxonomy, file = "data/portal-species-taxonomy.csv", row.names = FALSE)

# read portal tree and small tree

portal_tree <- ape::read.tree("data/portal-tree.tre")
small_tree <- ape::read.tree("http://ape-package.ird.fr/APER/APER2/primfive.tre")

ggtree(portal_tree) 

# link the data and tree for plotting using join functions
library(ggtree)

tree <- full_join(portal_tree, taxonomy, by= "label")
# doing a full join does not work down the analysis flow

tree <- left_join(portal_tree, taxonomy, by = "label")
tree <- tidytree:::left_join.phylo(portal_tree, taxonomy, by = "label")
tree
ggtree(tree, aes(color = taxa, fontface = "italic")) + # it freezes if there are any unmatched or NA labels in data table!!!
  xlim(0, 20) +
  geom_tiplab()
  
p <- ggtree(portal_tree) %<+% taxonomy
p


# using images instead of labels

install.packages("ggimage")
library(ggimage)
d <- ggimage::phylopic_uid(portal_tree$tip.label)
names(d)
# d$body_mass <- c(52, 114, 47, 45, 58, 6)

p <- ggtree(tree) %<+% d + 
  geom_tiplab(aes(image=uid, colour=body_mass), geom="phylopic", offset=2.5) +
  geom_tiplab(aes(label=label), offset = .2) + xlim(NA, 7) +
  scale_color_viridis_c()
