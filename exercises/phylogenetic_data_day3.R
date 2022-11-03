library(ggimage)
library(ggtree)
install.packages("TDbook")
library(TDbook)
library(tidytree)

# load `tree_boots`, `df_tip_data`, and `df_inode_data` from 'TDbook'
data("tree_boots", "df_tip_data", "df_inode_data")
p <- ggtree(tree_boots) %<+% df_tip_data + xlim(-.1, 4)
p2 <- p + geom_tiplab(offset = .6, hjust = .5) +
  geom_tippoint(aes(shape = trophic_habit, color = trophic_habit, 
                    size = mass_in_kg)) + 
  theme(legend.position = "right") + 
  scale_size_continuous(range = c(3, 10))

p2 %<+% df_inode_data + 
  geom_label(aes(label = vernacularName.y, fill = posterior)) + 
  scale_fill_gradientn(colors = RColorBrewer::brewer.pal(3, "YlGnBu"))

colnames(df_tip_data)

#######################

colnames(df_tip_data)[1] <- "label"
tree_joined <- left_join(tree_boots, df_tip_data, by = "label") # only works with by = "label", not with "Newick_label"
tree_joined
p <- ggtree(tree_joined) + 
  geom_tippoint(aes(shape = "circle",
                    color = trophic_habit,
                    size = mass_in_kg))
p

######
colnames(df_inode_data)[1] <- "label"
tj2 <- left_join(tree_joined, df_inode_data, by = "label")
tj2
p <- ggtree(tj2) +
  geom_label(aes(label = vernacularName.y, fill = vernacularName.y)) 

p

colnames(df_inode_data)
####

tree_boots$node.label

ggtree(tree_boots) +
  geom_nodelab(size = 3, color = "blue")
