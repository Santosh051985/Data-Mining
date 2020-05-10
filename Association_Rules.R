#install packages for association rule
install.packages("arules")
data()
library("Matrix")
# Used for building association rules i.e. apriori algorithm
library("arules") 
# loading the Groceries Data
data("Groceries")
# To get help regarding Groceries
?Groceries 
inspect(Groceries[1:20])# showing only top 10 transactions
head(Groceries)
#class(Groceries) # Groceries is in transactions format

install.packages("arueslViz")
library("arulesViz") # for visualizing rules

# making rules using apriori algorithm 
# Keep changing support and confidence values to obtain different rules
?apriori
# Building rules using apriori algorithm
arules <- apriori(Groceries, parameter = list(support=0.002,confidence=0.6))
arules
inspect(head(sort(arules,by="lift"))) # to view we use inspect 

# Overal quality =to chck vakues for confidence and support
head(quality(arules))

# Different Methods of Visualizing Rules###
plot(arules)
windows()
plot(arules,method="grouped")
plot(arules[1:20],method = "graph") 
# for good visualization try plotting only few rules


write(arules, file="a_rules.csv",sep=",")

#getwd()
