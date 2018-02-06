# libraries ---------------------------------------------------------------
library(tidyverse)


# data --------------------------------------------------------------------
dat_graz<-read.csv("./data/30_Jan_18_Raw_graz.csv")


# Subset data  --------------------------------------------------------
dat_graz_sub<-filter(dat_graz, Fruit  > 80 | Root < 6)


# Transform variable ---------------------------------------------------------
dat_graz_sub<-mutate(dat_graz_sub, logvar=log(Fruit))


# Write subset data -------------------------------------------------------
write.csv(dat_graz_sub,file="./outputs/graz_sub1.csv")

