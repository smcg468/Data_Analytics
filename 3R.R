#Create test and train data
library(caTools)
set.seed(100)

split = sample.split(diabetesdata$Class, SplitRatio=0.75)

diabetesdata_train = subset(diabetesdata, split == TRUE)
diabetesdata_test = subset(diabetesdata, split== FALSE)

#Logestic Regression Model
theLR <- glm(formula = Class~., data=train_data, family=binomial(link="logit"))
summary(theLR)

#Probabilites
theProbability <- predict(theLR, newdata = test_data, type='response')
theProbability





#The Predictions
thePrediction <- as.numeric(theProbability > 0.5)
thePrediction


#Confusion Matrix 
DPredict <- as.numeric(theTestProbability > 0.5)
DPredict <- as.factor(DPredict)
diabetesdata_test$Class <- as.factor(diabetesdata_test$Class)

library(caret)
confusionMatrix(DPredict, diabetesdata_test$Class)



#Create Dataframe to use for Naïve Bayes
NBDiabetesData <- diabetesdata

#Change Class feature to a factor
NBDiabetesData$Class <- factor(NBDiabetesData$Class)
str(NBDiabetesData$Class)


#Create train and test dataset and the label vectors
split = sample.split(NBDiabetesData$Class, SplitRatio=0.75)
NBDiabetesData_train = subset(NBDiabetesData, split == TRUE)
NBDiabetesData_test = subset(NBDiabetesData, split== FALSE)

NBDiabetesData_train_labels <- NBDiabetesData_train$Class
NBDiabetesData_test_labels <- NBDiabetesData_test$Class


#Train a model on the dataset
Library(e1071)
NBDiabetesDataC1<- naiveBayes(NBDiabetesData_train, NBDiabetesData_train_labels, laplace = 1)

#Compare predictions to actual results
NBDiabetesData_pred_test<- predict(NBDiabetesDataC1, NBDiabetesData_test)
library(gmodels)
CrossTable(NBDiabetesData_pred_test, NBDiabetesData_test_labels, prop.chisq = FALSE,
           prop.c=FALSE,prop.r=FALSE,dnn=c('Predicted', 'Actual') )
