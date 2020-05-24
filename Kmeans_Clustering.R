# install packages in kernel###
install.packages("plyr")
library(plyr)

x <-  runif(50) # generating 50 random numbers for calculation
#unif is uniform distributrution , values lie between 0 and 1 only

x
y <-  runif(50) # generating 50 random numbers 
y

data <- cbind(x,y) 
data

plot(data)

plot(data, type="n")
text(data, rownames(data))

km <- kmeans(data,5) #kmeans clustering
str(km)
km$cluster

install.packages("animation")
library(animation)

km <- kmeans.ani(data, 5)
km$centers

max_centers=12
# selecting K for kmeans clustering using kselection
install.packages("kselection")
library(kselection)
?kselection
data()
?iris
View(iris)
k <- kselection(iris[,-5], parallel = TRUE, k_threshold = 0.9, )

?kselection

install.packages("doParallel")
library(doParallel)
registerDoParallel(cores=4)
k <- kselection(iris[,-5], parallel = TRUE, k_threshold = 0.9, max_centers=12)
k
input <- read.csv("Universities_Clustering.csv")
mydata <- input[1:25,c(1:7)]
normalized_data <- scale(mydata[,2:7])
fit <- kmeans(normalized_data, 5) # 4 cluster solution
str(fit)
final2<- data.frame(mydata, fit$cluster) # append cluster membership
final2
final3 <- final2[,c(ncol(final2),1:(ncol(final2)-1))]
View(final3)
aggregate(mydata[,2:7], by=list(fit$cluster), FUN=mean)

#elbow curve & k ~ sqrt(n/2) to decide the k value

wss = (nrow(normalized_data)-1)*sum(apply(normalized_data, 2, var))		 # Determine number of clusters by scree-plot 
for (i in 1:8) wss[i] = sum(kmeans(normalized_data, centers=i)$withinss)
plot(1:8, wss, type="b", xlab="Number of Clusters", ylab="Within groups sum of squares")   # Look for an "elbow" in the scree plot #
title(sub = "K-Means Clustering Scree-Plot")
?apply

# k clustering alternative for large dataset - Clustering Large Applications (Clara)
install.packages("cluster")
library(cluster)
xds <- rbind(cbind(rnorm(5000, 0, 8), rnorm(5000, 0, 8)), cbind(rnorm(5000, 50, 8), rnorm(5000, 50, 8)))
xcl <- clara(xds, 2, sample = 100)
str(xcl)
clusplot(xcl)

#Partitioning around medoids
#mediods when you cannot determine centroids
xpm <- pam(xds, 2)
clusplot(xpm)
