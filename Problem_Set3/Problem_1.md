##Problem 1: Random Forests, GLM and Conditional Trees  

=======================================================

Please reproduce the example shown [here](http://rforwork.info/2012/12/23/binary-classification-a-comparison-of-titanic-proportions-between-logistic-regression-random-forests-and-conditional-trees/).

```{r}
library(randomForest, party)
titanic.train <- read.csv("http://biostat.mc.vanderbilt.edu/wiki/pub/Main/DataSets/titanic3.csv")
titanic.survival.train = glm(survived ~ pclass + sex + pclass:sex + age + sibsp, 
    family = binomial(logit), data = titanic.train)
summary(titanic.survival.train)
```

```
Call:
glm(formula = survived ~ pclass + sex + pclass:sex + age + sibsp, 
    family = binomial(logit), data = titanic.train)

Deviance Residuals: 
    Min       1Q   Median       3Q      Max  
-3.1988  -0.6761  -0.4864   0.4863   2.3708  

Coefficients:
                Estimate Std. Error z value Pr(>|z|)    
(Intercept)     7.719650   0.743102  10.388  < 2e-16 ***
pclass         -2.210132   0.243548  -9.075  < 2e-16 ***
sexmale        -6.016085   0.687673  -8.748  < 2e-16 ***
age            -0.042212   0.006994  -6.035 1.59e-09 ***
sibsp          -0.314971   0.099782  -3.157   0.0016 ** 
pclass:sexmale  1.449179   0.261579   5.540 3.02e-08 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

(Dispersion parameter for binomial family taken to be 1)

    Null deviance: 1414.62  on 1045  degrees of freedom
Residual deviance:  933.32  on 1040  degrees of freedom
  (263 observations deleted due to missingness)
AIC: 945.32

Number of Fisher Scoring iterations: 5
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
