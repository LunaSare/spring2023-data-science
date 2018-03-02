# Libraries ---------------------------------------------------------------
library(knitr)
library(tidyverse)

# Data --------------------------------------------------------------------
# Download data
download.file("http://www.esapubs.org/archive/ecol/E096/269/Data_Files/Amniote_Database_Aug_2015.csv
", "./data/Amniote_Database_Aug_2015.csv")

# To know more about the database go to:
# http://www.esapubs.org/archive/ecol/E096/269/

# Read data
Amniote<-read.csv("./data/Amniote_Database_Aug_2015.csv")

# Explore data
# View(Amniote)
str(Amniote)
# Note that Null values are listed as -999

# Replace -999 for NAs
Amniote[Amniote==-999]<-NA

# Explore data ------------------------------------------------------------
names(Amniote)

## Species per class (In your rmarkdown, use the function kable to create a pretty table)
Amniote %>% 
  group_by(class) %>% 
  summarise(N_order=n_distinct(order),
            N_families=n_distinct(family),
            N_species=n_distinct(species))


# Relationship between body size and maximum longevity
ggplot(Amniote, aes(x=maximum_longevity_y, y=log(adult_body_mass_g))) + 
  geom_point()+
  stat_smooth()

# Ignoring whales and turtles
Amniote %>% 
  filter(order!="Cetacea"& order!="Testudines") %>% 
  ggplot(aes(x=maximum_longevity_y, y=log(adult_body_mass_g))) + 
  geom_point()+
  stat_smooth()

# Check the order levels of Mammals
Amniote %>% 
  filter(class=="Mammalia") %>% 
  select(order) %>% 
  unique

Amniote %>% 
  filter(order=="Primates" | order=="Cetacea") %>% 
  ggplot(aes(x=maximum_longevity_y, y=log(adult_body_mass_g))) + 
  geom_point(aes(colour=order))

Amniote %>%
  filter(order=="Cetacea" & maximum_longevity_y > 200) %>%
  select(genus, species)

Amniote %>%
  filter(order=="Primates" & maximum_longevity_y > 70) %>%
  select(genus, species)

Amniote %>%
  filter(class=="Aves" & maximum_longevity_y > 90) %>%
  select(genus, species)
