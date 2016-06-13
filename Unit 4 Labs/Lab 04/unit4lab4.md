This Models Big Enough for All of Us!
========================================================
transition: rotate
transition-speed: slow
css: ../../IDSLabCSS.css

Unit 4 - Lab 4

Directions: Follow along with the slides and answer the questions in **red** font in your journal.
 



Building better models
====================

- So far, we've been building models where we made predictions based on just a single variable.
  - But why choose just one?
- Data scientists often build models that are much more complex than the simple linear regression models we've been making.
  - Adding variables gives us more information to use to make predictions.
  - But adding _EVERY_ variable we can think of will often cause our predictions to get worse.
- In this lab, we'll learn how to add more variables to our models!

Start where we left off
=======================

- Start by loading the ` movie_train`$\$ and $\$` movie_test` data sets.

```r
data(movie_test)
```

```r
data(movie_train)
```
- Build the first model we made (in lab 4.1) using the training data

```r
model1 <- lm(domest_gross~runtime, 
             data=movie_train)
```
- Next, we'll evaluate it.


Evaluating our simple model
===========================

- We evaluate our model by making predictions for our test data.

```r
predict_model1 <- predict(model1, 
                          newdata=movie_test)
```

```r
mean(~abs(domest_gross-predict_model1), 
     data=movie_test)
```

- Using just the `runtime` to predict the `domest_gross` give us a typical error of 4.7943891 &times; 10<sup>7</sup> in our predictions.
- Let's see if we can improve this.
- **How would you explain each step of the code above to your non-IDS friends? What is happening when we run each line?**

Including more information
===========================

- The more information we have that's relevant to our prediction, the better our prediction will be.
  - That is, if we include the information from other variables we might be able to improve our model's predictions.
- If we wanted to include info about the number of reviews, we could run the code:

```r
model2 <- lm(domest_gross~runtime + reviews_num, 
             data=movie_train)
```


What's going on?
================


```r
model2 <- lm(domest_gross~runtime + reviews_num, 
             data=movie_train)
```

- To make predictions based on `runtime` and `reviews_num`, we wrote `runtime + reviews_num`.
  - This tells R to create a model using `runtime` _PLUS_ the additional info provided by `reviews_num`.
- **Create predictions using `model2` with our test data and then calculate the average error.**
  - **Did including both variables improve the predictions? How do you know?**
  
But what's ACTUALLY going on?
=============================

- For as smart as human beings are, we can only visualize things in, at most, 3 dimensions (_height_, _width_ and _depth_).
  - Computer's don't have such a limitation.
- Humans can't even visualize what a 4-dimensional scatterplot would look like.
  - Hence, how are we going to imagine what a line of best fit looks like?
- `R` can not only figure out what 4-dimensional scatterplots would look like, it can create equations for lines of best fit!
  - See why data scientists like computing so much?
  
On your own.
============

- **Write down which other variables you think might help predict how much money a film will make.**
- **Write down why you think these variables will improve your predictions.**
- **Use $\$ `movie_train` to create a linear model that includes all of the variables you think are relevant.**
  - **Then use `movie_test` to see how well your model does by first making predictions and then calculating the average error.**
  - **How much average error did you model have when predicting the values in the testing data? Was it smaller than the `model2` we built earlier?**
