If the line fits ...
========================================================
transition: linear
transition-speed: fast
css: ../../IDSLabCSS.css

Unit 4 - Lab 1 

Directions: Follow along with the slides and answer the questions in **red** font in your journal.
 



Our modeling journey begins
====================

- When data scientists talk about _building models_, they're often talking about coming up with ways to make predictions.
  - There are many, many ways to build a model.
- Our modeling journey starts at, what was historically, one of the first ways statistical models were created.
  - This method is still, by far, one of the most ubiquitous methods.
- In this lab, we'll learn how to use the equation of lines, $y=mx+b$, to make predictions.
- We'll also learn how we can determine how well our prediction model works.


Load the data
=============

- For this lab, we'll need to load two data sets:

```r
data(movie_train)
```

```r
data(movie_test)
```

- This is a similar data set to what we used earlier in the school year.
- To remind yourself of the variables in the data, run:

```r
names(movie_train)
```


Why use two data sets?
======================

- It's important to notice that we have two different, but very similar data sets.
  - One is a _training_ data set.
  - The other is a _testing_ data set.
- We'll use the _training_ data set to build our model.
- After building our model, we'll use the _testing_ data to:
  - Predict the values we're interested in computing and then ...
  - Compare the predictions to the actual values in the data set.


But where did these data come from?
===================================

- The _test_ and _train_ data sets were originally one set of data.
  - To split them up, we _randomly_ assigned 75% of the movies in the data to be our _training_ data.
  - We took the other 25% of the movies and put them in our _testing_ data.
- Which films do the data sets have in common? 
  - NONE! The only similarity between the data sets are the variables.
- In a future lab, you'll learn how to do all this yourself.


Let's begin
==========

- Using the `movie_train` data, make a scatter plot where `domest_gross` is on the $y$-axis and `runtime` is on the $x$-axis.
- What is `domest_gross` you ask?
  - It's the total amount of money each film made from being shown in the U.S.
- **Based on your plot, if someone asked you to predict how much money a 2 hour long film would make, what would you tell them?**
  - **How did you decide on your prediciton?**

  

Using a line for predictions
============================

- One method we could used to make predictions slightly better than just random guesses would be to add a _line of best fit_ to our plot.
- This single straight line would ideally be equally _close_ to all of our data points.
- To add your own line of best fit to the data, run the following:

```r
add_line()
```
- This function will let you add a line to your plot by clicking twice on the plot itself.
  - NOTE: You must click the plot twice after running `add_line()`.

Creating your first model
=========================

- Re-run the code you used to create your original scatter plot.
- Then create a line that, in your opinion: 
  - (1) describes the overall trend of the data and 
  - (2) has _approximately_ the same amount of points above and below your line.
- **Write down the equation of the line that you created**.
  - **What do the $x$ and $y$ variables in the equation represent, respectively?**
  - **Use your equation to predict what the value of the ticket sales would be for a 2 hour long movie.**
- **If a director wants his movie to make more money, should he just make it as long as possible? Why or why not?**


Coming up with the best line
============================

- No doubt, if you compared all of the equations your classmates made, you would ALL have completely different equations.
- How do we decide which line is best? 
  - The best fitting line will be the one that makes the best predictions.
  - How can we come up with this line? I'm glad you asked.
- To build, what data scientists call a _linear model_, use the following code:

```r
model1 <- lm(domest_gross~runtime, 
             data=movie_train)
```
- **Write down why you think we call this a _linear_ model.**


Examining our first linear model
================================

- To display what the slope and intercept of our line is, run:

```r
model1
```
- **Write down the value of the `(Intercept)` and the value of the slope for `runtime`.**
  - **Take these values and write down the equation of the line in $y=mx+b$ form.**
- To see a plot of the data with our line added, we can run:

```r
xyplot(domest_gross~runtime, data=movie_train,
       type=c("r","p"))
```


What did we do?
===============


```r
xyplot(domest_gross~runtime, data=movie_train,
       type=c("r","p"))
```

- This code tells `R` to make a scatter plot of `domest_gross` and `runtime`.
  - We use `type=c("r","p")` because this tells `R` to plot the data _points ("p")_ and also the _regression line ("r")_.
  - The term _regression line_ is what we call building a _linear model_ using the single best fitting line.
  
  
I've built a model, now what?
============================

- After we build a model, we can't just claim that our model is perfect and move on.
  - We need to demonstrate that it works well. Or at least that it works better than previous methods of making predictions.
- This is where our _test_ data comes in.
  - Our _test_ data hasn't been used at all yet. So we can use it to see how well our linear model works at making predictions about new data.
  - We can then look at the differences between our test data and our predictions to judge how well our model works.
  

Making predictions
=============================

- To make predictions using our model on our new _test_ data, run the following:

```r
predict_model1 <- predict(model1, 
                          newdata=movie_test)
```
- This code uses the model we made using the _training_ data to predict the values of `domest_gross` in our _testing_ data.

How'd we do?
============

- After calculating our predictions, we'll want to see how far away our predictions are from the actual `domest_gross_` values in our data, on average.
  - That is, we want to calculate the average distance between our line and each point in the data.
- To make this calculation, run

```r
mean(~abs(domest_gross-predict_model1), 
     data=movie_test)
```
- The number that gets output is the average amount of error in our predictions.

Take me through that again
======================


```r
mean(~abs(domest_gross-predict_model1), 
     data=movie_test)
```
- You should have noticed that our code included `abs(domest_gross~gross_predict)`.
  - This calculates the _absolute value_ of the distance between our prediction and the actual value from the data.
- Why is this necessary?
  - Because otherwise the positive errors would cancel out our negative errors.
  - This would then make our average distance between actual and predicted values much smaller.
  
  
Think of it like this.
===============

- If you were asked what the distance from Los Angeles to New York City is, you would say
  - "About 2,448 miles."
- If you were asked what the distance from Los Angeles to Tokyo is, you would say
  - "About 5,484 miles."
- What you WOULDN'T say is, "NYC is 2,448 miles from LA and Tokyo is -5,484 miles away from LA."
- _The absolute values ensures we only measure the positive distance from our predicted values to our data's actual values!_


On your own!
============

- **Build a _regression_ model to predict `domest_gross` based on the number of reviews the movies in our training data received.**
  - **Write down the values of the slope and intercept for this model.**
- **Calculate predicted values based on this new model for our testing data.**
- **Use these predicted values to compute the average distance between our predictions and the actual values in our data.**
- **Did this new model do a better job at predicting `domest_gross`? How can you tell?**