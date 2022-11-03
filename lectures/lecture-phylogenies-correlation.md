See results of [google search](https://www.google.com/search?sxsrf=ALiCzsbGBQvOveUkGD_vfB5dMio8cHJ9BA:1667507529002&source=univ&tbm=isch&q=phylogenetic+correlation+tdbook+yulab&fir=FFXGdAig5FQ_1M%252CJ07zdt0oTX9FbM%252C_%253BsZ_InTpi61upOM%252CRgzpKeK86yanvM%252C_%253Bo-1AeWAlQ0vB-M%252CgN3MxjohIFVXbM%252C_%253BZ7gVUXkkdCJ-7M%252CgN3MxjohIFVXbM%252C_%253BwomYWZWZ8Ng-kM%252CleT2j3cLuDmtWM%252C_%253BL1ESsBcK18P8KM%252CgN3MxjohIFVXbM%252C_%253Bmedr3ffSPpE6eM%252CK7EYmJFUjJ4v4M%252C_%253BrSKzScD0EtvNRM%252CgN3MxjohIFVXbM%252C_%253BNm5XCXiqG8wDAM%252C4KBhIkN1CTnKzM%252C_%253BsMZ7jq5QFg1yFM%252CgN3MxjohIFVXbM%252C_&usg=AI4_-kQgGyAGO9eDTBX4iynejPEfSMTR6w&sa=X&ved=2ahUKEwipqrTP7ZL7AhUCI30KHVyuD6sQjJkEegQILBAC&biw=1504&bih=814&dpr=2#imgrc=pEKz91daALRBWM)

Phylogenetic correlation structure

https://rdrr.io/cran/ape/man/corClasses.html

Classes:

- corBrownianBrownian motion model (Felsenstein 1985)
- corMartinsThe covariance matrix defined in Martins and Hansen (1997)
- corGrafenThe covariance matrix defined in Grafen (1989)
- corPagelThe covariance matrix defined in Freckelton et al. (2002)
- corBlombergThe covariance matrix defined in Blomberg et al. (2003)



```r
library(nlme)
txt <- "((((Homo:0.21,Pongo:0.21):0.28,Macaca:0.49):0.13,Ateles:0.62):0.38,Galago:1.00);"
tree.primates <- read.tree(text = txt)
X <- c(4.09434, 3.61092, 2.37024, 2.02815, -1.46968)
Y <- c(4.74493, 3.33220, 3.36730, 2.89037, 2.30259)
Species <- c("Homo", "Pongo", "Macaca", "Ateles", "Galago")
dat <- data.frame(Species = Species, X = X, Y = Y)

m1 <- gls(Y ~ X, dat, correlation=corBrownian(1, tree.primates, form = ~Species))
summary(m1)
m2 <- gls(Y ~ X, dat, correlation=corMartins(1, tree.primates, form = ~Species))
summary(m2)
corMatrix(m2$modelStruct$corStruct)
m3 <- gls(Y ~ X, dat, correlation=corGrafen(1, tree.primates, form = ~Species))
summary(m3)
corMatrix(m3$modelStruct$corStruct)
```
