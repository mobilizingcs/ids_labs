Non-linear Lines
========================================================
transition: rotate
transition-speed: slow
css: ../../IDSLabCSS.css

Unit 4 - Lab 5

Directions: Follow along with the slides and answer the questions in **red** font in your journal.
 



Building better lines
====================

- Linear models make better predictions when the data look like straight lines.
    - But what should we do when the data doesn't look so straight?
- In this lab, we'll take a look at how _transforming_ variables leads to better models.
    - By _transforming_, we mean modifying our original variables to have slightly different shapes.


Turning lines into curves
========================

- One of the easiest, but often most powerful, ways to transform our linear models are to turn them into polynomials.
- What do we mean? 
- Change our model from this:
  \[ y = mx + b \tag{Eq.1}\]
- Into this:
  \[ y = ax^2 + bx + c \tag{Eq.2}\]
- This turns our line into a 2 degree polynomial.


When to make the change
======================

- Load the `movie_train` data.
- Take a look at a scatter plot comparing `domest_gross` with `audience_rating`.
    - **How might using a curve, instead of a line, let us make better predictions?**
- Typically, we transform our variables into polynomials when we think that a curve would make better predictions than just a regular straight line.
- **Make a linear model that predicts `domest_gross` based on `audience_rating` using the `movie_train` data. name the model `m_line`.**


Building a polynomial regression
===============================

- To transform our data into a polynomial, we'll use the `poly()` function inside of our `lm()` function. 
- For example:


```r
m_curve <- lm(domest_gross ~ 
                poly(audience_rating, 2), 
              data = movie_train)
```

- Here, the `poly()` function uses our variable, `audience_rating` and turns it into a 2 degree polynomial.
- **Load the `movie_test` data and then calculate the MAE for `m_line ` and ` m_curve`. Which model makes better predictions? Why, in your opinion, do you think that is?**


On your own
=========

- **Go back to the model you made in lab 4.4 (The model with many variables).**
    - **If your model included `audience_rating`, replace `audience_rating` with a `poly(audience_rating, 2)`.**
    - **If your model did not include audience_rating`, include ` poly(audience_rating, 2)` in your model.**
    - **Build the model using `movie_train`. Calculate the MAE of the model using `movie_test`.**
    - **Explain whether or not including `poly(audience_rating, 2)` improved the model.`**
