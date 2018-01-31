

# lib ---------------------------------------------------------------------
library(tidyverse)


# Create data -------------------------------------------------------------

# Long format
species_long <- data.frame(
  expand.grid(Site=c("A","B","C"), Plot = 1:4, Species = c("Species1", "Species2", "Species3","Species4")),
  Abundance = round(runif(16, 0, 12), 0)
)

# Wide format
species_wide<-spread(species_long, Species, Abundance)

write.csv(species_wide, "survey_data.csv")
