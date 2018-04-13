# Libraries ---------------------------------------------------------------
library(tidyverse)
library(rredlist)
library(foreach)
library(dismo)
library(speciesgeocodeR)

# Data --------------------------------------------------------------------
Amniotes<-read.csv("./data/Amniote_Database_Aug_2015.csv")

# Subsetting data ---------------------------------------------------------
Amniotes[Amniotes==-999]<-NA

Hyracoidea<-
  Amniotes %>% 
  filter(class == "Mammalia" & order =="Hyracoidea")

# Extracting data ---------------------------------------------------------
Hyracoidea$Binomial<-paste(Hyracoidea$genus,Hyracoidea$species)


# Extract IUCN status -----------------------------------------------------
## 1. Get your private key at http://apiv3.iucnredlist.org/api/v3/token
iucn_key<-"0b62357effbfe43b2324a5a1ac9df09d7b641e6a27ccaeb4fefb87747a0eea81"

## 2. Store API key in the environment
Sys.setenv(IUCN_REDLIST_KEY=iucn_key)

## 3. Extract status
ia <- iucn_summary(Hyracoidea$Binomial)
species_iucn<-iucn_status(ia)

## Include the info into the data frame
Hyracoidea$iucn<-species_iucn


# Extract GBIF coordinates -----------------------------------------------------
Hyracoidea$genus<-as.character(Hyracoidea$genus)
Hyracoidea$species<-as.character(Hyracoidea$species)

Hyracoidea_sp1<-gbif(Hyracoidea$genus[1],Hyracoidea$species[1])[c("species","lat","lon","fullCountry")]

## For loops traditional way
## 1. output
gbif_records<-NULL 

## 2. Sequence
for (i in 1:length(Hyracoidea$Binomial)){   

  ## 3. Body
  Hyracoidea_sp<-gbif(Hyracoidea$genus[i],Hyracoidea$species[i])[c("species","lat","lon","fullCountry")]
  gbif_records<-rbind(gbif_records,Hyracoidea_sp)
  
}


## Using the foreach function
gbif_records <-
  foreach(i=1:length(Monotremata$Binomial),.combine = rbind)%do%{
    
    gbif(Monotremata$genus[i],Monotremata$species[i])[c("species","lat","lon","fullCountry")]
    
  }


## Cleaning records
gbif_records<-
  gbif_records %>% 
  filter(!is.na(lon)&!is.na(lat))

## Get rid of duplicate occurrences
dups=duplicated(gbif_records[, c("lon", "lat")])
gbif_records <-gbif_records[!dups, ]

## Merging data frames
Hyracoidea_df<-merge(Hyracoidea,gbif_records, by.x="Binomial", by.y="species")

## Extracting biomes and realms -----
#dir.create("./data/spatial/")
wwf_eco <-WwfLoad(x = "./data/spatial/")

## Remember to include the folder ./data/spatial on your gitignore to avoid problems in Github

### converting your dataframe into a spatial data frame
Hyracoidea_geo<-Hyracoidea_df
coordinates(Hyracoidea_geo)<-~lon + lat

## Make sure the shapefile and dataframe have the same projection
proj4string(Hyracoidea_geo)<-proj4string(wwf_eco)

## Extract information from the shapefile
biome_data<-over(Hyracoidea_geo,wwf_eco)[c("REALM","BIOME","G200_REGIO")]
Hyracoidea_df<-cbind(Hyracoidea_df,biome_data)
Hyracoidea_df<-droplevels(Hyracoidea_df)


## wwf metadata
## Check the metadata here https://www.lib.ncsu.edu/gis/esridm/2004/help/world/wwf_terr.sdc.htm#1


### Body size per habitat
Hyracoidea_df$BIOME<-as.factor(Hyracoidea_df$BIOME)

Hyracoidea_df %>% 
  group_by(BIOME) %>% 
  tally

Hyracoidea_df %>% 
  group_by(REALM) %>% 
  summarise(N_species=n_distinct(species))



