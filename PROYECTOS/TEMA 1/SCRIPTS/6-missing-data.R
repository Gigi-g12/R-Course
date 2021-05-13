data <- read.csv("DATA/missing-data.csv", na.strings = "")
data.cleaned <-na.omit(data)
is.na(data$Income)

#limpiar NA de solamente la variable income
data[!is.na(data$Income),]
#filas completas para un data frame
complete.cases(data)

data.cleaned.2 <-data[complete.cases(data),]

#Convertir los ceros de ingresos en NA

data$Income[data$Income == 0] <-NA

#Medidas de centralización y dispersión
mean(data$Income)
mean(data$Income, na.rm = TRUE)

