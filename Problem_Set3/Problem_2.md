##Problem 2: PlyR Practice

```{r}
gdURL <- "http://www.stat.ubc.ca/~jenny/notOcto/STAT545A/examples/gapminder/data/gapminderDataFiveYear.txt"
gDat <- read.delim(file = gdURL)
str(gDat)
```

```
'data.frame':	1704 obs. of  6 variables:
 $ country  : Factor w/ 142 levels "Afghanistan",..: 1 1 1 1 1 1 1 1 1 1 ...
 $ year     : int  1952 1957 1962 1967 1972 1977 1982 1987 1992 1997 ...
 $ pop      : num  8425333 9240934 10267083 11537966 13079460 ...
 $ continent: Factor w/ 5 levels "Africa","Americas",..: 3 3 3 3 3 3 3 3 3 3 ...
 $ lifeExp  : num  28.8 30.3 32 34 36.1 ...
 $ gdpPercap: num  779 821 853 836 740 ...
```

```{r}
(snippet <- subset(gDat, country == "Canada"))
```

```
   country year      pop continent lifeExp gdpPercap
241  Canada 1952 14785584  Americas  68.750  11367.16
242  Canada 1957 17010154  Americas  69.960  12489.95
243  Canada 1962 18985849  Americas  71.300  13462.49
244  Canada 1967 20819767  Americas  72.130  16076.59
245  Canada 1972 22284500  Americas  72.880  18970.57
246  Canada 1977 23796400  Americas  74.210  22090.88
247  Canada 1982 25201900  Americas  75.760  22898.79
248  Canada 1987 26549700  Americas  76.860  26626.52
249  Canada 1992 28523502  Americas  77.950  26342.88
250  Canada 1997 30305843  Americas  78.610  28954.93
251  Canada 2002 31902268  Americas  79.770  33328.97
252  Canada 2007 33390141  Americas  80.653  36319.24
```

```{r}
library(plyr)
library(lattice)
(maxLeByCont <- ddply(gDat, ~continent, summarize, maxLifeExp = max(lifeExp)))
```

```
continent maxLifeExp
1    Africa     76.442
2  Americas     80.653
3      Asia     82.603
4    Europe     81.757
5   Oceania     81.235
```

```{r}
str(maxLeByCont)
```

```
'data.frame':	5 obs. of  2 variables:
 $ continent : Factor w/ 5 levels "Africa","Americas",..: 1 2 3 4 5
 $ maxLifeExp: num  76.4 80.7 82.6 81.8 81.2
```

```{r}
levels(maxLeByCont$continent)
```

```
[1] "Africa"   "Americas" "Asia"     "Europe"   "Oceania" 
```

```{r}
(minLeBygdpPercap <- ddply(gDat, ~continent, summarize, mingdpPercap = min(gdpPercap)))
```

```
continent mingdpPercap
1    Africa     241.1659
2  Americas    1201.6372
3      Asia     331.0000
4    Europe     973.5332
5   Oceania   10039.5956
```

```{r}
ddply(gDat, ~continent, summarize, nUniqCountries = length(unique(country)))
```

```
continent nUniqCountries
1    Africa             52
2  Americas             25
3      Asia             33
4    Europe             30
5   Oceania              2
```

```{r}
ddply(gDat, ~continent, function(x) return(c(nUniqCountries = length(unique(x$country)))))
```

```
  continent nUniqCountries
1    Africa             52
2  Americas             25
3      Asia             33
4    Europe             30
5   Oceania              2
```

```{r}
ddply(gDat, ~continent, summarize, minLifeExp = min(lifeExp), maxLifeExp = max(lifeExp), 
    medGdpPercap = median(gdpPercap))
```

```
 continent minLifeExp maxLifeExp medGdpPercap
1    Africa     23.599     76.442     1192.138
2  Americas     37.579     80.653     5465.510
3      Asia     28.801     82.603     2646.787
4    Europe     43.585     81.757    12081.749
5   Oceania     69.120     81.235    17983.304
```

```{r}
jCountry <- "France"
(jDat <- subset(gDat, country == jCountry))
```

