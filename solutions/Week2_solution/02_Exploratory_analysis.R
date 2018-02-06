# Read data ---------------------------------------------------------------
data_graz_sub<-read.csv("./outputs/graz_sub1.csv")


# Summary data ------------------------------------------------------------
# Mean and sd fruit size per grazing treatment
summarise(
  group_by(data_graz_sub, Grazing), 
  meanFruit=mean(Fruit),
  sdFruit=sd(Fruit)
)

# plots -------------------------------------------------------------------
pdf("./figs/Graz_Fruit_Root.pdf")
ggplot(data_graz_sub)+
  geom_point(aes(x=Root,y=Fruit, colour=Grazing))+
  theme_bw()
dev.off()

pdf("./figs/FruitSize_perGrazing.pdf")
ggplot(data_graz_sub,aes(x=Grazing,y=Fruit))+
  geom_boxplot()+
  geom_point(size=4,colour="lightgray")+
  theme_bw()
dev.off()


