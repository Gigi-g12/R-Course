data <- read.csv("/DATA/missing-data.csv", na.strings ="")

data$Income.mean <- ifelse(is.na((data$Income)),
                           mean(data$Income, na.rm =TRUE),
                           data$Income
                           )
suma <- function(z,y){
  x+y
}

#x es un vetor que puede contener NA
rand.impute <- function(m){
  #vector con booleano de un NA existente
  missing <- is.na(m)
  #n.missing contiene cuantos valores son N/A
  n.missing <- sum(missing)
  #x.obs son los valores que tienen datos diferente de NA en x
  x.obs <- m[!missing]
  #por defecto, devolcere lo mismo que había entrado por parámetro
  imputed <- m
  #en los valores faltantes se reemplazan por muestra de los que sí se conocen
  imputed[missing] <- sample(x.obs,n.missing, replace =TRUE)
  return(imputed)
}

random.impute.data.frame <- function(dataframe, cols){
  names <- names(dataframe)
  for(col in cols){
    name <- paste(names[col],".imputed", sep ="" )
    dataframe[name] = rand.impute(dataframe[,col])
  }
  dataframe
}

data <- random.impute.data.frame(data,c(1,2))
data$Income[data$Income == 0] <-NA
