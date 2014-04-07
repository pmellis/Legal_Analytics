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


###Please replicate this K-Means [example](http://www.r-statistics.com/2013/08/k-means-clustering-from-r-in-action/). 



