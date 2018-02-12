# libraries ---------------------------------------------------------------
library(tidyverse)

# data --------------------------------------------------------------------
# Moth communities
comu_2012<-read.csv("./data/MothCommunities2012.csv")
comu_2013<-read.csv("./data/MothCommunities2013.csv")


# Reshaping data --------------------------------------------------------------------
comu_2012_sp<-comu_2012 %>% 
  gather(key="Species",value="Abundance", 18:ncol(comu_2012)) %>% 
  select(block,stand,treatment,point,Species,Abundance) %>% 
  mutate(year=2012)
  
comu_2013_sp<-comu_2013 %>% 
  gather(key="Species",value="Abundance", 18:ncol(comu_2013)) %>% 
  select(block,stand,treatment,point,Species,Abundance) %>% 
  mutate(year=2013)

comun_total_sp<-rbind(comu_2012_sp,comu_2013_sp)

write.csv(comun_total_sp, "./outputs/Moth_species_values.csv")