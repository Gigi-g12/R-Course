students <- read.csv("DATA/data-conversion.csv")

bp <- c(-Inf, 10000, 31000,Inf)
names <- c("Low","Average","High")


#dummy variables
students$Income.cat <- cut(students$Income,breaks = bp, labels = names)
install.packages("dummies")
library(dummies)


students.dummy <- dummy.data.frame(students,sep =".")
dummy.data.frame(students, names = c("State","Gender"), sep =".")