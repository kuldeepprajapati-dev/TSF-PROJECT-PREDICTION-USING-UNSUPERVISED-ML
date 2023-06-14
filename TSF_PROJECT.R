# loading R packages
library(tidyverse)
library(cluster)
library(reshape2)

# Importing downloaded data set
data <- read.csv("C:\\Users\\Kuldeep Kumar\\Downloads\\Iris.csv")

# exploring the dataset
glimpse(data)
head(data)
View(data)

# creating plots
# sepal length v/s sepal width
ggplot(data)+
  geom_point(mapping=aes(x = SepalLengthCm, y = SepalWidthCm), stroke = 2)+
  facet_wrap(~ Species)+ 
  labs(x = "Sepal Length", y = "Sepal Width")+
  theme_bw()

# petal length v/s petal width
ggplot(data)+
  geom_point(aes(x = PetalLengthCm, y = PetalWidthCm), stroke = 2)+
  facet_wrap(~ Species)+ 
  labs(x = "Petal Length", y = "Petal Width")+
  theme_bw()

# sepal length v/s petal length 
ggplot(data)+
  geom_point(aes(x = SepalLengthCm, y = PetalLengthCm), stroke = 2)+
  facet_wrap(~ Species)+ 
  labs(x = "Sepal Length", y = "Petal Length")+
  theme_bw()

# sepal width v/s petal width
ggplot(data)+
  geom_point(aes(x = SepalWidthCm, y = PetalWidthCm), stroke = 2)+
  facet_wrap(~ Species)+ 
  labs(x = "Sepal Width", y = "Petal Width")+
  theme_bw()

# creating block plots
# sepal length v/s species
ggplot(data)+
  geom_boxplot(aes(x = Species, y = SepalLengthCm, fill = Species))+
  theme_bw()

#sepal width v/s species
ggplot(data)+
  geom_boxplot(aes(x = Species, y = SepalWidthCm, fill = Species))+
  theme_bw()

#petal length v/s species
ggplot(data)+
  geom_boxplot(aes(x = Species, y = PetalLengthCm, fill = Species))+
  theme_bw()

#petal width v/s species
ggplot(data)+
  geom_boxplot(aes(x = Species, y = PetalWidthCm, fill = Species))+
  theme_bw()

# K-MEANS CLUSTERING
#finding optimal number of clusters by the Elbow Method
library(stats)
set.seed(123) # for reproduction
wcss <- vector()
for (i in 1:10) {
  kmeans_result <- tryCatch(kmeans(data[, -6], i), error = function(e) e)
  if (inherits(kmeans_result, "error")) {
    break
  } else {
    wcss[i] <- ifelse(is.na(kmeans_result$tot.withinss), 0, kmeans_result$tot.withinss)
  }
}
plot(1:10,
     wcss,
     type = "b",
     main = "The Elbow Method",
     xlab = "Number of Clusters",
     ylab = "WCSS"
)

# Apply k-means function to the feature columns                                                
set.seed(123)
km <- kmeans( x = data[, -6] , centers = 3)
yclus <- km$cluster
table(yclus)
                            
 # Visualize the kmeans clusters
clusplot(data[, -6],
         yclus,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 0,
         plotchar = FALSE,
         span = TRUE,
         main = paste('Clusters of Iris Flowers')
)

# comparing the clusters                            
data$cluster.kmean <- yclus
cm <- table(data$Species, data$cluster.kmean)
cm

# creating Scatter plots                             
data$cluster.kmean <- as.factor(data$cluster.kmean)
# Sepal-Length vs. Sepal-Width (Species)
ggplot(data)+
  geom_point(aes(x = SepalLengthCm, y = SepalWidthCm, 
                 color = Species) , size = 10)+ 
  labs(x = 'Sepal Length', y = 'Sepal Width')+
  ggtitle("Species")+
  theme_bw()
# Sepal-Length vs. Sepal-Width (kmeans cluster)
ggplot(data)+
  geom_point(aes(x = SepalLengthCm, y = SepalWidthCm, 
                 color = cluster.kmean) , size = 10)+ 
  labs(x = 'Sepal Length', y = 'Sepal Width')+
  ggtitle("kmeans Cluster")+
  theme_bw()

# Petal-Length vs. Petal-Width (Species)
ggplot(data)+
  geom_point(aes(x = PetalLengthCm, y = PetalWidthCm, 
                 color = Species) , size = 10)+ 
  labs(x = 'Petal Length', y = 'Petal Width')+
  ggtitle("Species")+
  theme_bw()
# Petal-Length vs. Petal-Width (kmeans cluster)
ggplot(data)+
  geom_point(aes(x = PetalLengthCm, y = PetalWidthCm, 
                 color = cluster.kmean) , size = 10)+ 
  labs(x = 'Petal Length', y = 'Petal Width')+
  ggtitle("kmeans Cluster")+
  theme_bw()                            
                            

