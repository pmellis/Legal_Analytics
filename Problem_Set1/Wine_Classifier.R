# File-Name:       email_Classifier.R           
# Due:             02/28/14                                
# By:              Patrick Ellis
# Prompt:          Please Replicate the Wine Quality Classifier
# Data Used:       Available at http://www.nd.edu/~mclark19/learn/data/goodwine.csv

# Load packages (will load requireds as well)
library(doSNOW) # Foreach parallel adaptor for the snow package.
library(corrplot) # Visualization of a correlation matrix.
library(caret) # Classification and Regression Training. 

# Import data
wine <- read.csv("http://www.nd.edu/~mclark19/learn/data/goodwine.csv")

# The registerDoSNOW function is used to register the SNOW parallel backend with the foreach package.
registerDoSNOW(makeCluster(3, type = "SOCK"))

# The corrplot package is a graphical display of a correlation matrix, confidence interval.
corrplot(cor(wine[, -c(13, 15)]), method = "number", tl.cex = 0.5)

# K-nearest neighbors approach gives the value of how far an
# observation is from some other, given their respective values on a set of variables.

set.seed(1234) #so that the indices will be the same when re-run
trainIndices <- createDataPartition(wine$good, p = 0.8, list = F)
wanted <- !colnames(wine) %in% c("free.sulfur.dioxide", "density", "quality", "color", "white")
wine_train <- wine[trainIndices, wanted] #remove quality and color, as well as density and others
wine_test <- wine[-trainIndices, wanted]

# Initial look at predictors
wine_trainplot = predict(preProcess(wine_train[,-10], method="range"),
wine_train[,-10])
featurePlot(wine_trainplot, wine_train$good, "box")

# 10-fold cross validation; set up a set of values for k
set.seed(1234)
cv_opts <- trainControl(method="cv", number=10)
knn_opts <- data.frame(.k=c(seq(3, 11, 2), 25, 51, 101)) #odd to avoid ties
results_knn <- train(good~., data=wine_train, method="knn",preProcess="range", trControl=cv_opts,tuneGrid = knn_opts)

# Model test set performance
preds_knn = predict(results_knn, wine_test[,-10])
confusionMatrix(preds_knn, wine_test[,10], positive='Good')

# Test performance output
Confusion Matrix and Statistics

          Reference
Prediction Bad Good
      Bad  285  162
      Good 191  660
                                         
               Accuracy : 0.728          
                 95% CI : (0.703, 0.7521)
    No Information Rate : 0.6333         
    P-Value [Acc > NIR] : 2.762e-13      
                                         
                  Kappa : 0.4069         
 Mcnemar's Test P-Value : 0.1361         
                                         
            Sensitivity : 0.8029         
            Specificity : 0.5987         
         Pos Pred Value : 0.7756         
         Neg Pred Value : 0.6376         
             Prevalence : 0.6333         
         Detection Rate : 0.5085         
   Detection Prevalence : 0.6556         
      Balanced Accuracy : 0.7008         
                                         
       'Positive' Class : Good   
