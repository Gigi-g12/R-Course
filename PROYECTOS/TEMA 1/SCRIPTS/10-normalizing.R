housing <- read.csv("DATA/BostonHousing.csv")
housing.z <-scale(housing, center= TRUE,scale=TRUE)

housing.none <- scale(housing, center =FALSE, scale=FALSE)

#sd = sqrt(sum(x^2/n-1)) donde n es el número de tomas

scale.many <- function(dataframe, cols){
  names <- names(dataframe)
  for(col in cols){
    name <- paste(names[col],"z", sep =".")
    dataframe[name] <- scale(dataframe[,col])
  }
  cat(paste("Hemos normalizado", length(cols)," variable(s)"))
  dataframe
}

housing<- scale.many(housing,c(1,3,5:8))
