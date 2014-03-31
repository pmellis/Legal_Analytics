Classification Trees Exercise 3 
================================

**By:** [Patrick Ellis](http://patellis.wordpress.com/)

**Prompt:** Please replicate the classification example in **[this paper](http://cran.r-project.org/doc/contrib/Zhao_R_and_data_mining.pdf)**.

=================================

```{r}
library(mboost)
library(rpart)
data("bodyfat", package = "mboost")
dim(bodyfat)
```

```
[1] 71 10
```

```{r}
attributes(bodyfat)
```

```
$names
 [1] "age"          "DEXfat"       "waistcirc"    "hipcirc"      "elbowbreadth"
 [6] "kneebreadth"  "anthro3a"     "anthro3b"     "anthro3c"     "anthro4"     

$row.names
 [1] "47"  "48"  "49"  "50"  "51"  "52"  "53"  "54"  "55"  "56"  "57"  "58"  "59" 
[14] "60"  "61"  "62"  "63"  "64"  "65"  "66"  "67"  "68"  "69"  "70"  "71"  "72" 
[27] "73"  "74"  "75"  "76"  "77"  "78"  "79"  "80"  "81"  "82"  "83"  "84"  "85" 
[40] "86"  "87"  "88"  "89"  "90"  "91"  "92"  "93"  "94"  "95"  "96"  "97"  "98" 
[53] "99"  "100" "101" "102" "103" "104" "105" "106" "107" "108" "109" "110" "111"
[66] "112" "113" "114" "115" "116" "117"

$class
[1] "data.frame"
```

```{r}
bodyfat[1:5, ]
```

```
 age DEXfat waistcirc hipcirc elbowbreadth kneebreadth anthro3a anthro3b anthro3c
47  57  41.68     100.0   112.0          7.1         9.4     4.42     4.95     4.50
48  65  43.29      99.5   116.5          6.5         8.9     4.63     5.01     4.48
49  59  35.41      96.0   108.5          6.2         8.9     4.12     4.74     4.60
50  58  22.79      72.0    96.5          6.1         9.2     4.03     4.48     3.91
51  60  36.42      89.5   100.5          7.1        10.0     4.24     4.68     4.15
   anthro4
47    6.13
48    6.37
49    5.82
50    5.66
51    5.91
```

```{r}
set.seed(1234)
ind <- sample(2, nrow(bodyfat), replace = TRUE, prob = c(0.7, 0.3))
bodyfat.train <- bodyfat[ind == 1, ]
bodyfat.test <- bodyfat[ind == 2, ]
myFormula <- DEXfat ~ age + waistcirc + hipcirc + elbowbreadth + kneebreadth
bodyfat_rpart <- rpart(myFormula, data = bodyfat.train, control = rpart.control(minsplit = 10))
attributes(bodyfat_rpart)
```

```
$names
 [1] "frame"               "where"               "call"               
 [4] "terms"               "cptable"             "method"             
 [7] "parms"               "control"             "functions"          
[10] "numresp"             "splits"              "variable.importance"
[13] "y"                   "ordered"            

$xlevels
named list()

$class
[1] "rpart"
```

```{r}
print(bodyfat_rpart$cptable)
```

```
CP nsplit  rel error    xerror       xstd
1 0.67272638      0 1.00000000 1.0194546 0.18724382
2 0.09390665      1 0.32727362 0.4415438 0.10853044
3 0.06037503      2 0.23336696 0.4271241 0.09362895
4 0.03420446      3 0.17299193 0.3842206 0.09030539
5 0.01708278      4 0.13878747 0.3038187 0.07295556
6 0.01695763      5 0.12170469 0.2739808 0.06599642
7 0.01007079      6 0.10474706 0.2693702 0.06613618
8 0.01000000      7 0.09467627 0.2695358 0.06620732
```

```{r}
print(bodyfat_rpart)
```

```{r}
1) root 56 7265.0290000 30.94589  
   2) waistcirc< 88.4 31  960.5381000 22.55645  
     4) hipcirc< 96.25 14  222.2648000 18.41143  
       8) age< 60.5 9   66.8809600 16.19222 *
       9) age>=60.5 5   31.2769200 22.40600 *
     5) hipcirc>=96.25 17  299.6470000 25.97000  
      10) waistcirc< 77.75 6   30.7345500 22.32500 *
      11) waistcirc>=77.75 11  145.7148000 27.95818  
        22) hipcirc< 99.5 3    0.2568667 23.74667 *
        23) hipcirc>=99.5 8   72.2933500 29.53750 *
   3) waistcirc>=88.4 25 1417.1140000 41.34880  
     6) waistcirc< 104.75 18  330.5792000 38.09111  
      12) hipcirc< 109.9 9   68.9996200 34.37556 *
      13) hipcirc>=109.9 9   13.0832000 41.80667 *
     7) waistcirc>=104.75 7  404.3004000 49.72571 *
```

```{r}
plot(bodyfat_rpart)
text(bodyfat_rpart, use.n = T)
```

![plot](http://patellis.files.wordpress.com/2014/03/rplot092.png)

```{r}
opt <- which.min(bodyfat_rpart$cptable[, "xerror"])
cp <- bodyfat_rpart$cptable[opt, "CP"]
bodyfat_prune <- prune(bodyfat_rpart, cp = cp)
print(bodyfat_prune)
```

```
n= 56 

node), split, n, deviance, yval
      * denotes terminal node

 1) root 56 7265.02900 30.94589  
   2) waistcirc< 88.4 31  960.53810 22.55645  
     4) hipcirc< 96.25 14  222.26480 18.41143  
       8) age< 60.5 9   66.88096 16.19222 *
       9) age>=60.5 5   31.27692 22.40600 *
     5) hipcirc>=96.25 17  299.64700 25.97000  
      10) waistcirc< 77.75 6   30.73455 22.32500 *
      11) waistcirc>=77.75 11  145.71480 27.95818 *
   3) waistcirc>=88.4 25 1417.11400 41.34880  
     6) waistcirc< 104.75 18  330.57920 38.09111  
      12) hipcirc< 109.9 9   68.99962 34.37556 *
      13) hipcirc>=109.9 9   13.08320 41.80667 *
     7) waistcirc>=104.75 7  404.30040 49.72571 *
```

```{r}
plot(bodyfat_prune)
text(bodyfat_prune, use.n = T)
```

![plot](http://patellis.files.wordpress.com/2014/03/rplot10.png)

```{r}
DEXfat_pred <- predict(bodyfat_prune, newdata = bodyfat.test)
xlim <- range(bodyfat$DEXfat)
plot(DEXfat_pred ~ DEXfat, data = bodyfat.test, xlab = "Observed", ylab = "Predicted", 
+  ylim = xlim, xlim = xlim)
abline(a = 0, b = 1)
```

![plot](http://patellis.files.wordpress.com/2014/03/rplot11.png)

