##Problem 3: H-Clustering and K Means 

###Please replicate hierarchical clustering section 2 from [this page](http://www.stat.berkeley.edu/classes/s133/Cluster2a.html).

```{r}
cars <- read.delim("http://www.stat.berkeley.edu/classes/s133/data/cars.tab")
head(cars)
```

```
Country                       Car  MPG Weight Drive_Ratio Horsepower Displacement
1    U.S.        Buick Estate Wagon 16.9  4.360        2.73        155          350
2    U.S. Ford Country Squire Wagon 15.5  4.054        2.26        142          351
3    U.S.        Chevy Malibu Wagon 19.2  3.605        2.56        125          267
4    U.S.    Chrysler LeBaron Wagon 18.5  3.940        2.45        150          360
5    U.S.                  Chevette 30.0  2.155        3.70         68           98
6   Japan             Toyota Corona 27.5  2.560        3.05         95          134
  Cylinders
1         8
2         8
3         8
4         8
5         4
6         4
```

```{r}
cars.use = cars[, -c(1, 2)]
medians = apply(cars.use, 2, median)
mads = apply(cars.use, 2, mad)
cars.use = scale(cars.use, center = medians, scale = mads)
cars.dist = dist(cars.use)
cars.hclust = hclust(cars.dist)
plot(cars.hclust, labels = cars$Car, main = "Default from hclust")
```

