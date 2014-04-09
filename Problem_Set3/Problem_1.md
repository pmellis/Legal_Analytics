##Problem 1: Random Forests, GLM and Conditional Trees  

#####Please reproduce the example shown [**here**](http://rforwork.info/2012/12/23/binary-classification-a-comparison-of-titanic-proportions-between-logistic-regression-random-forests-and-conditional-trees/).

```{r}
load(url("http://biostat.mc.vanderbilt.edu/wiki/pub/Main/DataSets/titanic3.sav"))
dim(titanic3)
```

```
[1] 1309   14
```

```{r}
set.seed(1234)
ind <- sample(2, nrow(titanic3), replace = TRUE, prob = c(0.5, 0.5))
titanic.train <- titanic3[ind == 1, ]
titanic.test <- titanic3[ind == 2, ]
```

##GLM

```{r}
titanic.train <- read.csv("http://biostat.mc.vanderbilt.edu/wiki/pub/Main/DataSets/titanic3.csv")
titanic.survival.train = glm(survived ~ pclass + sex + pclass:sex + age + sibsp, 
    family = binomial(logit), titanic.train)
summary(titanic.survival.train)
```

```
Call:
glm(formula = survived ~ pclass + sex + pclass:sex + age + sibsp, 
    family = binomial(logit), data = titanic.train)

Deviance Residuals: 
    Min       1Q   Median       3Q      Max  
-3.1909  -0.6174  -0.4401   0.4189   2.3564  

Coefficients:
                  Estimate Std. Error z value Pr(>|z|)    
(Intercept)        5.43907    0.88464   6.148 7.83e-10 ***
pclass2nd         -2.17403    0.84839  -2.563  0.01039 *  
pclass3rd         -4.07038    0.79710  -5.107 3.28e-07 ***
sexmale           -4.45588    0.77614  -5.741 9.41e-09 ***
age               -0.04379    0.01046  -4.188 2.82e-05 ***
sibsp             -0.26690    0.14665  -1.820  0.06877 .  
pclass2nd:sexmale  0.66065    0.92499   0.714  0.47509    
pclass3rd:sexmale  2.44578    0.84068   2.909  0.00362 ** 
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

(Dispersion parameter for binomial family taken to be 1)

    Null deviance: 721.33  on 536  degrees of freedom
Residual deviance: 447.44  on 529  degrees of freedom
  (125 observations deleted due to missingness)
AIC: 463.44

Number of Fisher Scoring iterations: 6
```

##Random Forest

```{r}
library(randomForest)
titanic.survival.train.rf = randomForest(as.factor(survived) ~ pclass + sex + 
+ age + sibsp, data = titanic.train, ntree = 5000, importance = TRUE, na.action = na.omit)
titanic.survival.train.rf
```

```
Call:
 randomForest(formula = as.factor(survived) ~ pclass + sex + age +      sibsp, data = titanic.train, ntree = 5000, importance = TRUE,      na.action = na.omit) 
               Type of random forest: classification
                     Number of trees: 5000
No. of variables tried at each split: 2

        OOB estimate of  error rate: 17.5%
Confusion matrix:
    0   1 class.error
0 290  34   0.1049383
1  60 153   0.2816901
```

```{r}
importance(titanic.survival.train.rf)
```

```
               0         1 MeanDecreaseAccuracy MeanDecreaseGini
pclass  88.55623 136.20184            142.41658         54.75469
sex    252.10317 334.05962            340.59486        141.32336
age    108.29028  77.87397            138.84501         67.40527
sibsp   80.20135 -24.90378             56.87116         18.13886
```

##Conditional Tree

```{r}
library(party)
titanic.survival.train.ctree = ctree(as.factor(survived) ~ pclass + sex + age + sibsp, titanic.train)
titanic.survival.train.ctree
```

```
Conditional inference tree with 8 terminal nodes

Response:  as.factor(survived) 
Inputs:  pclass, sex, age, sibsp 
Number of observations:  1309 

1) sex == {male}; criterion = 1, statistic = 365.607
  2) pclass <= 1; criterion = 1, statistic = 24.611
    3) age <= 54; criterion = 0.99, statistic = 9.079
      4)*  weights = 151 
    3) age > 54
      5)*  weights = 28 
  2) pclass > 1
    6) age <= 9; criterion = 1, statistic = 25.406
      7) sibsp <= 2; criterion = 1, statistic = 22.192
        8)*  weights = 24 
      7) sibsp > 2
        9)*  weights = 16 
    6) age > 9
      10)*  weights = 624 
1) sex == {female}
  11) pclass <= 2; criterion = 1, statistic = 105.161
    12)*  weights = 250 
  11) pclass > 2
    13) sibsp <= 2; criterion = 0.996, statistic = 10.8
      14)*  weights = 195 
    13) sibsp > 2
      15)*  weights = 21 
```

```{r}
plot(titanic.survival.train.ctree)
```

![pic](http://patellis.files.wordpress.com/2014/04/rplot1.png)
