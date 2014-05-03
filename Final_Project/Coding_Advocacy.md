##[de]Coding Advocacy: 
####An Introduction to Quantitative & Computational Analyses of Supreme Court Oral Argument

>The object of our study, then, is prediction, the prediction of the incidence of the public force through the instrumentality of the courts. 

~ Oliver Wendell Holmes, Jr., *The Path of the Law*, 10 Harv. L. Rev. 457, 469 (1897).

Despite defining prediction as the object of our study over one hundred years ago, legal professionals' abilities to forecast a case's outcome remains nascent, at best, and largely relies on "gut feeling" and "anecdata" rather than economic or statistical analysis. Recent advances in computational and statistical platforms, in addition to the rapid growth and availability of data should, however, spur new efforts to predict what, how, and why courts make the decisions they make and, more importantly, how those decisions affect the clients we represent.

This paper attempts to introduce new approaches to analyze the United States' Supreme Court's rich tradition of oral argument, and suggest ways these methods can be further developed to forecast Supreme Court case outcomes, and potentially, early case assessment tools and prediction in lower courts. Specifically, this paper will use statistical analyses, natural language processing,and visualization techniques to examine oral arguments. These techniques are certainly not new or even very advanced in the world of data science and analytics, but they are rarely applied to a field and profession that needs them perhaps more than ever. 

I would greatly appreciate any feedback as this is an ongoing experiment and effort to learn, and hopefully assist in developing new approaches to old problems.

####Predicting SCOTUS: Tea Leaves vs. Math

On March 24, 2014, the United States Supreme Court heard oral argument in *Sebelius v. Hobby Lobby Stores, Inc.*, a case presenting the issue of whether the Religious Freedom Restoration Act, which provides that the government “shall not substantially burden a person’s exercise of religion” unless that burden is the least restrictive means to further a compelling governmental interest, allows a for-profit corporation to deny its employees the health coverage of contraceptives to which the employees are otherwise entitled by federal law, based on the religious objections of the corporation’s owners. For 90 minutes, advocates for two corporations and the government addressed complex legal issues while being peppered with questions from the justices.


