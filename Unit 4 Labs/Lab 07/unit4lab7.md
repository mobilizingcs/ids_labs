Finding Clusters
========================================================
transition: rotate
transition-speed: slow
css: ../../IDSLabCSS.css

Unit 4 - Lab 7

Directions: Follow along with the slides and answer the questions in **red** font in your journal.
 



New Data!
====================

- Today, we will be using the `Cars93` data set from the `MASS` package in R. Take a moment to look at the data


```r
library(MASS)
```

```r
View(Cars93)
```

Let's plot 2 variables
====================

- There are many numerical variables in this data set. For now, let's just focus on `MPG.city` and `MPG.highway`.
- Create a scatterplot of the two variables.
- **Does it look like there could be some sort of hidden clusters in the data?**
- **If so, what might the clusters represent?**

Possible Clusters
====================

- In the data set, there are 7 different categorical variables: 
  - Manufacturer
  - Model
  - Type
  - AirBags
  - DriveTrain
  - Origin
  - Make

- **Which, if any, of the above variables might be possible clusters?**
- **Select one of these variables and list all the categoriesit has.**

Add that variable to the scatterplot
====================

- We can add the `group` attribute to our `xyplot` to showcase the different categories in the variable you picked above.


```r
xyplot(MPG.highway~MPG.city, data = Cars93,
       group=CATEGORICAL VAR)
```

- Does your variable seem to split the data into specific clusters?
  - If yes, continue on to the next slide.
  - If no, try a different categorical variable.

Can R Find the Same Clusters?
====================

- In R, there is a function called `kmeans()` that performs the algorithm we did by hand in class.

- The following code will find the k-means. You have to choose a value for the `NUMBER` part. (Hint: think about your categorical variable.)


```r
k1 <- kmeans(Cars93[, c("MPG.highway", 
                        "MPG.city")], NUMBER)
```

What does k-means do?
=====================

- Type `k1` into the console and look at the output.
- There are 9 components that are created by the `kmeans` function. We will specifically be looking at the `cluster` component.


```r
k1[["cluster"]]
```

- **What does the data table tell you? Explain.**

Clustered graph
====================

- Now, we can recreate our scatterplot and group the points by their clusters found with the `kmeans()` function.


```r
xyplot(MPG.highway~MPG.city, data = Cars93, 
       group=k1[["cluster"]])
```

- **How does this graph compare to the graph that was grouped by the categorical variable?**

- **Did the `kmeans` function find the correct clusters?**

On your own
===================
- Pick 2 numerical variables and create a scatterplot.
- Decide if there are any obvious clusters.
- Create k-means and decide if the algorithm can correctly find the clusters.
- Determine what these clusters might represent. 