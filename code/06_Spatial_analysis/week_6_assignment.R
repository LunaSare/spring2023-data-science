# Libraries ---------------------------------------------------------------
library(dismo)
library(raster)
library(tidyverse)
library(RColorBrewer)


# Data --------------------------------------------------------------------
# Getting climatic data
bio_ly <- getData("worldclim",var="bio",res=10, path="./data/")

tempRas<-bio_ly$bio1/10
preciRas<-bio_ly$bio12

# Getting occurence data
sp1<-gbif("Ctenotus","piankai")
sp2<-gbif("Calyptotis","scutirostrum")


# Cleaning data -----------------------------------------------------------
sp1_occ<-sp1 %>% 
  filter(!is.na(lon)&!is.na(lat)) %>% 
  dplyr::select(species,lon,lat) %>% 
  distinct()


sp2_occ<-sp2 %>% 
  filter(!is.na(lon)&!is.na(lat)) %>% 
  dplyr::select(species,lon,lat) %>%
  distinct()
  

# Converting to spatial data -----------------------------------------------------------
sp1_occ_geo<-sp1_occ
coordinates(sp1_occ_geo)<-~lon + lat

sp2_occ_geo<-sp2_occ
coordinates(sp2_occ_geo)<-~lon + lat


# Calculating NPP ---------------------------------------------------------
#Calculate NPP using the Miami model.
npp.mia.t <- 3000/(1+exp(1.315-0.119*tempRas))
npp.mia.p <- 3000*(1-exp(-0.000664*preciRas))

nppRast<-min(stack(npp.mia.t,npp.mia.p))


#cropbox<-drawExtent()
cropbox<-c(111.77,159.07,-45.69,-9.33)

# Displaying maps and points ------------------------------------------------------
npphist<-hist(nppRast,breaks=4)

plot(crop(nppRast,cropbox),breaks=npphist$breaks,col=brewer.pal(6,"Spectral"))

points(sp1_occ_geo,col="grey",pch=21)
points(sp2_occ_geo,col="red",pch=16)

aus<-getData('GADM', country='AUS', level=1, path="./data/")
plot(aus,add=T)

# Extract raster values ---------------------------------------------------
# temperature
sp1_occ_geo$temp<-raster::extract(tempRas,sp1_occ_geo)
sp2_occ_geo$temp<-raster::extract(tempRas,sp2_occ_geo)

#precipitation
sp1_occ_geo$precip<-raster::extract(preciRas,sp1_occ_geo)
sp2_occ_geo$precip<-raster::extract(preciRas,sp2_occ_geo)

# NPP
sp1_occ_geo$NPP<-raster::extract(nppRast,sp1_occ_geo)
sp2_occ_geo$NPP<-raster::extract(nppRast,sp2_occ_geo)


# Plotting histograms -----------------------------------------------------
hist(sp1_occ_geo$temp,xlim=c(10,30),ylim=c(0,200),col=alpha("red",0.5))
hist(sp2_occ_geo$temp,add=T,col=alpha("blue",0.5))

hist(sp1_occ_geo$precip,xlim=c(500,2300),ylim=c(0,200),col=alpha("red",0.5))
hist(sp2_occ_geo$precip,add=T,col=alpha("blue",0.5))

hist(sp1_occ_geo$NPP,xlim=c(1000,2200),ylim=c(0,250),col=alpha("red",0.5))
hist(sp2_occ_geo$NPP,add=T,col=alpha("blue",0.5))



## Using violing plots
NPP_df<-data.frame(species=c(sp1_occ_geo$species,sp2_occ_geo$species),
                   NPP=c(sp1_occ_geo$NPP,sp2_occ_geo$NPP))


ggplot(NPP_df, aes(x=species, y=NPP, fill=species)) +
  geom_violin(alpha=0.6) +
  theme(legend.position="none")

