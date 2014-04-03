Pareto Analysis with R
============================

The 80-20 rule states that 80% of outcomes can be attributed to 20% of the causes for a given event. In business, the 80-20 rule is used to help managers identify problems and determine which operating factors are most important and should receive the most attention based on an efficient use of resources. Resources should be allocated to addressing the input factors have the most effect on a company's final results. It is also known as the "Pareto principle", the "principle of factor sparsity" and the "law of the vital few." 

Does it apply in law? Let's find out by doing a Pareto analysis on U.S. Court of Appeals decisions and their outcomes based on the merits.

==============================

[**Data**:](http://www.uscourts.gov/uscourts/Statistics/StatisticalTablesForTheFederalJudiciary/2013/june/B05Jun13.pdf) U.S.	Courts	of	Appeals—Appeals	Terminated	on	the	Merits,	by	Circuit, 
During	the	12-Month	Period	Ending	June	30,	2013

```{r}
library(qcc)
Appellate_Disposition <- c(23689,2753,2249,516,68)
names(Appellate_Disposition) <- c("Affirmed", "Dismissed", "Reversed", "Remanded", "Other")
pareto.chart(Appellate_Disposition, ylab = "Frequency", col=heat.colors(length(Appellate_Disposition)))
```

```
Pareto chart analysis for Appellate_Disposition
            Frequency Cum.Freq. Percentage Cum.Percent.
  Affirmed      23689     23689 80.9188728     80.91887
  Dismissed      2753     26442  9.4039283     90.32280
  Reversed       2249     28691  7.6823228     98.00512
  Remanded        516     29207  1.7625961     99.76772
  Other            68     29275  0.2322801    100.00000
```

![pic](http://patellis.files.wordpress.com/2014/04/rplot.png)

You can also add a line at the 80% mark for 80-20 analysis.
```{r}
abline(h=(sum(Appellate_Disposition)*.8),col="blue",lwd=1) 
```

![pic](http://patellis.files.wordpress.com/2014/04/rplot01.png)

It appears that the 80-20 rule also applies in the context of appellate decisions.
