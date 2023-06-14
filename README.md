# TSF-PROJECT-PREDICTION-USING-UNSUPERVISED-ML
![image](https://github.com/kuldeepprajapati-dev/TSF-PROJECT-PREDICTION-USING-UNSUPERVISED-ML/assets/125523468/4f147ec5-46f1-434c-ac2e-89f9f91b2eb7)

This R project is part of my submission for DATA SCIENCE & BUSINESS ANALYTICS INTERNSHIP @ THE SPARKS FOUNDATION for the month of JUNE 2023.
# Purpose/Task: Predict the optimum no. of clusters in the given IRIS dataset & representing it visually.

Following is the output of each code segment in the TSF_PROJECT.R file.
#3 a) glimpse(data)
Rows: 150
Columns: 6
$ Id            <int> 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, …
$ SepalLengthCm <dbl> 5.1, 4.9, 4.7, 4.6, 5.0, 5.4, 4.6, 5.0, 4.4, 4.9, 5.4, 4.8, 4.8, 4.3, 5.8, 5.7, 5.4, 5.…
$ SepalWidthCm  <dbl> 3.5, 3.0, 3.2, 3.1, 3.6, 3.9, 3.4, 3.4, 2.9, 3.1, 3.7, 3.4, 3.0, 3.0, 4.0, 4.4, 3.9, 3.…
$ PetalLengthCm <dbl> 1.4, 1.4, 1.3, 1.5, 1.4, 1.7, 1.4, 1.5, 1.4, 1.5, 1.5, 1.6, 1.4, 1.1, 1.2, 1.5, 1.3, 1.…
$ PetalWidthCm  <dbl> 0.2, 0.2, 0.2, 0.2, 0.2, 0.4, 0.3, 0.2, 0.2, 0.1, 0.2, 0.2, 0.1, 0.1, 0.2, 0.4, 0.4, 0.…
$ Species       <chr> "Iris-setosa", "Iris-setosa", "Iris-setosa", "Iris-setosa", "Iris-setosa", "Iris-setosa…
#3 b) head(data)
   Id SepalLengthCm SepalWidthCm PetalLengthCm PetalWidthCm     Species
1  1           5.1          3.5           1.4          0.2 Iris-setosa
2  2           4.9          3.0           1.4          0.2 Iris-setosa
3  3           4.7          3.2           1.3          0.2 Iris-setosa
4  4           4.6          3.1           1.5          0.2 Iris-setosa
5  5           5.0          3.6           1.4          0.2 Iris-setosa
6  6           5.4          3.9           1.7          0.4 Iris-setosa
#3 b)View(data)
  ![image](https://github.com/kuldeepprajapati-dev/TSF-PROJECT-PREDICTION-USING-UNSUPERVISED-ML/assets/125523468/f7740fba-f521-4166-b40d-a76edf157c55)
#5 ![image](https://github.com/kuldeepprajapati-dev/TSF-PROJECT-PREDICTION-USING-UNSUPERVISED-ML/assets/125523468/c2fd3fa9-4b54-417f-8acd-017e290cc532)
#6 ![image](https://github.com/kuldeepprajapati-dev/TSF-PROJECT-PREDICTION-USING-UNSUPERVISED-ML/assets/125523468/87c3cfe5-fcc3-4204-8d6c-cc1dd383dd21)
#7![05ad3d8d-6d00-466b-be62-05a6c7bb053a](https://github.com/kuldeepprajapati-dev/TSF-PROJECT-PREDICTION-USING-UNSUPERVISED-ML/assets/125523468/cf18b419-a590-45e0-9fb9-186eaba78c3c)
#8 ![image](https://github.com/kuldeepprajapati-dev/TSF-PROJECT-PREDICTION-USING-UNSUPERVISED-ML/assets/125523468/9dc12ea5-d8b8-4949-8785-4ee2b81bf0e2)
#10 ![image](https://github.com/kuldeepprajapati-dev/TSF-PROJECT-PREDICTION-USING-UNSUPERVISED-ML/assets/125523468/23b0956d-afb4-40a5-81e1-35b82e1d4ed8)
#11 ![image](https://github.com/kuldeepprajapati-dev/TSF-PROJECT-PREDICTION-USING-UNSUPERVISED-ML/assets/125523468/01b3910d-3aa4-4fcb-8fd3-03fa0bea8648)
#12 ![image](https://github.com/kuldeepprajapati-dev/TSF-PROJECT-PREDICTION-USING-UNSUPERVISED-ML/assets/125523468/366b2a9d-90fe-44d1-81eb-9a55dc70a796)
#13 ![image](https://github.com/kuldeepprajapati-dev/TSF-PROJECT-PREDICTION-USING-UNSUPERVISED-ML/assets/125523468/ad4de43e-9468-4ad5-b752-cdc11a0dc73d)
#15 ![image](https://github.com/kuldeepprajapati-dev/TSF-PROJECT-PREDICTION-USING-UNSUPERVISED-ML/assets/125523468/8daabe0b-776f-460d-afb7-3f30e9b34a6a)
  thus the elbow point is k=3 in above plot.
#16 output:
  yclus
 1  2  3 
50 50 50
  i.e. the k-means has grouped the data into 3 clusters 1, 2 & 3 respectively having 50 observations each.
  #17 ![image](https://github.com/kuldeepprajapati-dev/TSF-PROJECT-PREDICTION-USING-UNSUPERVISED-ML/assets/125523468/e467f945-2903-4099-b010-8e6af7804b4e)
#18 output:
                    1  2  3
  Iris-setosa     50  0  0
  Iris-versicolor  0 50  0
  Iris-virginica   0  0 50
  i.e. {[(50 + 50 + 50)*100]/150} = 100%  of the k-means cluster output matched with the actual Species clusters. 
  versicolor(Cluster 2) & virginica(Cluster 3) have some overlapping features which is also apparent from the cluster visualizations.
  #20 ![image](https://github.com/kuldeepprajapati-dev/TSF-PROJECT-PREDICTION-USING-UNSUPERVISED-ML/assets/125523468/a6699032-4f24-4055-88bd-89e31dd224da)
#21 ![image](https://github.com/kuldeepprajapati-dev/TSF-PROJECT-PREDICTION-USING-UNSUPERVISED-ML/assets/125523468/bc67f015-6af4-4d1b-ab37-12d03c381edb)
 #22 ![image](https://github.com/kuldeepprajapati-dev/TSF-PROJECT-PREDICTION-USING-UNSUPERVISED-ML/assets/125523468/d903688c-a911-4639-af79-2a4361af127d)
#23 ![image](https://github.com/kuldeepprajapati-dev/TSF-PROJECT-PREDICTION-USING-UNSUPERVISED-ML/assets/125523468/a650d51c-9b2d-4a20-904f-5a872623a23b)
# Result: The optimum no. of clusters is "3" & Visualisations are above ☝🏻.