Almost immediately after arguments concluded, news organizations across the world summoned their most talented jurisprudential analysts to dissect the arguments and predict how the Court would rule. [According to one SCOTUS prophet](http://edition.cnn.com/2014/03/25/politics/scotus-obamacare-contraception-mandate/), CNN’s “Supreme Court Producer,” Bill Mears, “[t]he justices appeared divided along ideological lines in a 90-minute oral argument,” and pointed to Justice Kennedy’s “tough questions” to both sides as evidence of his swing voter status.  Despite Mears’ inability to point to any specific questions or exchanges during argument that foretold his predicted outcome, he or some editor boldly titled his piece “Court majority harshly critical of Obamacare contraception mandate.” 

So there you have it! CNN's legal oracles have spoken and it is simply a matter of time before the Court hands down its decision, though it matters not for we already know the outcome. Right? Not exactly . . . [*tout simplement*](http://www.thedailybeast.com/articles/2012/06/28/train-wreck-how-the-media-kept-blowing-it-on-obamacare.html), CNN legal analyst Jeffrey Toobin following oral argument in *National Federation of Independent Business v. Sebelius*: “This was a train wreck for the Obama administration. This law looks like it’s going to be struck down. All of the predictions, including mine, that the justices would not have a problem with this law were wrong.”

Toobin was, of course, wrong . . . *twice*. But we shouldn’t judge Toobin (too harshly). Even the collective wisdom of the masses via [Intrade](http://www.intrade.com/v4/home/) shifted dramatically in favor of the ultimately wrong outcome following oral argument on the issue (pictured below). [In Nate Silver’s opinion](http://fivethirtyeight.blogs.nytimes.com/2012/06/27/overconfidence-suggested-in-supreme-court-predictions/?_php=true&_type=blogs&_php=true&_type=blogs&_r=1), this phenomenon may have beeen the result of overconfidence in the value of information.  At best, an overvaluing of the information conveyed in oral arguments. At worst, an overvaluing of oral argument in and of themselves.

![Intrade](http://static3.businessinsider.com/image/4feb67a3ecad04801300001d/obamacare-intrade.png)

But what if it merely an inability to detect the information? A confusion of noise and signals? Many studies have attempted to address this problem and have conjectured that oral arguments do have some predictive power:

- Epstein, Lee, Landes, William M. and Posner, Richard A. 2009. “[Inferring the Winning Party in the Supreme Court from the Pattern of Questioning at Oral Argument.](http://papers.ssrn.com/sol3/papers.cfm?abstract_id=1414317)” University of Chicago Law & Economics, Olin Working Paper No. 466. 
- Johnson, Timothy R., Black, Ryan C., Goldman, Jerry and Treul, Sarah. 2009 “[Inquiring Minds Want to Know: Do Justices Tip Their Hands with Questions at Oral Argument in the U.S. Supreme Court?](http://papers.ssrn.com/sol3/papers.cfm?abstract_id=1373965)." Washington University Journal of Law & Policy, Vol. 29, 2009.  
- Shullman, Sarah Levien. 2004. “The Illusion Of Devil’s Advocacy: How The Justices Of The Supreme Court Foreshadow Their Decisions During Oral Argument.” Journal of Appellate Practice and Process. Vol. 6: 2.
- Lindgren, Jim. 2005. “[Does Asking More Questions Tip the Outcome of Supreme Court Cases?](http://www.volokh.com/posts/chain_1115878999.shtml)” Volokh Conspiracy.

Their accuracy, consistency, and comprehensiveness is, however, debatable. Then, and much worse, are the pundits and legal experts who point to “the intangibles” during argument – [such as Mr. Verrilli’s cough](http://www.buzzfeed.com/zekejmiller/solicitor-general-coughs-stumbles-stutters-throu) – that allegedly factor into the calculus of a case’s outcome. I can’t help but think of the scene from Moneyball:

> Scout Artie: I like Perez. He's got a classy swing, it's a real clean stroke.

> Scout Barry: He can't hit the curve ball.

> Scout Artie: Yeah, there's some work to be done, I'll admit that.

> Scout Barry: Yeah, there is.

> Scout Artie: But he's noticeable.

> Matt Keough: And an ugly girlfriend.

> Scout Barry: What does that mean?

> Matt Keough: Ugly girl friend means no confidence.

Maybe there is something to it. But probably not. In fact, [studies](http://www.washingtonpost.com/blogs/wonkblog/wp/2012/06/25/experts-arent-very-good-at-predicting-supreme-court-cases/) have found that “expert” commentators on the Supreme Court barely do better than a coin flip and are consistently beaten by [statistical methods](http://www.volokh.com/posts/chain_1115878999.shtml). A result of irrational confidence in their ability to read the sibylline leaves. 

####A New Approach

Thus, the battle between “expert” opinion and statistical techniques seems settled, through the power of statistical techniques is still in question . . . [FILL SECTION]

####A Sample of Oral Arguments

Unfortunately, I do not have the time nor the resources to perform the kind of comprehensive analysis it would take to determine if there are any latent patterns or cues in Supreme Court oral arguments. However, I can provide an introduction and starting place with five oral argument transcripts, which I've converted to a cleaner, more machine-readable format. 

For our purposes, I've selected transcripts from five, high-profile cases' oral arguments, all of which were decided on a 5-4 basis. From these five samples, I am interested in determining if there are any hints of pattern in the way justices conduct themselves during oral argument and the way they vote. A link to the cleaned transcripts and the voting outcomes of the cases follow:

**U.S. Department of Health and Human Services v. Florida** (Mar 26, 2012)

![florida](http://patellis.files.wordpress.com/2014/05/florida.png)

**Shelby County v. Holder** (Feb 27, 2013)

![holder](http://patellis.files.wordpress.com/2014/05/holder.png)

**United States v. Windsor** (Mar 27, 2013)

![windsor](http://patellis.files.wordpress.com/2014/05/windsor.png)

**McCutcheon v. Federal Election Commission** (Oct 8, 2013)

![mccutcheon](http://patellis.files.wordpress.com/2014/05/mccutch.png)

**[Koontz v. St. Johns River Water Management District](https://github.com/SpartyLegal/Legal_Analytics/blob/master/Final_Project/Koontz.txt)** (Jan 15, 2013)

![koontz](http://patellis.files.wordpress.com/2014/05/koontz21.png)


**To be continued . . .**


