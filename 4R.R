#Create barplot comparing male and female diabetes results
gendervclass <- xtabs(~ Class + Gender, data=diabetesdata)
barplot(as.matrix(gendervclass),col=c("red","green"), names.arg=c("Female","Male"), xlab='Gender', ylab = 'Diabetes Result Count')


#ROC Curve for the logistic regression model
install.packages("ROSE")
library(ROSE)

logistic_predict <- predict(theLR, newdata=diabetesdata)
roc.curve(diabetesdata$Class, logistic_predict)


#ROC Curve for the Naive Bayes model
library(ROSE)

naive_bayes_predict <- predict(NBDiabetesDataC, newdata = diabetesdata)
roc.curve(diabetesdata$Class, naive_bayes_predict)

