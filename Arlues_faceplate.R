install.packages("arules") # install the package arules
library("arules") # invoke the package
install.packages("readxl")# install the package readxl
library(readxl)

mydata <- read_xlsx(file.choose(),1) # Read xlsx file

rules <-  apriori(as.matrix(mydata[,2:7]),parameter=list(support=0.2,confidence=0.7)) 
?apriori  # To get Help or You can see the Apriori algorithm details..

inspect(rules)

inspect(sort(rules, by="lift"))

#inspect(head(sort(rules, by="lift")))
qnorm(0.975)
qnorm(0.95)
qnorm(0.995)

