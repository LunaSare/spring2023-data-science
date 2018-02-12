# libraries ---------------------------------------------------------------
library(tidyverse)

# 8. Read data --------------------------------------------------------------------
# Moth communities
Total_comun<-read.csv("./outputs/mothComunity_2012_2013.csv")
Sp_values<-read.csv("./outputs/Moth_species_values.csv")

# 9. Create summary table species ----------------------------------------------------
# Total abundance of moths in each of the treatments
Sp_Abun_table<-Sp_values %>% 
  group_by(Species,treatment) %>% 
  summarise(Total_abundance=sum(Abundance))

# 10. Check number of individuals per species per treatment
Sp_Abun_table %>% 
  filter(Species=="Agrotis.vancouverensis")

Sp_Abun_table %>% 
  filter(Species=="Drasteria.divergens")

Sp_Abun_table %>% 
  filter(Species=="Hydriomena.manzanita")

Sp_Abun_table %>% 
  filter(Species=="Xanthorhoe.defensaria")

# 10. year as a factor  -------------------------------------------------
Total_comun$year<-as.factor(Total_comun$year)


# 11. Plot figure 2D of the original paper ------------------------------

pdf("./figs/MothRichness_treatments.pdf")
ggplot(Total_comun, aes(y = Total_sp, x = treatment, fill=year)) +
  geom_boxplot() +
  geom_jitter(aes(shape = year,colour=year), width = 0.1)  
dev.off()

pdf("./figs/MothAbundance_treatments.pdf")
ggplot(Total_comun, aes(y = Total_abundance, x = treatment, fill=year)) +
  geom_boxplot() +
  geom_jitter(aes(shape = year,colour=year), width = 0.1)  
dev.off()


## Challenge: Other plot options  -----------------------------------
library(lattice)
bwplot(Total_comun$Total_sp~Total_comun$treatment|Total_comun$year,
       ylab="Moth richness", xlab="Treatment")

## Option 2
indx1<-which(Total_comun$year==2012)
indx2<-which(Total_comun$year==2013)

boxplot(Total_sp[indx1]~treatment[indx1],
        data=Total_comun, 
        boxfill=rgb(1, 1, 1, alpha=1), 
        border=rgb(1, 1, 1, alpha=1),
        ylab="Moth richness", xlab="Treatment")

boxplot(Total_sp[indx1]~treatment[indx1], 
        data=Total_comun, 
        add=TRUE,
        boxwex=0.25, xaxt = "n", boxfill="red")

boxplot(Total_sp[indx2]~treatment[indx2], 
        data=Total_comun, 
        add=TRUE,
        at=1:n_distinct(Total_comun$treatment) + 0.3,
        boxwex=0.25, xaxt = "n", boxfill="blue")

stripchart(Total_sp[indx1]~treatment[indx1], vertical = TRUE, data = Total_comun, 
           method = "jitter", add = TRUE, pch = 20, col = 'red',
           at=1:n_distinct(Total_comun$treatment) + 0.2)

stripchart(Total_sp[indx2]~treatment[indx2], vertical = TRUE, data = Total_comun, 
           method = "jitter", add = TRUE, pch = 17, col = 'blue',
           at=1:n_distinct(Total_comun$treatment) + 0.2)

legend("topright", legend=c("2012", "2013"),
       fill=c("red", "blue"), cex=0.8,
       title="Year", text.font=4)
  
