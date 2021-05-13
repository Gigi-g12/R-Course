install.packages("tidyr")
library(tidyr)

crime.data <- read.csv("DATA/USArrests.csv", 
                       stringsAsFactors = FALSE,
                       header = TRUE)
View(crime.data)

crime.data <- cbind(state = rownames(crime.data),crime.data)

crime.data.1 <- gather(crime.data,
                       key = "crime_type", 
                       value= "arrest_estimate",
                       Murder : UrbanPop)

crime.data.2 <- gather(crime.data,
                       key ="crime_type", 
                       value ="arrest_estimate",
                       -state)

crime.data.3 <-gather(crime.data,
                      key = "crime_type",
                      value = "arrest_estimate", 
                      Murder,Assault)
View(crime.data.3)

crime.data.4 <- spread(crime.data.2, 
                       key = "crime_type", 
                       value = "arrest_estimate")

crime.data.5 <- unite(crime.data, 
                      col = "Murder_Assault",
                      Murder, Assault, 
                      sep ="_")

