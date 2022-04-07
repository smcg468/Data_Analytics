library(caret)
install.packages("factoextra")
library(factoextra)
library(data.table)


#Create PCA
data.pca <- prcomp(diabetesdatanona, center = TRUE, scale. = TRUE)
summary(data.pca)

#Visualise PCA
fviz_eig(data.pca)
fviz_pca_var(data.pca, col.var = "contrib", gradient.col = c("green", "orange", "red"), repl = TRUE)

#Biplot
fviz_pca_biplot(data.pca, repel = TRUE, col.var = "red",col.ind = "green")


#Correlation matrix
diabetesdata.cor <- cor(diabetesdatanona[,1:16])
print(diabetesdata.cor)


#Most highly correlated variables
highCorrelation <- findCorrelation(diabetesdata.cor, cutoff=0.5, names=TRUE)
print(highCorrelation)

#Creating Age categories
dataTable <- setDT(diabetesdata)

setDT(dataTable) [Age >= 0.16 & Age <= 0.24, ageCategory := "16-24" ]
dataTable[Age >= 0.25 & Age <= 0.39, ageCategory := "25-39" ]
dataTable[Age >= 0.40 & Age <= 0.64, ageCategory := "40-64" ]
dataTable[Age >= 0.65, ageCategory := "65+" ]

#Barplot Number of patients in each age category
barplot(dataTable$ageCategory)
