#Installing and loading the libraries
install.packages("recommenderlab", dependencies=TRUE)
#install.packages("Matrix")
library("recommenderlab")
library(caTools)

# Read movie rating data  ###
movie_rate_data <- read.csv(file.choose())  #metadata about the variable
str(movie_rate_data)
View(movie_rate_data)
#Rating distribution
hist(movie_rate_data$rating)
#the datatype should be realRatingMatrix inorder to build recommendation engine
movie_rate_data_matrix <- as(movie_rate_data, 'realRatingMatrix')
#Popularity based 
movie_recomm_model1 <- Recommender(movie_rate_data_matrix, method="POPULAR")
#Predictions
recommended_items1 <- predict(movie_recomm_model1, movie_rate_data_matrix[1], n=4)
as(recommended_items1, "list")

#User Based Collaborative Filtering
movie_recomm_model2 <- Recommender(movie_rate_data_matrix, method="UBCF")
#Predictions 
recommended_items2 <- predict(movie_recomm_model2, movie_rate_data_matrix[1], n=3)
as(recommended_items2, "list")
