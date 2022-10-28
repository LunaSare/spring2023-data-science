library(magrittr)
library(ggtree)

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
  mutate(search_string = tolower(paste(genus, species, sep = " ")))

# TNRS match species names from portal data to Open Tree Taxonomy 
  # names must be a character vector, not a data frame

ott_matches <- rotl::tnrs_match_names(names = species_mutated$search_string) 

# double check that we have a matching column name:
intersect(colnames(species_mutated), colnames(ott_matches))

# join species_mutated with ott_matches:

ott_data <- full_join(x = species_mutated, y = ott_matches, by = "search_string")

# select relevant columns for phylogenetic annotation
  # search_string has the original names, but we do not need it for now
  # unique_name has the OTT matched names that are also in the tree, we will rename that to label

taxonomy <- ott_data %>% 
  select(unique_name, species_id, genus, species, taxa)

# change th ename of the unique_name column to "label":

colnames(taxonomy)[1] <- "label"
colnames(taxonomy)
#rows2keep <- match(portal_tree$tip.label, taxonomy$label)
#taxonomy_matched <- taxonomy[rows2keep,]

# write the joined taxonomy table as csv
write.csv(taxonomy, file = "data/portal-species-taxonomy.csv", row.names = FALSE)

# read portal tree and small tree

portal_tree <- ape::read.tree("data/portal-tree.tre")
small_tree <- ape::read.tree("http://ape-package.ird.fr/APER/APER2/primfive.tre")

ggtree(portal_tree) 

# link the data and tree for plotting using join functions

tree <- full_join(portal_tree, taxonomy_matched, by= "label")
# doing a full join does not work down the analysis flow

tree <- left_join(portal_tree, taxonomy, by = "label")

ggtree(tree, aes(color = taxa, fontface = "italic")) + # it freezes if there are any unmatched or NA labels in data table!!!
  xlim(0, 20) +
  geom_tiplab()
  
ggtree(portal_tree) %<+% taxonomy_matched # still gives an error
# Error in `rename_impl()`:
#   ! Names must be unique.
# ✖ These names are duplicated:
#   * "label" at locations 1 and 6.
# Run `rlang::last_error()` to see where the error occurred.



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
