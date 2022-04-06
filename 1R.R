#Reading dataset into R
diabetesdata <- read.csv('diabetes_data_upload.csv')

#Viewing Dataset
diabetesdata

#Installing Skimr Library
library(skimr)

#Skimming dataset to provide brief Overview
skim(diabetesdatanona)

#Removing Unneccessary attribute
diabetesdata$partial.paresis <- NULL

#Renaming Column Names
colnames(diabetesdata) <- c('Age',
                            'Gender',
                            'Polyuria',
                            'Polydipsia',
                            'SuddenWeightLoss',
                            'Weakness',
                            'Polyphagia',
                            'GenitalThrush',
                            'VisualBlurring',
                            'Itching',
                            'Irritability',
                            'DelayedHealing',
                            'MuscleStiffness',
                            'Alopecia',
                            'Obesity',
                            'Class'
)



# create a dataset
Gender <- diabetesdata$Gender
Class <- diabetesdata$Class
data <- data.frame(table(Gender, Class, count))
value<- nrow(diabetesdata)

# Stacked barplot comparing age against class
ggplot(data, aes(fill=Class, y=value, x=Gender)) + 
  geom_bar(position="stack", stat="identity") +
  ggtitle('Gender Compared against Positive / Negative Results')


