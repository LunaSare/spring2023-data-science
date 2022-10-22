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


ape::read.tree(file = "")
