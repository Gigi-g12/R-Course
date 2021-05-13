housing.data <- read.csv("DATA/housing-with-missing-value.csv")
install.packages("dummies")
library(dummies)

##eliminar na 

housing.data.1 <- na.omit(housing.data)

##eliminar na en ciertas columnas
drop_na <- c("rad")
housing.data.2 <- housing.data[complete.cases(housing.data[,!(names(housing.data)%in% drop_na)]),]

install.packages("Hmisc")
library(Hmisc)

housing.data.copy <- housing.data

housing.data.copy$ptratio <- impute(housing.data.copy$ptratio, mean)
housing.data.copy$rad <- impute(housing.data.copy$rad, mean)

summary(housing.data.copy)

housing.data.copy2 <- housing.data
housing.data.copy2$ptratio <- impute(housing.data.copy2$ptratio, median)
housing.data.copy2$rad <- impute(housing.data.copy2$rad, median)

summary(housing.data.copy2)

install.packages("mice")
library(mice)

md.pattern(housing.data)
install.packages("VIM")
library(VIM)

aggr(housing.data,
     col = c('light blue','red'),
     numbers =TRUE, 
     sortVars =TRUE,
     labels = names(housing.data),
     cex.axis =0.5,
     gap =1,
     ylab =c("Histograma de NAs", "Patrón"))

