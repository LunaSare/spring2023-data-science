
# libraries ---------------------------------------------------------------
library(dismo)
library(raster)
library(tidyverse)
library(RColorBrewer)


# data --------------------------------------------------------------------
# getting climatic data
bio_ly <- getData("worldclim",var="bio",res=10, path="./data/")

tempRas<-bio_ly$bio1/10
preciRas<-bio_ly$bio12

# getting occurence data
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


# calculating NPP ---------------------------------------------------------
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

aus<-getData('GADM', country='AUS', level=1)
plot(aus,add=T)

# Extract raster values ---------------------------------------------------
# temperature
sp1_occ_geo$temp<-raster::extract(tempRas,sp1_occ_geo)
sp2_occ_geo$temp<-raster::extract(tempRas,sp2_occ_geo)

#precipitation
sp1_occ_geo$precip<-raster::extract(preciRas,sp1_occ_geo)
sp2_occ_geo$precip<-raster::extract(preciRas,sp2_occ_geo)

hist(sp1_occ_geo$temp,xlim=c(10,30),ylim=c(0,200),col=alpha("red",0.5))
hist(sp2_occ_geo$temp,add=T,col=alpha("blue",0.5))

hist(sp1_occ_geo$precip,xlim=c(500,2300),ylim=c(0,200),col=alpha("red",0.5))
hist(sp2_occ_geo$precip,add=T,col=alpha("blue",0.5))


