###"qdap" Analysis on Koontz v. St. John's

===========================================

####Getting and cleaning transcripts of argument

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

####Gantt Plot of argument over length

```{r}
with(dat2, gantt_plot(dialogue, person, title = "Koontz v. St. John's Argument Viz",  xlab = "Argument Duration", ylab = "Speaker", x.tick=TRUE,
+ minor.line.freq = NULL, major.line.freq = NULL, rm.horiz.lines = FALSE))
```

![pic](http://patellis.files.wordpress.com/2014/04/rplot6.png)

####Formality scores (how formal a person’s language is)

```{r}
#parallel about 1:20 on 8 GB ram 8 core i7 machine
v1 <- with(dat2, formality(dialogue, person, parallel=TRUE))
plot(v1)
#about 4 minutes on 8GB ram i7 machine
v2 <- with(dat2, formality(dialogue, person)) 
plot(v2)
# note you can resupply the output from formality back
# to formality and change arguments.  This avoids the need for
# openNLP, saving time.
v3 <- with(dat2, formality(v1, person))
plot(v3, bar.colors=c("Dark2"))
```

![pic](http://patellis.files.wordpress.com/2014/04/rplot013.png)


