Individual Justice Polarity

alito <- readLines("GitHub/Legal_Analytics_Spring2014/Final_Project/Arguments/McCutcheon//McCutcheon.Appellee//Alito.txt")
head(alito)
library(qdap)
polarity(alito) #http://cran.r-project.org/web/packages/qdap/qdap.pdf at p.165
poldat <- (polarity(alito))
plot(poldat)

Case Polarity

(Run Chunk 1 from Formality Analysis)

> poldat2 <- with(dat2, polarity(dialogue))
> poldat2
POLARITY BY GROUP
=================
  all total.sentences total.words ave.polarity
1 all             539        9371        0.026
> plot(poldat2)
> poldat2 <- with(dat2, polarity(dialogue,list(person)))
> plot(poldat2)
