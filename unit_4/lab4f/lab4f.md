Some models have curves
===
transition: none
css: ../../IDSLabCSS.css

Lab 4F

Directions: Follow along with the slides and answer the questions in **red** font in your journal.




Making models do yoga
===

- In the previous lab, we saw that prediction models could be improved by including additional variables.
    - But using straight lines for all the variables in a model might not really fit what's happening in the data.
- In this lab, we'll learn how we can turn our `lm()` models using straight lines into `lm()` models using quadratic curves.
- Load the `movie` data and split it into two sets:
    - A set named `training` that includes 75% of the data.
    - And a set named `testing` that includes the remaining 25%.
    - Remember to use `set.seed`.


Problems with lines
===

- Calculate the _slope_ and _intercept_ of a linear model that predicts `gross` based on `n_critics` for the `training` data.
    - Then create a scatterplot of the two variables using the `testing` data and use `add_line()` to include the _line of best fit_ based on the `training` data..
    - **Describe, in words, how the line fits the data? Are there any values for `n_critics` that would make obviously poor predictions?**
- **Compute the MSE of the model for the `testing` data and write it down for later.**


Adding flexibility
===

- You don't need to be a full-fledged Data Scientist to realize that trying to fit a line to curved data is a poor modeling choice.
    - If our data is curved, we should try model it with a curve.
- So instead of using an `lm()` like  
<center>`y = a + bx`</center>
- We could use an `lm()` like  
<center>`y = a + bx + cx`<sup>`2`</sup></center>
- This is called a _quadratic_ curve.


Making bend-y models
===

- To fit a quadratic model in `R`, we can use the `poly()` function.
    - Fill in the blanks below to predict `gross` using a quadratic polynomial for `n_critics`.


```r
lm(____ ~ poly(____, 2), data = training)
```

- **What is the role of the number `2` in the `poly()` function?**
- **Write down the model equation in the form:**
<center>`y = a + bx + cx`<sup>`2`</sup></center>
- Assign this model a name and calculate the MSE for the `testing_data`.

Comparing lines and curves
===

- Create a scatterplot with `gross` on the y-axis and `n_critics` on the x-axis using your `testing` data.
    - Add the _line of best fit_ for the `training` data to the plot.
    - Then use the name of the model in the code below to add your _quadratic_ model:

```r
add_curve(____)
```

- **Compare how the _line of best fit_ and the _quadratic_ model fit the data. Use the difference in each model's testing MSE to describe why one model fits better than the other.**

On your own
===


```r
lm(gross ~ n_critics + n_audience + critics_rating + audience_rating, data = training)
```
- Calculate the MSE of the `testing` data for the above model.
- Decide which individual predictors would be better modeled by using a quadratic polynomial. Replace the name of the variable in the code above with an appropriate `poly()` function.
- Calculate the MSE of the `testing` data for the model with the quadratic polynomials.
    - **Did including quadratic polynomials improve the predictions for the `testing` data?**

