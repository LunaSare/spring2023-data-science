# libraries ---------------------------------------------------------------
library(tidyverse)

# data --------------------------------------------------------------------
# Moth communities
comu_2012<-read.csv("./data/MothCommunities2012.csv")
comu_2013<-read.csv("./data/MothCommunities2013.csv")

# Reshaping data --------------------------------------------------------------------
comu_2012_dt<- 
  comu_2012 %>%
  group_by(block, treatment) %>% 
  summarise(Total_sp=sum(richness,na.rm=TRUE),
            Total_abundance=sum(totabund,na.rm=TRUE)) %>% 
  mutate(year=2012)

comu_2013_dt<-comu_2013 %>% 
  group_by(block, treatment) %>% 
  summarise(Total_sp=sum(richness,na.rm=TRUE),
            Total_abundance=sum(totabund,na.rm=TRUE)) %>% 
  mutate(year=2013)


# Create and write new data.frame ----------------------------------------------------
Comunitity_total<-rbind(comu_2012_dt,comu_2013_dt)

write.csv(Comunitity_total, "./outputs/mothComunity_2012_2013.csv")
