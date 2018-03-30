# libraries ---------------------------------------------------------------
library(tidyverse)

# data --------------------------------------------------------------------
# 1. Traits data frame
sp_traits<-read.csv("./Data/species_traits.csv")

# 2. Biome distribution data frame
sp_biomes<-read.csv("./Data/species_biomes_distri.csv")

# 3. Growth form information
Growth_form<-read.csv("./Data/GrowthForm.csv")

# Exploring data ----------------------------------------------------------


# Merging data frames -----------------------------------------------------



# Functions ---------------------------------------------------------------

Trait_biome_df %>% 
  filter(Biome=="Moist_Forest") %>% 
  group_by(FAMILY_STD) %>% 
  summarise(Mean_Trait=mean(Seed_mass, na.rm=TRUE))

# Function 1

# Functions 2

# Function 3

Biome_grasses<-function(biome){

  Biome_df<-
  Trait_biome_GF %>% 
    filter(Biome=="___")
  
  if("Poaceae"%in%"___"){
   
    Biome_df %>% 
      filter(FAMILY_STD=="Poaceae") %>% 
      pull(species)
    
  }else{
    
    print("___")
    
  }  

}

## Biomes that have grass species
Trait_biome_df %>% 
  filter(FAMILY_STD=="Poaceae") %>% 
  select(Biome) %>% 
  unique

# test your function
Biome_grasses("Xeric_Woodlands")
