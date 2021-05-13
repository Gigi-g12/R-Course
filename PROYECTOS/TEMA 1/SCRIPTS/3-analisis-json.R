install.packages("jsonlite")
library(jsonlite)

dat.1 <- fromJSON("TEMA 1/DATA/students.json")
dat.2 <- fromJSON("TEMA 1/DATA/student-courses.json")

url <- "http://www.floatrates.com/daily/usd.json"
currencies <-fromJSON(url)

currencies.data <- lapply(currencies, function(x){
  x[sapply(x, is.null)]<-NA
  unlist(x)
})
currencies.data <- as.data.frame(do.call("cbind",currencies.data))
currencies.data <-data.frame(t(currencies.data),row.names = NULL)

dat.1[c(2,5,8),]
dat.1[,c(2,5)]