```
country year      pop continent lifeExp gdpPercap
529  France 1952 42459667    Europe  67.410  7029.809
530  France 1957 44310863    Europe  68.930  8662.835
531  France 1962 47124000    Europe  70.510 10560.486
532  France 1967 49569000    Europe  71.550 12999.918
533  France 1972 51732000    Europe  72.380 16107.192
534  France 1977 53165019    Europe  73.830 18292.635
535  France 1982 54433565    Europe  74.890 20293.897
536  France 1987 55630100    Europe  76.340 22066.442
537  France 1992 57374179    Europe  77.460 24703.796
538  France 1997 58623428    Europe  78.640 25889.785
539  France 2002 59925035    Europe  79.590 28926.032
540  France 2007 61083916    Europe  80.657 30470.017
```

```{r}
xyplot(lifeExp ~ year, jDat, type = c("p", "r"))
```

![pic](http://patellis.files.wordpress.com/2014/04/rplot4.png)

```{r}
jFit <- lm(lifeExp ~ year, jDat)
summary(jFit)
```

```
Call:
lm(formula = lifeExp ~ year, data = jDat)

Residuals:
     Min       1Q   Median       3Q      Max 
-0.38013 -0.13894  0.01235  0.14295  0.33486 

Coefficients:
              Estimate Std. Error t value Pr(>|t|)    
(Intercept) -397.76460    7.28533  -54.60 1.03e-13 ***
year           0.23850    0.00368   64.81 1.86e-14 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.22 on 10 degrees of freedom
Multiple R-squared:  0.9976,	Adjusted R-squared:  0.9974 
F-statistic:  4200 on 1 and 10 DF,  p-value: 1.863e-14
```

```{r}
(yearMin <- min(gDat$year))
```

```
[1] 1952
```

```{r}
jFit <- lm(lifeExp ~ I(year - yearMin), jDat)
summary(jFit)
```

```
Call:
lm(formula = lifeExp ~ I(year - yearMin), data = jDat)

Residuals:
     Min       1Q   Median       3Q      Max 
-0.38013 -0.13894  0.01235  0.14295  0.33486 

Coefficients:
                  Estimate Std. Error t value Pr(>|t|)    
(Intercept)       67.79013    0.11949  567.33  < 2e-16 ***
I(year - yearMin)  0.23850    0.00368   64.81 1.86e-14 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.22 on 10 degrees of freedom
Multiple R-squared:  0.9976,	Adjusted R-squared:  0.9974 
F-statistic:  4200 on 1 and 10 DF,  p-value: 1.863e-14
```

```{r}
class(jFit)
```

```
[1] "lm"
```

```{r}
mode(jFit)
```

```
[1] "list"
```

```{r}
names(jFit)
```

```
[1] "coefficients"  "residuals"     "effects"       "rank"          "fitted.values"
 [6] "assign"        "qr"            "df.residual"   "xlevels"       "call"         
[11] "terms"         "model"    
```

```{r}
jFit$coefficients
```

```
(Intercept) I(year - yearMin) 
       67.7901282         0.2385014 
```

```{r}
coef(jFit)
```

```
(Intercept) I(year - yearMin) 
    67.7901282         0.2385014 
```

```{r}
jFun <- function(x) coef(lm(lifeExp ~ I(year - yearMin), x))
jFun(jDat)
```

```
(Intercept) I(year - yearMin) 
       67.7901282         0.2385014 
```

```{r}
jFun <- function(x) {
    estCoefs <- coef(lm(lifeExp ~ I(year - yearMin), x))
    names(estCoefs) <- c("intercept", "slope")
    return(estCoefs)
}
jFun(jDat)
```

```
intercept      slope 
67.7901282  0.2385014 
```

```{r}
jFun(subset(gDat, country == "Canada"))
```

```
 intercept      slope 
68.8838462  0.2188692 
```

```{r}
jFun(subset(gDat, country == "Uruguay"))
```

```
intercept     slope 
65.741603  0.183272 
```

```{r}
jFun(subset(gDat, country == "India"))
```

```
intercept     slope 
39.269756  0.505321 
```

```{r}
jCoefs <- ddply(gDat, ~country, jFun)
str(jCoefs)
```

```
'data.frame':	142 obs. of  3 variables:
 $ country  : Factor w/ 142 levels "Afghanistan",..: 1 2 3 4 5 6 7 8 9 10 ...
 $ intercept: num  29.9 59.2 43.4 32.1 62.7 ...
 $ slope    : num  0.275 0.335 0.569 0.209 0.232 ...
```

```{r}
tail(jCoefs)
```

```
               country intercept       slope
137          Venezuela  57.51332  0.32972168
138            Vietnam  39.01008  0.67161538
139 West Bank and Gaza  43.79840  0.60110070
140        Yemen, Rep.  30.13028  0.60545944
141             Zambia  47.65803 -0.06042517
142           Zimbabwe  55.22124 -0.09302098
```

```{r}
gdURL <- "http://www.stat.ubc.ca/~jenny/notOcto/STAT545A/examples/gapminder/data/gapminderDataFiveYear.txt"
gDat <- read.delim(file = gdURL)
## str(gDat) here when working interactively
yearMin <- min(gDat$year)
jFun <- function(x) {
    estCoefs <- coef(lm(lifeExp ~ I(year - yearMin), x))
    names(estCoefs) <- c("intercept", "slope")
    return(estCoefs)
}
## jFun(subset(gDat, country == 'India')) 
jCoefs <- ddply(gDat, ~country, jFun)
```

```{r}
library(xtable)
```

```{r}
set.seed(916)
foo <- jCoefs[sample(nrow(jCoefs), size = 15), ]
foo <- xtable(foo)
print(foo, type = "html", include.rownames = FALSE)
```

<TABLE border=1>
<TR> <TH> country </TH> <TH> intercept </TH> <TH> slope </TH>  </TR>
  <TR> <TD> Lebanon </TD> <TD align="right"> 58.69 </TD> <TD align="right"> 0.26 </TD> </TR>
  <TR> <TD> Senegal </TD> <TD align="right"> 36.75 </TD> <TD align="right"> 0.50 </TD> </TR>
  <TR> <TD> Dominican Republic </TD> <TD align="right"> 48.60 </TD> <TD align="right"> 0.47 </TD> </TR>
  <TR> <TD> Oman </TD> <TD align="right"> 37.21 </TD> <TD align="right"> 0.77 </TD> </TR>
  <TR> <TD> Germany </TD> <TD align="right"> 67.57 </TD> <TD align="right"> 0.21 </TD> </TR>
  <TR> <TD> Korea, Dem. Rep. </TD> <TD align="right"> 54.91 </TD> <TD align="right"> 0.32 </TD> </TR>
  <TR> <TD> Mauritius </TD> <TD align="right"> 55.37 </TD> <TD align="right"> 0.35 </TD> </TR>
  <TR> <TD> Slovak Republic </TD> <TD align="right"> 67.01 </TD> <TD align="right"> 0.13 </TD> </TR>
  <TR> <TD> Comoros </TD> <TD align="right"> 40.00 </TD> <TD align="right"> 0.45 </TD> </TR>
  <TR> <TD> Argentina </TD> <TD align="right"> 62.69 </TD> <TD align="right"> 0.23 </TD> </TR>
  <TR> <TD> Central African Republic </TD> <TD align="right"> 38.81 </TD> <TD align="right"> 0.18 </TD> </TR>
  <TR> <TD> Ecuador </TD> <TD align="right"> 49.07 </TD> <TD align="right"> 0.50 </TD> </TR>
  <TR> <TD> West Bank and Gaza </TD> <TD align="right"> 43.80 </TD> <TD align="right"> 0.60 </TD> </TR>
  <TR> <TD> Egypt </TD> <TD align="right"> 40.97 </TD> <TD align="right"> 0.56 </TD> </TR>
  <TR> <TD> Myanmar </TD> <TD align="right"> 41.41 </TD> <TD align="right"> 0.43 </TD> </TR>
   </TABLE>

```{r}

```

```{r}

```

```{r}

```

```{r}

```

```{r}

```

```{r}

```

```{r}

```



