What's the score?
===
transition: none
css: ../../IDSLabCSS.css

Lab 4B

Directions: Follow along with the slides and answer the questions in **red** font in your journal.




Previously
===

- In the previous lab, we learned we could make predictions about one variable by utilizing the information of another.
- In this lab, we will learn how to measure the accuracy of our predictions.
    - This in turn will let us evaluate how well a model performs at making predictions.
    - We'll also use this information later to compare different models to find which model makes the best predictions.


Predictions using a line
===

- Load the `arm_span` data again.
    - Create an `xyplot` with `height` on the y-axis and `armspan` on the x-axis.
    - Type `add_line()` to run the `add_line` function; you'll be prompted to click twice in the plot window to create a line that you think fits the data well.
- Fill in the blanks below to create a function that will make predictions of people's `height`s based on their `armspan`:

```r
make_predictions <- function(armspans) {
  ____ * armspans + ____
}
```

Make your predictions
===

- Fill in the blanks to include your predictions in the `arm_span` data.

```r
____ <- mutate(____, predictions = ____(____))
```
- Now that we've made our predictions, we'll need to figure out a way to decide how accurate our predictions are.
    - We'll want to compare our _predicted heights_ to the _actual heights_.
    - At the end, we'll want to come up with a single number summary that describes our model's accuracy.

Sums of differences
===

- One method we might consider to measure our model's accuracy is to sum the differences in the actual heights minus our predicted heights.
    - **What do these differences measure?**
    - Fill in the blanks below to create a function which calculates the sum of differences:


```r
accuracy <- function(actual, predicted) {
  sum(____ - ____)
}
```

- Then fill in the blanks to calculate our accuracy summary.


```r
summarize(____, ____(____, ____))
```

Checking our work
===

- **Describe and interpret, in words, what the output of your accuracy summary means.**
    - **Compare your accuracy summary with a neighbor. Whose line was more accurate and why?**
- **Write down why adding positive and negative errors together is problematic for accessing prediction accuracy.**
    - **Why does calculating the squared values for the differences solve this problem?**
- Alter your accuracy  function to first calculate the differences, then square them and finally take the `mean` of the squared differences. This is called the _mean squared error_ (MSE).
    - Calculate the MSE of your line.

On your own
===

- Create a _regression line_ as you did in the previous lab, for `height` and `armspan`.
    - We also refer to _regression lines_ as _linear models_.
    - Assign this model the name `best_fit`. 
- Making predictions with models `R` is familiar with is simpler than with lines, or models, we come up with ourselves.
    - Fill in the blanks to make predictions using `best_fit`:

```r
____ <- mutate(____, predictions = predict(____))
```

- Calculate the MSE for these new predicted values.

The magic of lm()
===

- The `lm()` function creates the _line of best fit_ equation by finding the line that minimizes the _mean squared error_. Meaning, it's the _best fitting line possible_. 
    - Compare the MSE value you calculated using the line you fitted with `add_line()` to the the same value you calculated using the `lm` function.
    - Ask your neighbors if any of their lines beat the `lm` line in terms of the MSE. Were any of them successful?
- To see how the `lm` line fits your data, create a scatterplot and then run:

```r
add_line(intercept = ____, slope = ____)
```

