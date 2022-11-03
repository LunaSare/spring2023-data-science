Phylogenetic Correlation with pckage `nlme`

```{r}
rownames(taxonomy_means) <- taxonomy_means$label

library(nlme)
pglsModel2 <- gls(mean_weight ~ mean_hindfoot_length, correlation = corBrownian(phy = portal_tree),
                  data = taxonomy_means, method = "ML")
anova(pglsModel2)
```