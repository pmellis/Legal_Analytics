[Data](http://www.uscourts.gov/uscourts/Statistics/StatisticalTablesForTheFederalJudiciary/2013/june/B05Jun13.pdf)

```{r}
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