![pic](http://patellis.files.wordpress.com/2014/04/rplot2.png)

Fix ledger . . .

```{r}
plot(cars.hclust, labels = cars$Car, main = "Default from hclust", hang = -1.5)
```

![pic](http://patellis.files.wordpress.com/2014/04/rplot011.png)

```{r}
groups.3 = cutree(cars.hclust,3)
table(groups.3)
```

```
groups.3
 1  2  3 
 8 20 10 
```

```{r}
counts = sapply(2:6,function(ncl)table(cutree(cars.hclust,ncl)))
names(counts) = 2:6
counts
```

```
$`2`

 1  2 
18 20 

$`3`

 1  2  3 
 8 20 10 

$`4`

 1  2  3  4 
 8 17  3 10 

$`5`

 1  2  3  4  5 
 8 11  6  3 10 

$`6`

 1  2  3  4  5  6 
 8 11  6  3  5  5 
```

```{r}
cars$Car[groups.3 == 1]
```

```
[1] Buick Estate Wagon        Ford Country Squire Wagon Chevy Malibu Wagon       
[4] Chrysler LeBaron Wagon    Chevy Caprice Classic     Ford LTD                 
[7] Mercury Grand Marquis     Dodge St Regis           
38 Levels: AMC Concord D/L AMC Spirit Audi 5000 BMW 320i ... VW Scirocco
```

```{r}
sapply(unique(groups.3),function(g)cars$Car[groups.3 == g])
```

```
[[1]]
[1] Buick Estate Wagon        Ford Country Squire Wagon Chevy Malibu Wagon       
[4] Chrysler LeBaron Wagon    Chevy Caprice Classic     Ford LTD                 
[7] Mercury Grand Marquis     Dodge St Regis           
38 Levels: AMC Concord D/L AMC Spirit Audi 5000 BMW 320i ... VW Scirocco

[[2]]
 [1] Chevette         Toyota Corona    Datsun 510       Dodge Omni      
 [5] Audi 5000        Saab 99 GLE      Ford Mustang 4   Mazda GLC       
 [9] Dodge Colt       AMC Spirit       VW Scirocco      Honda Accord LX 
[13] Buick Skylark    Pontiac Phoenix  Plymouth Horizon Datsun 210      
[17] Fiat Strada      VW Dasher        BMW 320i         VW Rabbit       
38 Levels: AMC Concord D/L AMC Spirit Audi 5000 BMW 320i ... VW Scirocco

[[3]]
 [1] Volvo 240 GL          Peugeot 694 SL        Buick Century Special
 [4] Mercury Zephyr        Dodge Aspen           AMC Concord D/L      
 [7] Ford Mustang Ghia     Chevy Citation        Olds Omega           
[10] Datsun 810           
38 Levels: AMC Concord D/L AMC Spirit Audi 5000 BMW 320i ... VW Scirocco
```

```{r}
groups.4 = cutree(cars.hclust,4)
sapply(unique(groups.4),function(g)cars$Car[groups.4 == g])
```

```
[[1]]
[1] Buick Estate Wagon        Ford Country Squire Wagon Chevy Malibu Wagon       
[4] Chrysler LeBaron Wagon    Chevy Caprice Classic     Ford LTD                 
[7] Mercury Grand Marquis     Dodge St Regis           
38 Levels: AMC Concord D/L AMC Spirit Audi 5000 BMW 320i ... VW Scirocco

[[2]]
 [1] Chevette         Toyota Corona    Datsun 510       Dodge Omni      
 [5] Ford Mustang 4   Mazda GLC        Dodge Colt       AMC Spirit      
 [9] VW Scirocco      Honda Accord LX  Buick Skylark    Pontiac Phoenix 
[13] Plymouth Horizon Datsun 210       Fiat Strada      VW Dasher       
[17] VW Rabbit       
38 Levels: AMC Concord D/L AMC Spirit Audi 5000 BMW 320i ... VW Scirocco

[[3]]
[1] Audi 5000   Saab 99 GLE BMW 320i   
38 Levels: AMC Concord D/L AMC Spirit Audi 5000 BMW 320i ... VW Scirocco

[[4]]
 [1] Volvo 240 GL          Peugeot 694 SL        Buick Century Special
 [4] Mercury Zephyr        Dodge Aspen           AMC Concord D/L      
 [7] Ford Mustang Ghia     Chevy Citation        Olds Omega           
[10] Datsun 810           
38 Levels: AMC Concord D/L AMC Spirit Audi 5000 BMW 320i ... VW Scirocco
```

```{r}
 table(groups.3,cars$Country)
```

```
groups.3 France Germany Italy Japan Sweden U.S.
       1      0       0     0     0      0    8
       2      0       5     1     6      1    7
       3      1       0     0     1      1    7
```

```{r}
aggregate(cars.use,list(groups.3),median)
```

```
  Group.1        MPG     Weight Drive_Ratio Horsepower Displacement  Cylinders
1       1 -0.7945273  1.5051136  -0.9133729  1.0476133    2.4775849  4.7214353
2       2  0.6859228 -0.5870568   0.5269459 -0.6027364   -0.5809970 -0.6744908
3       3 -0.4058377  0.5246039  -0.1686227  0.3587717    0.3272282  2.0234723
```

```{r}
aggregate(cars[,-c(1,2)],list(groups.3),median)
```

```
Group.1   MPG Weight Drive_Ratio Horsepower Displacement Cylinders
1       1 17.30  3.890       2.430      136.5          334         8
2       2 30.25  2.215       3.455       79.0          105         4
3       3 20.70  3.105       2.960      112.5          173         6
```

```{r}
a3 = aggregate(cars[,-c(1,2)],list(groups.3),median)
data.frame(Cluster=a3[,1],Freq=as.vector(table(groups.3)),a3[,-1])
```

```
Cluster Freq   MPG Weight Drive_Ratio Horsepower Displacement Cylinders
1       1    8 17.30  3.890       2.430      136.5          334         8
2       2   20 30.25  2.215       3.455       79.0          105         4
3       3   10 20.70  3.105       2.960      112.5          173         6
```

```{r}
a4 = aggregate(cars[,-c(1,2)],list(groups.4),median)
data.frame(Cluster=a4[,1],Freq=as.vector(table(groups.4)),a4[,-1])
```

```
Cluster Freq  MPG Weight Drive_Ratio Horsepower Displacement Cylinders
1       1    8 17.3  3.890        2.43      136.5          334         8
2       2   17 30.9  2.190        3.37       75.0           98         4
3       3    3 21.5  2.795        3.77      110.0          121         4
4       4   10 20.7  3.105        2.96      112.5          173         6
```

###Please replicate this K-Means [example](http://www.r-statistics.com/2013/08/k-means-clustering-from-r-in-action/). 

```{r}
library(rattle)
library(NbClust)
library(flexclust)
wssplot <- function(data, nc = 15, seed = 1234) {
+     wss <- (nrow(data) - 1) * sum(apply(data, 2, var))
+     for (i in 2:nc) {
+         set.seed(seed)
+         wss[i] <- sum(kmeans(data, centers = i)$withinss)
+     }
+     plot(1:nc, wss, type = "b", xlab = "Number of Clusters", ylab = "Within groups sum of squares")

data(wine, package = "rattle")
head(wine)
```

```
 Type Alcohol Malic  Ash Alcalinity Magnesium Phenols Flavanoids Nonflavanoids
1    1   14.23  1.71 2.43       15.6       127    2.80       3.06          0.28
2    1   13.20  1.78 2.14       11.2       100    2.65       2.76          0.26
3    1   13.16  2.36 2.67       18.6       101    2.80       3.24          0.30
4    1   14.37  1.95 2.50       16.8       113    3.85       3.49          0.24
5    1   13.24  2.59 2.87       21.0       118    2.80       2.69          0.39
6    1   14.20  1.76 2.45       15.2       112    3.27       3.39          0.34
  Proanthocyanins Color  Hue Dilution Proline
1            2.29  5.64 1.04     3.92    1065
2            1.28  4.38 1.05     3.40    1050
3            2.81  5.68 1.03     3.17    1185
4            2.18  7.80 0.86     3.45    1480
5            1.82  4.32 1.04     2.93     735
6            1.97  6.75 1.05     2.85    1450
```

```{r}
df <- scale(wine[-1])
wssplot(df)
```

![pic](http://patellis.files.wordpress.com/2014/04/rplot3.png)

```{r}
set.seed(1234)
nc <- NbClust(df, min.nc = 2, max.nc = 15, method = "kmeans")
```

```
In the plot of Hubert index, we seek a significant knee that corresponds to a significant increase of the value of the measure i.e the significant peak in Hubert index second differences plot."
[1] "*** : The D index is a graphical method of determining the number of clusters. In the plot of D index, we seek a significant knee (the significant peak in Dindex second differences plot) that corresponds to a significant increase of the value of the measure."
[1] "Pseudot2 and Frey indices can be applied only to hierarchical methods "
[1] "All 178 observations were used."
```

![pic](http://patellis.files.wordpress.com/2014/04/rplot012.png)

```{r}
table(nc$Best.n[1, ])
```

```
 0  2  3  8 13 14 15 
 2  3 14  1  2  1  1 
```

```{r}
barplot(table(nc$Best.n[1, ]), xlab = "Numer of Clusters", ylab = "Number of Criteria", 
    main = "Number of Clusters Chosen by 26 Criteria")
```

![pic](http://patellis.files.wordpress.com/2014/04/rplot02.png)

```{r}
set.seed(1234)
fit.km <- kmeans(df, 3, nstart = 25)
fit.km$size
```

```
[1] 62 65 51
```

```{r}
fit.km$centers
```

```{r}
Alcohol      Malic        Ash Alcalinity   Magnesium     Phenols  Flavanoids
1  0.8328826 -0.3029551  0.3636801 -0.6084749  0.57596208  0.88274724  0.97506900
2 -0.9234669 -0.3929331 -0.4931257  0.1701220 -0.49032869 -0.07576891  0.02075402
3  0.1644436  0.8690954  0.1863726  0.5228924 -0.07526047 -0.97657548 -1.21182921
  Nonflavanoids Proanthocyanins      Color        Hue   Dilution    Proline
1   -0.56050853      0.57865427  0.1705823  0.4726504  0.7770551  1.1220202
2   -0.03343924      0.05810161 -0.8993770  0.4605046  0.2700025 -0.7517257
3    0.72402116     -0.77751312  0.9388902 -1.1615122 -1.2887761 -0.4059428
```

```{r}
aggregate(wine[-1], by = list(cluster = fit.km$cluster), mean)
```

```
 cluster  Alcohol    Malic      Ash Alcalinity Magnesium  Phenols Flavanoids
1       1 13.67677 1.997903 2.466290   17.46290 107.96774 2.847581  3.0032258
2       2 12.25092 1.897385 2.231231   20.06308  92.73846 2.247692  2.0500000
3       3 13.13412 3.307255 2.417647   21.24118  98.66667 1.683922  0.8188235
  Nonflavanoids Proanthocyanins    Color       Hue Dilution   Proline
1     0.2920968        1.922097 5.453548 1.0654839 3.163387 1100.2258
2     0.3576923        1.624154 2.973077 1.0627077 2.803385  510.1692
3     0.4519608        1.145882 7.234706 0.6919608 1.696667  619.0588
```

```{r}
ct.km <- table(wine$Type, fit.km$cluster)
ct.km
```

```
 1  2  3
  1 59  0  0
  2  3 65  3
  3  0  0 48
```

```{r}
randIndex(ct.km)
```

```
ARI 
0.897495
```
