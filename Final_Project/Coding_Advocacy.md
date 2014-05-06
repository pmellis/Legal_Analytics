##[de]Coding Advocacy: 
####An Introduction to Quantitative & Computational Analyses of Supreme Court Oral Argument

>People want to know under what circumstances and how far they will run the risk of coming against what is so much stronger than themselves, and hence it becomes a business to find out when this danger is to be feared. **The object of our study, then, is prediction, the prediction of the incidence of the public force through the instrumentality of the courts.** 

~ Oliver Wendell Holmes, Jr., *[The Path of the Law](http://www.constitution.org/lrev/owh/path_law.htm)*, 10 Harv. L. Rev. 457, 469 (1897).

===============================

Despite Holmes' definition of the object of our study over one hundred years ago, legal professionals' ability to forecast matter outcomes remains embroynic, at best, and largely relies on "gut feeling" and "anecdata" rather than quantitative or data-driven analyses. Recent advances in computational and statistical platforms combined with the rapid growth and increasing accessibility of data should, however, spur new efforts to predict what, how, and why courts make the decisions they make and, more importantly, how those decisions affect the clients we represent.

This paper attempts to introduce new approaches to analyze the Supreme Court's rich tradition of oral argument, and suggest ways these methods can be further developed to forecast Supreme Court case outcomes and, potentially, provide early case assessment tools and prediction in lower courts. Specifically, this paper will use statistical, natural language processing,and visualization techniques to examine oral arguments and suggest ways these methods could be used to uncover latent patterns in the justices' conduct. These applications are certainly not new or even particularly advanced in the world of data science and analytics, but they are rarely applied to a field and profession that needs the insight they can provide. 

I would greatly appreciate any feedback as this is an ongoing experiment and effort to learn. If nothing else, I hope that some of the following thoughts will assist or inspire the application of new approaches to old problems facing the legal profession and the clients we serve.

####Predicting SCOTUS: Tea Leaves vs. Math

On March 24, 2014, the United States Supreme Court heard oral argument in *Sebelius v. Hobby Lobby Stores, Inc.*, a case presenting the issue of whether the Religious Freedom Restoration Act allows a for-profit corporation to deny its employees the health coverage of contraceptives to which the employees are otherwise entitled by federal law, based on the religious objections of the corporation’s owners. For 90 minutes, advocates for two corporations and the government sparred over this complex legal issue all while being peppered with questions from the justices.

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

Maybe there is something to it. But probably not. In fact, [studies](http://www.washingtonpost.com/blogs/wonkblog/wp/2012/06/25/experts-arent-very-good-at-predicting-supreme-court-cases/) have found that “expert” commentators on the Supreme Court barely do better than a coin flip and are consistently beaten by [statistical methods](http://www.volokh.com/posts/chain_1115878999.shtml). A result of irrational confidence in their ability to read the sibylline leaves. This is not to say that expert opinions are entirely worthless. After all, "anecdata" is a valuable commodity in the space of legal prediction. I fear, however, that continually failing, legal predictions that rely heavily on "gut feeling" or some other noise may make the Supreme Court, and potentially our entire justice system, seem unpredictable or, even worse, irrational. After all, if Mr. Toobin, a Supreme Court insider and multiple, award-winning book writer on the subject can't get it right, who can?

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

For these purposes, I've selected transcripts from five, high-profile cases' oral arguments, all of which were decided on a 5-4 basis. These cases also fairly characterize the political ideologies of the justices (with two significant departure, Justice Roberts' vote in the Obamacare cases and Justice Kennedy's vote in *Windsor*) visualized in the image below from [VoteView Blog](http://voteview.com/blog/?p=105).

![pic](http://voteview.com/images/martin_quinn_supreme_court_2010.jpg)

A link to the cleaned transcripts and the voting outcomes of the cases follow:

- **[U.S. Department of Health and Human Services v. Florida](https://github.com/SpartyLegal/Legal_Analytics/blob/master/Final_Project/Obamacare.txt)** (Mar 26, 2012)

- **[Shelby County v. Holder](https://github.com/SpartyLegal/Legal_Analytics/blob/master/Final_Project/VRA.txt)** (Feb 27, 2013)

- **[United States v. Windsor](https://github.com/SpartyLegal/Legal_Analytics/blob/master/Final_Project/Windsor.txt)** (Mar 27, 2013)

- **[McCutcheon v. Federal Election Commission](https://github.com/SpartyLegal/Legal_Analytics/blob/master/Final_Project/McCutcheon.txt)** (Oct 8, 2013)

- **[Koontz v. St. Johns River Water Management District](https://github.com/SpartyLegal/Legal_Analytics/blob/master/Final_Project/Koontz.txt)** (Jan 15, 2013)

####Importing and Cleaning the Transcripts

For the following analyses, we will use an R package called "[qdap](http://cran.r-project.org/web/packages/qdap/vignettes/qdap_vignette.html)." qdap developer [Tyler Rinker](https://trinkerrstuff.wordpress.com/tag/tyler-rinker/), describes the package:

> The package stands as a bridge between qualitative transcripts of dialogue and statistical analysis and visualization. qdap was born out of a frustration with current discourse analysis programs. Packaged programs are a closed system, meaning the researcher using the method has little, if any, influence on the program applied to her data. 

Given our five transcripts, we must import the data into our statistical system, R, and then clean it by removing certain characters, numbers, etc. We do this with the following lines on the Obamacare argument transcript:

```{r}
library(qdap)
dat <- read.transcript("ENTER TRANSCRIPT FROM WORKING DIRECTORY", col.names=c("person", "dialogue"))
truncdf(data)
left.just(data)
# qprep wrapper for several lower level qdap functions
# removes brackets & dashes; replaces numbers, symbols & abbreviations
data$dialogue <- qprep(data$dialogue)  
```

We then break the transcript down into sentences:

```{r}
# sentSplit splits turns of talk into sentences
data2 <- sentSplit(data, "dialogue", stem.col=FALSE) 
```

And take a peek at our refined transcript:

```{r}
htruncdf(data2)   #view a truncated version of the data(see also truncdf)
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

Once we've accomplished this step, we can start running tests on the data and analyzing it.

####Basic Stats + Visualizations

The ABA Journal recently published an [article](http://www.abajournal.com/magazine/article/visual_law_services_are_worth_a_thousand_words--and_big_money/) discussing "the genesis of visual law" and its applied applications. In the article, Daniel Lewis, founder of [Ravel](https://www.ravellaw.com/), a visual-based legal research platform, explains the benefits of adding visualizations to text based research:

> We're looking at how we can group cases in a way that tells the story. If you're interested in the rules about abortion, let's start with Roe v. Wade and then track the elements of that over time. We want to help build visualizations that function like dynamically created infographics to help people see the stories in their search results.

Just as maps of legal precedent tell a story, so can visualizations of oral arguments. Using R and qdap, we can explore these stories in a way that may help us better understand the ebb and flow of argument, and potentially provide insight into how the justices behave. The following function allows us to produce the plots to follow:

```{r}
with(data2, gantt_plot(dialogue, person, title = "U.S. Department of Health and Human Services v. Florida",  
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
print(windsor_data)
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

We can do these for each of our five cases to obtain accurate word counts, and then plot the data:

![wordcount](http://patellis.files.wordpress.com/2014/05/wordcount.jpg)

When we isolate Kennedy's *Windsor* statistics against our other cases, we can see that he was 13.064% more vocal by word count in *Windsor* than his next most vocal argument, *Shelby*.

![pic](http://patellis.files.wordpress.com/2014/05/kennedyword.jpg)

Is this a signal or just more noise? It will take more research to find out, but combining statistical analyses with visualizations certainly present some new and interesting questions that are worth examining beyond one justice and five cases. Let's take a look a more complicated analysis.

####Contextual vs. Formality Analysis

When analyzing language, researchers often examine formality and context. Formality is a measure of how contextualized a person's language use. The more formal, the less ambiguous words are standing on there own and vice versa. Thus, complex issues, like those litigated in courts, often require a high degree of formality. qdap uses an algorithm developed by Heylighen & Dewaele (2002) to calculate and measure formality in speech by finding the difference of all of the formal parts of speech (nouns, adjectives, prepositions, articles) and contextual parts of speech (pronouns, verbs, adverbs, interjections) divided by the sum of all formal & contextual speech plus conjunctions. This quotient is added to one and multiplied by 50 to ensure a measure between 0 and 1, with scores closer to 100 being more formal and those approaching 0 being more contextual.

While this analysis could, theoretically and at the expense of human sanity, be done by hand, it can quickly and efficiently be performed in R with relatively little effort with the following:

```{r}
#parallel about 1:20 on 8 GB ram 8 core i7 machine
v1 <- with(data2, formality(dialogue, person, parallel=TRUE))
plot(v1)
#about 4 minutes on 8GB ram i7 machine
v2 <- with(data2, formality(dialogue, person)) 
plot(v2)
# note you can resupply the output from formality back
# to formality and change arguments.  This avoids the need for
# openNLP, saving time.
v3 <- with(data2, formality(v1, person))
plot(v3, bar.colors=c("Dark2"))
```

We can then produce formality scores, such as these on the Obamacare argument:

```
      person word.count formality
1   VERRILLI       3017     66.52
2     KATSAS       2037     64.83
3       LONG       2894     62.61
4  SOTOMAYOR        966     61.80
5      ALITO        661     61.04
6    ROBERTS        493     58.82
7   GINSBURG        797     58.09
8     BREYER       1065     57.98
9      KAGAN        674     56.82
10    SCALIA        317     55.05
11   KENNEDY        290     51.72
```

Note that the three advocates have the highest level of formality, an indication of less contextualization in their speech. We can also visualize these results individually in R:

![pic](http://patellis.files.wordpress.com/2014/05/form.png)

Or plot the arguments against one another and look for areas of interest:

![pic](http://patellis.files.wordpress.com/2014/05/formality1.png)

This information, standing alone, does not have tremendous value. However, when combined with other information or further analyzed, formality scores may provide insight into the attitudes and understandings of the justices. Again, this is merely a starting place, but an excellent example of using R to process and dissect information that would otherwise be extremely difficult to grasp or quantify with armchair theorization alone. 

####Polarity Analysis

Another language-based analysis that has gained popularity, especially in the realm social analytics, is sentiment analysis. Though sentiment analysis algorithms are generally applied to written text, qdap offers a function for dialogue-based analysis. This function compares a given text to the word polarity dictionary used by [Hu & Liu](http://www.cs.uic.edu/~liub/FBS/sentiment-analysis.html) (2004), which has pre-coded words as either positive or negative. The algorithm uses an equation to determine the words use in its context by examining words before and after each subjected word, and then weighting the words differently, depending on the context. 

Though the Hu & Liu dictionary may not be ideal for polarity analysis on Supreme Court argument, it is worth a try as it is able, again, to perform a task that humans, even experts, cannot do without tedious work and bias. In fact, a potentially great project would be to develop a sentiment dictionary for law, but that's for a later day. Using the following code, we can further examine the justices' sentiment toward the advocates:

```{r}
#Using Obamacare Transcript
poldata <- with(obamacaretrans, polarity(dialogue))
poldata
```

```
POLARITY BY GROUP
=================
  all total.sentences total.words ave.polarity
1 all             715       13211        0.025
```

We can also visualize the group polarity with the plot() function, which produces:

![pic](http://patellis.files.wordpress.com/2014/05/picture1.png)

This plot doesn't convey much information, as the bulk of the words are considered neutral. This may be due to the dictionary used. But we can break the group statistics and visuals down by individual speakers with the following: 

```{r}
poldata2 <- with(obamacaretrans, polarity(dialogue,list(person)))
poldata2
```

```
POLARITY BY GROUP
=================
      person total.sentences total.words ave.polarity
10 SOTOMAYOR              60         966       -0.014
1      ALITO              31         661       -0.012
6    KENNEDY              21         290       -0.008
3   GINSBURG              37         797       -0.008
4      KAGAN              40         674       -0.001
5     KATSAS             115        2037        0.006
2     BREYER              75        1065        0.010
9     SCALIA              17         317        0.018
8    ROBERTS              42         493        0.030
11  VERRILLI             151        3017        0.042
7       LONG             126        2894        0.078
```

And plotted:

![pic](http://patellis.files.wordpress.com/2014/05/polplot.jpeg)

For another view, we can render a heat plot:

![pic](http://patellis.files.wordpress.com/2014/05/rplot01.jpeg)

This gives us much more information and a more granular view on the justices' sentiment. Of course, this information could, again, not have any predictive value. Moreover, there are some problems with running a sentiment analysis on the entire argument. For instances, one justice's sentiment could be positive toward one advocate, and negative toward another, which would balance out the total average. At an even higher level, is a justice more negative toward the side she disagrees with? Or is she perhaps more challenging to the side she agrees with to vet the issues and draw the sting? Also a question for another day, but certainly worth exploring. 

Just for curiosity's sake, we can plot the sentiment scores against one another and look for areas of interest:

![pic](http://patellis.files.wordpress.com/2014/05/picture2.png)

Again, it would be premature to try and forecast judicial behavior on this graph alone. We need more data and research into this issue. That said, we can take a peek at the the differing and vast ranging polarities of the justices during oral argument. Perhaps, with a more tailored dictionary and a more in-depth analysis, examining polairty would provide some insight or even have predictive power. 

Or maybe, it's just noise.

####Beyond SCOTUS

Whether Supreme Court oral arguments have predictive power remains to be seen. Oral advocacy and judicial decision-making, is a complex business. At the Supreme Court, it becomes even more complicated, which makes prediction all the more difficult. But we have to start somewhere. After all, as early as 1897, legal scholars described prediction as the object of our study. And today, prediction remains an authentication of a honed legal professional. And while lawyers, hopefully more so than average humans, are skilled in finding patterns, that skill suffers from well-documented biases. Even more so, we suffer from an inability to aggregate and calculate data in large enough amounts that can provide the kind of insight we need to make decisions, free of bias and heuristics. 

That is where the techniques shown above come in. The idea is not that a formality or polarity analysis, or visualization will replace lawyers, but they may, with the proper amount of information, computation, and development supplement our predictive powers. Perhaps the techniques, and many more, can be combined into a regression equation or performed on hundreds of arguments. Even more exciting, what if analytical tools and processes are increasingly used, not only for Supreme Court research, but also on arguments or cases in appellate courts, trial courts, or even in motion practice?

As technology and data becomes increasingly accessible, it is a matter of time before we can predict legal outcomes with greater speed and precision, not only for the sake of writing law review articles or blog posts, but to provide better counsel to our clients. Those who trust us to stand between them and "[the whole power of the state](http://www.constitution.org/lrev/owh/path_law.htm)."

