##Koontz v. St. John's River Water Management

####Facts of the Case 
In 1994, Coy A. Koontz requested a permit from St. John’s River Water Management to develop more of his land than the original permit allowed. St. John’s had jurisdiction over Koontz’s land. St. John’s agreed to issue the permit on the condition that Koontz deed the rest of his property into a conservation area and do some mitigation work on the surrounding areas. Koontz agreed to the deed but not to the mitigation work. St. John’s denied the permit application.

Koontz sued St. John’s River Water Management, and the trial court found in favor of Koontz. A Florida trial court held that St. John’s actions effected a taking of Koontz land and that imposing requirements for the issuance of a permit is only constitutional if the required action serves the same governmental purpose as the ban on development. Florida's Fifth District Court of Appeal affirmed. The Supreme Court of Florida reversed.

####Issue
Is the government liable for a taking when it refuses to issue a permit until the landowner has agreed to dedicate personal resources to a public use?

This case was argued on Tuesday, January 15, 2013. The following is a semantic analysis of that argument:

####Retrieving/Cleaning Argument Transcript

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

```
     person tot   dialogue
1     BEARD 1.1 Thank you,
2  GINSBURG 2.1 Let's back
3  GINSBURG 2.2 When he as
4  GINSBURG 2.3 So he reco
5  GINSBURG 2.4 Is that ri
6     BEARD 3.1 That is co
7     BEARD 3.2 With his a
8  GINSBURG 4.1 And if he 
9     BEARD 5.1 If there w
10 GINSBURG 6.1 Suppose he
```

####Gantt Plot Visualization

A Gantt plot allows the user to find trends and patterns in dialogue across time. It essentially allows for a visual representation of an entire exchange of dialogue.

```{r}
with(dat2, gantt_plot(dialogue, person, title = "Koontz v. St. John's Argument Viz",  
xlab = "Argument Duration", ylab = "Speaker", x.tick=TRUE, minor.line.freq = NULL, major.line.freq = NULL, rm.horiz.lines = FALSE))
```

![pic](https://camo.githubusercontent.com/a13bc83dba83684e3acf0390c1454e282c460513/687474703a2f2f706174656c6c69732e66696c65732e776f726470726573732e636f6d2f323031342f30342f72706c6f74362e706e67)

####Formality Analysis

Formality is how contextualize a person's language use is. In situations involving what may be new content/context for an audience, a speaker may be more formal in their speech (Heylighen & Dewaele, 1999a, 1999b, 2002). Heylighen & Dewaele (2002) have developed a measure of formality based on categorizing parts of speech into contextual/formal categories. Heylighen & Dewaele's (2002) F-measure is calculated by finding the difference of all of the formal parts (f) of speech (noun, adjective, preposition, article) and contextual (c) parts of speech (pronoun, verb, adverb, interjection) divided by the sum of all formal & contextual speech plus conjunctions (N). This quotient is added to one and multiplied by 50 to ensure a measure between 0 and 1, with scores closer to 100 being more formal and those approaching 0 being more contextual. 

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
