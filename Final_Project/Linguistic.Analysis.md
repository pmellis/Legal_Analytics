```{r}
library(qdap)
dat <- read.transcript("R/Coy A KOONTZ Jr Petitioner v ST JOHNS RIVER WATER MANAGEMENT DISTRICT.docx", col.names=c("person", "dialogue"))
truncdf(dat)
left.just(dat)
# qprep wrapper for several lower level qdap functions
# removes brackets & dashes; replaces numbers, symbols & abbreviations
dat$dialogue <- qprep(dat$dialogue)  
# sentSplit splits turns of talk into sentences
dat2 <- sentSplit(dat, "dialogue", stem.col=FALSE)  
htruncdf(dat2)   #view a truncated version of the data(see also truncdf)
```
