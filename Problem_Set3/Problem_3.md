##Problem 3: H-Clustering and K Means 

=======================================================

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
groups.3 = cutree(cars.hclust, 3)
table(groups.3)
```

```
groups.3
 1  2  3 
 8 20 10 
```

```{r}
counts = sapply(2:6, function(ncl) table(cutree(cars.hclust, ncl)))
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
sapply(unique(groups.3), function(g) cars$Car[groups.3 == g])
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
table(groups.3, cars$Country)
```

```
groups.3 France Germany Italy Japan Sweden U.S.
       1      0       0     0     0      0    8
       2      0       5     1     6      1    7
       3      1       0     0     1      1    7
```

```{r}
aggregate(cars.use, list(groups.3), median)
```

```
Group.1        MPG     Weight Drive_Ratio Horsepower Displacement  Cylinders
1       1 -0.7945273  1.5051136  -0.9133729  1.0476133    2.4775849  4.7214353
2       2  0.6859228 -0.5870568   0.5269459 -0.6027364   -0.5809970 -0.6744908
3       3 -0.4058377  0.5246039  -0.1686227  0.3587717    0.3272282  2.0234723
```

```{r}
a3 = aggregate(cars[, -c(1, 2)], list(groups.3), median)
data.frame(Cluster = a3[, 1], Freq = as.vector(table(groups.3)), a3[, -1])
```

```
  Cluster Freq   MPG Weight Drive_Ratio Horsepower Displacement Cylinders
1       1    8 17.30  3.890       2.430      136.5          334         8
2       2   20 30.25  2.215       3.455       79.0          105         4
3       3   10 20.70  3.105       2.960      112.5          173         6
```

```{r}

```

```{r}

```

```{r}

```






###Please replicate this K-Means [example](http://www.r-statistics.com/2013/08/k-means-clustering-from-r-in-action/). 



