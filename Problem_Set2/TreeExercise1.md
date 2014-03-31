Classification Trees Exercise 1 
================================

**By:** [Patrick Ellis](http://patellis.wordpress.com/)

**Prompt:** Please replicate the classification example in **[this video](https://www.youtube.com/watch?v=kdUVUINpFmI)**.

=================================

###Initial Steps

```{r}
data(iris)
names(iris)
```

```
[1] "Sepal.Length" "Sepal.Width"  "Petal.Length" "Petal.Width"  "Species"
```

```{r}
table(iris$Species)
```

```
setosa versicolor  virginica 
   50         50         50 
```

```{r}
plot(iris$Petal.Width, iris$Sepal.Width, pch = 19, col = as.numeric(iris$Species))
legend(1, 4.5, legend = unique(iris$Species), col = unique(as.numeric(iris$Species)),pch = 19)
```

![plot](http://patellis.files.wordpress.com/2014/03/rplot.png)

###Building the Tree

```{r}
library(tree)
tree1 <- tree(Species ~ Sepal.Width + Petal.Width, data = iris)
summary(tree1)
```

```
Classification tree:
tree(formula = Species ~ Sepal.Width + Petal.Width, data = iris)
Number of terminal nodes:  5 
Residual mean deviance:  0.204 = 29.57 / 145 
Misclassification error rate: 0.03333 = 5 / 150 
```

```{r}
plot(tree1)
text(treee1)
```

![plot](http://patellis.files.wordpress.com/2014/03/rplot02.png)

###Plot Splits

```{r}
plot(iris$Petal.Width, iris$Sepal.Width, pch = 19, col = as.numeric(iris$Species))
partition.tree(tree1, label = "Species", add = TRUE)
legend(1.75, 4.5, legend = unique(iris$Species), col = unique(as.numeric(iris$Species)),pch = 19)
```

![plot](http://patellis.files.wordpress.com/2014/03/rplot03.png)

