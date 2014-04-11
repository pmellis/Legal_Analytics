alito <- readLines("GitHub/Legal_Analytics_Spring2014/Final_Project/Arguments/McCutcheon//McCutcheon.Appellee//Alito.txt")
head(alito)
library(qdap)
polarity(alito) #http://cran.r-project.org/web/packages/qdap/qdap.pdf at p.165
poldat <- (polarity(alito))
plot(poldat)
