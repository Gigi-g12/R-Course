##Partir datos en dos subconjuntos. particiones
##Una usada para construir el modelo con ML y la otra se guarda para evaluar el modelo.

install.packages("caret")
library(caret)

setwd("GitHub/R-Course/PROYECTOS/TEMA 2/")

##variables númericas
data <- read.csv("DATA/BostonHousing.csv")

View(data)


##creas una particion con el 80% luego una data con esos ids y el restante
training.ids <- createDataPartition(data$MEDV,p = 0.8, list =F)
data.training <- data[training.ids, ]
data.validation <- data[-training.ids,]

#CreateDataPartition aleatoriamente crea indices de la variable especificada. Hace un sampling con muestreo

training.ids.2 <- createDataPartition(data$MEDV, p =0.7, list =F)
data.training.2 <- data[training.ids.2,]
temp <- data[-training.ids.2,]
validation.ids.2 <- createDataPartition(temp$MEDV, p =0.5, list =F)
data.validation <- temp[validation.ids.2,]
data.testing <- temp[-validation.ids.2,]


##Variables categóricas

data2 <- read.csv("DATA/boston-housing-classification.csv")
training.ids.3 <- createDataPartition(data2$MEDV_CAT, p = 0.7, list =F)
data.training.3 <- data2[training.ids.3,]
data.validation.3 <- data2[-training.ids.3,]


rda.cb.partition2 <- function(dataframe,target.index, prob){
  library(caret)
  training.ids <- createDataPartition(dataframe[,target.index], p = prob, list= FALSE)
  list(train = dataframe[training.ids,],val = dataframe[-training.ids,])
}

rda.cb.partition3 <- function(dataframe, target.index, prob.train, prob.val){
  library(caret)
  training.ids <- createDataPartition(dataframe[,target.index], p = prob.train, list = F)
  train.data <- dataframe[training.ids,]
  temp <- dataframe[-training.ids,]
  validation.ids <- createDataPartition(temp[,target.index], p = prob.val, list = FALSE)
  list(train = train.data, val = temp[validation.ids,], test = temp[-validation.ids,])
}

data1 <- rda.cb.partition2(data,14, 0.8)
data2 <- rda.cb.partition3(data2, 14, 0.7,0.5)


head(data2$test)

sample1 <- sample(data$CRIM, 40, replace = T)
