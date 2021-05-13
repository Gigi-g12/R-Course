setwd("GitHub/R-Course/PROYECTOS/TEMA 2/")

data<- read.csv("DATA/auto-mpg.csv",
                header=TRUE, 
               stringsAsFactors = FALSE)


data$cylinders <-factor(data$cylinders
                        , levels = c(3,4,5,6,8)
                        , labels = c("3cil","4cil","5cil","6cil","8cil"))

summary(data)
str(data)

install.packages(c("modeest","raster","moments"))
library(modeest) #moda
library(raster) #cuartiles y coeficiente de variación
library(moments) #coeficiente de asimetria, curtosis



##Medicas de centralización (Cómo de centrados están los datos)
##Media aritmética, mediana, moda, percentiles

X = data$mpg

#media 
mean(X)

#mediana
median(X)

#moda
mfv(X)

#percentiles
quantile(X)

##Medidas de dispersión (Cuán dispersos están los datos)
##Varianza, desviación estándar, coeficiente de variación

#Varianza
var(X)
#Desviación estándar
sd(X)
#CV
cv(X)

##Momento de orden r respecto de la media - Medidas de asimetría

#Fisher 
#Curtosis
skewness(X)
kurtosis(X)

hist(X)
par(mfrow=c(1,1))
