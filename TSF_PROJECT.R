library(tidyverse)
library(cluster)
library(reshape2)
data <- read.csv("C:\\Users\\Kuldeep Kumar\\Downloads\\Iris.csv")
glimpse(data)
head(data)
View(data)
ggplot(data)+
  geom_point(mapping=aes(x = SepalLengthCm, y = SepalWidthCm), stroke = 2)+
  facet_wrap(~ Species)+ 
  labs(x = "Sepal Length", y = "Sepal Width")+
  theme_bw()

ggplot(data)+
  geom_point(aes(x = PetalLengthCm, y = PetalWidthCm), stroke = 2)+
  facet_wrap(~ Species)+ 
  labs(x = "Petal Length", y = "Petal Width")+
  theme_bw()

ggplot(data)+
  geom_point(aes(x = SepalLengthCm, y = PetalLengthCm), stroke = 2)+
  facet_wrap(~ Species)+ 
  labs(x = "Sepal Length", y = "Petal Length")+
  theme_bw()
ggplot(data)+
  geom_point(aes(x = SepalWidthCm, y = PetalWidthCm), stroke = 2)+
  facet_wrap(~ Species)+ 
  labs(x = "Sepal Width", y = "Petal Width")+
  theme_bw()

ggplot(data)+
  geom_boxplot(aes(x = Species, y = SepalLengthCm, fill = Species))+
  theme_bw()

ggplot(data)+
  geom_boxplot(aes(x = Species, y = SepalWidthCm, fill = Species))+
  theme_bw()

ggplot(data)+
  geom_boxplot(aes(x = Species, y = PetalLengthCm, fill = Species))+
  theme_bw()

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

set.seed(123)
km <- kmeans( x = data[, -6] , centers = 3)
yclus <- km$cluster
table(yclus)

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
data$cluster.kmean <- yclus
cm <- table(data$Species, data$cluster.kmean)
cm

install.packages("stringi")

library(reshape2)  # Load the reshape2 package

mtable <- melt(cm)
ggplot(mtable) +
  geom_tile(aes(x = Var1, y = Var2, fill = value)) +
  labs(x = "Species", y = "kmeans Cluster") +
  theme_bw()
