##[de]Coding Advocacy: 
####An Introduction to Quantitative & Computational Analyses of Supreme Court Oral Argument

>People want to know under what circumstances and how far they will run the risk of coming against what is so much stronger than themselves, and hence it becomes a business to find out when this danger is to be feared. **The object of our study, then, is prediction, the prediction of the incidence of the public force through the instrumentality of the courts.** 

~ Oliver Wendell Holmes, Jr., *[The Path of the Law](http://www.constitution.org/lrev/owh/path_law.htm)*, 10 Harv. L. Rev. 457, 469 (1897).

===============================

Despite Holmes' definition of the object of our study over one hundred years ago, legal professionals' ability to forecast matter outcomes remains embroynic, at best, and largely relies on "gut feeling" and "anecdata" rather than quantitative or data-driven analyses. Recent advances in computational and statistical platforms combined with the rapid growth and increasing accessibility of data should, however, spur new efforts to predict what, how, and why courts make the decisions they make and, more importantly, how those decisions affect the clients we represent.

This paper attempts to introduce new approaches to analyze the United States' Supreme Court's rich tradition of oral argument, and suggest ways these methods can be further developed to forecast Supreme Court case outcomes and, potentially, early case assessment tools and prediction in lower courts. Specifically, this paper will use statistical, natural language processing,and visualization techniques to examine oral arguments and attempt to uncover hints of latent patterns in the justices' conduct. These methods are certainly not new or even particularly advanced in the world of data science and analytics, but they are rarely applied to a field and profession that needs them and the insight they can provide perhaps more than ever. 

I would greatly appreciate any feedback as this is an ongoing experiment and effort to learn. If nothing else, I hope that some of the following thoughts will assist or inspire the application of new approaches to old problems facing the legal profession and the clients we serve.

####Predicting SCOTUS: Tea Leaves vs. Math

On March 24, 2014, the United States Supreme Court heard oral argument in *Sebelius v. Hobby Lobby Stores, Inc.*, a case presenting the issue of whether the Religious Freedom Restoration Act allows a for-profit corporation to deny its employees the health coverage of contraceptives to which the employees are otherwise entitled by federal law, based on the religious objections of the corporation’s owners. Not exactly an easy issue. For 90 minutes, advocates for two corporations and the government sparred over complex legal issues while being peppered with questions from the justices.

Almost immediately after arguments concluded, news organizations across the world summoned their most talented jurisprudential analysts to dissect the arguments and predict how the Court would rule. [According to one SCOTUS prophet](http://edition.cnn.com/2014/03/25/politics/scotus-obamacare-contraception-mandate/), CNN’s “Supreme Court Producer,” Bill Mears, “[t]he justices appeared divided along ideological lines in a 90-minute oral argument.” Mears also pointed to Justice Kennedy’s “tough questions” to both sides as evidence of his swing voter status. *How insightful*.  Despite Mears’ inability to cite any specific questions or exchanges during argument on which he based his predicted outcome, he or some editor boldly titled his piece: “Court majority harshly critical of Obamacare contraception mandate.” 

So there you have it! CNN's legal oracles have spoken and it is simply a matter of time before the Court hands down its decision, though it matters not for we already know the outcome. Right? Not exactly . . . [*tout simplement*](http://www.thedailybeast.com/articles/2012/06/28/train-wreck-how-the-media-kept-blowing-it-on-obamacare.html), CNN legal analyst Jeffrey Toobin following oral argument in *National Federation of Independent Business v. Sebelius*: 

> This was a train wreck for the Obama administration. This law looks like it’s going to be struck down. **All of the predictions, including mine, that the justices would not have a problem with this law were wrong.**

Toobin was, of course, wrong . . . *twice*. But we shouldn’t judge Toobin (too harshly). Even the collective wisdom of the masses via [Intrade](http://www.intrade.com/v4/home/) shifted dramatically in favor of the ultimately wrong outcome following oral argument on the issue (pictured below). [In Nate Silver’s opinion](http://fivethirtyeight.blogs.nytimes.com/2012/06/27/overconfidence-suggested-in-supreme-court-predictions/?_php=true&_type=blogs&_php=true&_type=blogs&_r=1), this phenomenon may have beeen the result of "overconfidence in the value of information."  At best, an overvaluing of the information conveyed in oral arguments. At worst, an overvaluing of oral argument in and of themselves.

![Intrade](http://static3.businessinsider.com/image/4feb67a3ecad04801300001d/obamacare-intrade.png)

But what if it is merely an inability to detect the information? A confusion of noise and signal? Many studies have attempted to address this problem and have conjectured that oral arguments do have some predictive power:

- Epstein, Lee, Landes, William M. and Posner, Richard A. 2009. “[Inferring the Winning Party in the Supreme Court from the Pattern of Questioning at Oral Argument.](http://papers.ssrn.com/sol3/papers.cfm?abstract_id=1414317)” University of Chicago Law & Economics, Olin Working Paper No. 466. 
- Johnson, Timothy R., Black, Ryan C., Goldman, Jerry and Treul, Sarah. 2009 “[Inquiring Minds Want to Know: Do Justices Tip Their Hands with Questions at Oral Argument in the U.S. Supreme Court?](http://papers.ssrn.com/sol3/papers.cfm?abstract_id=1373965)." Washington University Journal of Law & Policy, Vol. 29, 2009.  
- Shullman, Sarah Levien. 2004. “The Illusion Of Devil’s Advocacy: How The Justices Of The Supreme Court Foreshadow Their Decisions During Oral Argument.” Journal of Appellate Practice and Process. Vol. 6: 2.
- Lindgren, Jim. 2005. “[Does Asking More Questions Tip the Outcome of Supreme Court Cases?](http://www.volokh.com/posts/chain_1115878999.shtml)” Volokh Conspiracy.

Their accuracy, consistency, and comprehensiveness is, however, debatable. Then, and much worse, there are the pundits and legal experts who point to “the intangibles” during argument – [such as Mr. Verrilli’s cough](http://www.buzzfeed.com/zekejmiller/solicitor-general-coughs-stumbles-stutters-throu) – that allegedly factor into the calculus of a case’s outcome. I can’t help but think of the scene from [Moneyball](http://www.imdb.com/title/tt1210166/):

> Scout Artie: I like Perez. He's got a classy swing, it's a real clean stroke.

> Scout Barry: He can't hit the curve ball.

> Scout Artie: Yeah, there's some work to be done, I'll admit that.

> Scout Barry: Yeah, there is.

> Scout Artie: But he's noticeable.

> Matt Keough: And an ugly girlfriend.

> Scout Barry: What does that mean?

> Matt Keough: Ugly girl friend means no confidence.

Maybe there is something to it. But probably not. In fact, [studies](http://www.washingtonpost.com/blogs/wonkblog/wp/2012/06/25/experts-arent-very-good-at-predicting-supreme-court-cases/) have found that “expert” commentators on the Supreme Court barely do better than a coin flip and are consistently beaten by [statistical methods](http://www.volokh.com/posts/chain_1115878999.shtml). A result of irrational confidence in their ability to read the sibylline leaves. This is not to say that expert opinions are entirely worthless. After all, "anecdata" is a valuable commodity in the space of legal prediction. I fear, however, that continually failing, legal predictions that rely heavily on "gut feeling" or some other noise may make the Supreme Court, and potentially our entire justice system, seem unpredictable or, even worse, irrational. After all, if Mr. Toobin, who is a Supreme Court insider and multiple, award-winning book writer on the Court can't get it right, who can?

####A New Approach

In Holmes' speech-turned-essay, *The Path of Law*, quoted *supra*, he explained:

> For the **rational study of the law** the blackletter man may be the man of the present, but the **man of the future** is the man of statistics and the master of economics.

Today, the addition of computer science to the skills of the man or woman of the future is likely appropriate as new technologies and tools make a greater bouquet of computational, legal analysis techniques increasingly accessible. To convey this concept, the following analyses will be performed with the [R Project for Statistical Computing](http://www.r-project.org/), which has been [described](http://www.revolutionanalytics.com/) as:

> The world’s most powerful programming language for statistical computing, machine learning and graphics as well as a thriving global community of users, developers and contributors. R includes virtually every data manipulation, statistical model, and chart that the modern data scientist could ever need. As a thriving open-source project, R is supported by a community of more than 2 million users and thousands of developers worldwide. Whether you’re using R to optimize portfolios, analyze genomic sequences, or to predict component failure times, experts in every domain have made resources, applications and code available for free, online.

Thus, Legal Analytics, which [Lex Machina](https://lexmachina.com/what-we-do/) describes as "the discovery and communication of meaningful patterns in [legal] data," can be performed at some level by anyone with a laptop, for free. Here goes an example.

####The Issue

Do Supreme Court oral arguments exhibit any patterns, latent or obvious, that suggest how the justices will vote in a given case?

####A Sample of Oral Arguments

Unfortunately, I do not have the time (the Bar Exam is getting in the way) to perform the kind of comprehensive analysis it would take to answer my given question . . . for now. However, I can provide an introduction and starting place with five oral argument transcripts, which I've converted to a cleaner, more machine-readable format. This is by far the most tedious process, and any suggestions or resources to automate the process would be greatly appreciated. 

For these purposes, I've selected transcripts from five, high-profile cases' oral arguments, all of which were decided on a 5-4 basis. These cases also fairly characterize the political ideologies of the justices (with two significant departure, Justice Roberts' vote in the Obamacare cases and Justice Kennedy's vote in Windsor) visualized in the image below from [VoteView Blog](http://voteview.com/blog/?p=105).

![pic](http://voteview.com/images/martin_quinn_supreme_court_2010.jpg)

A link to the cleaned transcripts and the voting outcomes of the cases follow:

- **[U.S. Department of Health and Human Services v. Florida](https://github.com/SpartyLegal/Legal_Analytics/blob/master/Final_Project/Obamacare.txt)** (Mar 26, 2012)

- **[Shelby County v. Holder](https://github.com/SpartyLegal/Legal_Analytics/blob/master/Final_Project/VRA.txt)** (Feb 27, 2013)

- **[United States v. Windsor](https://github.com/SpartyLegal/Legal_Analytics/blob/master/Final_Project/Windsor.txt)** (Mar 27, 2013)

- **[McCutcheon v. Federal Election Commission](https://github.com/SpartyLegal/Legal_Analytics/blob/master/Final_Project/McCutcheon.txt)** (Oct 8, 2013)

- **[Koontz v. St. Johns River Water Management District](https://github.com/SpartyLegal/Legal_Analytics/blob/master/Final_Project/Koontz.txt)** (Jan 15, 2013)

####Importing and Cleaning Transcripts

For the following analyses, we will use a R package called "[qdap](http://cran.r-project.org/web/packages/qdap/vignettes/qdap_vignette.html)." "qdap" developer Tyler Rinker, describes the package:

> The package stands as a bridge between qualitative transcripts of dialogue and statistical analysis and visualization. qdap was born out of a frustration with current discourse analysis programs. Packaged programs are a closed system, meaning the researcher using the method has little, if any, influence on the program applied to her data. 

Given our five transcripts, we must import the data into our statistical system, R, and then clean it by removing certain characters, numbers, etc. We do this with the following lines on the Obamacare argument transcript:

```{r}
library(qdap)
dat <- read.transcript("ENTER TRANSCRIPt FROM WORKING DIRECTORY", col.names=c("person", "dialogue"))
truncdf(dat)
left.just(dat)
# qprep wrapper for several lower level qdap functions
# removes brackets & dashes; replaces numbers, symbols & abbreviations
dat$dialogue <- qprep(dat$dialogue)  
```

We then break the transcript down into sentences:

```{r}
# sentSplit splits turns of talk into sentences
dat2 <- sentSplit(dat, "dialogue", stem.col=FALSE) 
```

And take a peek at our refined transcript:

```{r}
htruncdf(dat2)   #view a truncated version of the data(see also truncdf)
```

```
    person tot   dialogue
1  ROBERTS 1.1 We will he
2  ROBERTS 1.2   Florida.
3     LONG 2.1 Mister Chi
4     LONG 2.2 The Act ap
5     LONG 2.3 There is n
6     LONG 2.4 On the con
7     LONG 2.5 First, Con
8     LONG 2.6 Second, Co
9     LONG 2.7 And third,
10    LONG 2.8 Congress d
```

####Basic Stats + Visualizations

The ABA Journal recently published an [article](http://www.abajournal.com/magazine/article/visual_law_services_are_worth_a_thousand_words--and_big_money/) discussing "the genesis of visual law" and its applied applications. In the article, Daniel Lewis, founder of [Ravel](https://www.ravellaw.com/), a visual-based legal research platform, explains the benefits of adding visualizations to text based research:

> We're looking at how we can group cases in a way that tells the story. If you're interested in the rules about abortion, let's start with Roe v. Wade and then track the elements of that over time. We want to help build visualizations that function like dynamically created infographics to help people see the stories in their search results.

Just as maps of legal precedent tell a story, so can visualizations of oral arguments. Using R and qdap, we can explore these stories in a way that may help us better understand the ebb and flow of argument, and potentially provide insight into how the justices behave. The following function allows us to produce the plots to follow:

```{r}
with(dat2, gantt_plot(dialogue, person, title = "U.S. Department of Health and Human Services v. Florida",  
xlab = "Argument Duration", ylab = "Speaker", x.tick=TRUE, minor.line.freq = NULL, major.line.freq = NULL, 
rm.horiz.lines = FALSE))
```
![obamacare](http://patellis.files.wordpress.com/2014/05/obamacare.jpeg)

![holder](http://patellis.files.wordpress.com/2014/05/holder.jpeg)

![windsor](http://patellis.files.wordpress.com/2014/05/windsor.jpeg)

![mcc](http://patellis.files.wordpress.com/2014/05/mccutcheon.jpeg)

![koontz](http://patellis.files.wordpress.com/2014/05/koontz.jpeg)

These visualizations may be a bit overwhelming, but they do convey a lot of information (speaking patterns, length of questions and exchanges, and are just plain fun to look at). Note, Justice Thomas is not listed on any of the graphs as he has not asked a question in seven years, with [one minor exception](http://usnews.nbcnews.com/_news/2013/01/14/16510953-for-first-time-in-nearly-seven-years-justice-clarence-thomas-talks-during-court-arguments?lite). At first glance, does anything jump out? Aside from Justice Breyer's long stretches of color, it *appears* that Justice Kennedy is more active in the *Windsor* argument. Of course, we know that Justice Kennedy voted with the "liberal" wing of the Court in that case, and my identification of extra-activity may simply be a case of apophenia, the experience of seeing patterns or connections in random or meaningless data, more commonly called a Type I error. Without further research and a larger sample of cases, it is impossible to tell. But, just for fun, we can "zoom in" on the data and see if Justice Kennedy did in fact talk more in the *Windsor* argument using the following function:

```{r}
print(windsor_dat)
```

```
       person total.sentences total.words
10     SCALIA              48         700       
8     KENNEDY              48         791       
1       ALITO              51         958       
4    GINSBURG              27         418       
6       KAGAN              22         545        
11  SOTOMAYOR              57         822        
2      BREYER              91        1561        
9     ROBERTS              82        1156        
```

When we plot Kennedy's *Windsor* statistics against our other cases, we can see that he 13.064% more vocal by word count in *Windsor* than his next most vocal argument, *Shelby*.

![pic](http://patellis.files.wordpress.com/2014/05/kennedyplot.png)

Is this a signal or just more noise? It will take more research to find out, but combining statistical analyses with visualizations certainly present some new and interesting questions! Let's take a look a more complicated analysis.

####Contextual vs. Formality Analysis

####Polarity Analysis

####Beyond SCOTUS

**To be continued . . .**


