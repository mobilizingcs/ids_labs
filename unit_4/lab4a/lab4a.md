If the line fits ...
===
transition: none
css: ../../IDSLabCSS.css

Lab 4A

Directions: Follow along with the slides and answer the questions in **red** font in your journal.



How to make predictions
===
- Anyone can make predictions.
    - Data scientists use data to inform their predictions by using the information learned from the sample to make predictions for the whole population.
- In this lab, we'll learn how to make predictions by finding the _line of best-fit_.
    - You will also learn how to use the information from one variable to make predictions about another variable.


Predicting heights
===

- Use the `data()` function to load the `arm_span` data.
- This data comes from a sample of 90 people in the Los Angeles area.
    - The measurements of `height` and `armspan` are in inches.
    - A person's `armspan` is the maximum distance between their fingertips when they spread their arms out wide.
- Make a plot of the `height` variable.
    - **If you had to predict the height of someone in the Los Angeles area, what single height would you choose and why?**
    - **Would you describe this as a _good_ guess? What might you try to improve your predictions?**


Predicting heights knowing arm spans
===

- Create two subsets of our `arm_span` data: 
    - One for `armspan >= 61 & armspan <= 63`. 
    - A second for `armspan >= 64 & armspan <= 66`.
- Create a histogram for the `height` of people in each subset. Answer the following based on the data:
    - **What `height` would you predict if you knew a person had an `armspan` around 62 inches?**
    - **What `height` would you predict if you knew a person had an `armspan` around 65 inches?**
    - **Does knowing someone's `armspan` help you predict their height? Why or why not?**




<!-- Problems with using the mean -->
<!-- === -->

<!-- - Using `mean` values to make predictions has a few drawbacks which we highlight below: -->
<!-- - Calculate the `mean` `height` of people who have an `armspan` of 69 and 70 inches.  -->
<!--     - **How much taller is the person with a 70 inch `armspan` than the 69 inch `armspan`, on average? Does this seem reasonable?** -->
<!--     - **How tall would you predict someone who had a 69.5 inch `armspan` to be?** -->


Fitting lines
===

<!-- - Making predictions using means can lead to drastic jumps in predicted values. -->
<!--     - They also leave us unable to make predictions for inbetween values, like 69.5. -->
<!-- - For these reasons, data scientists often _fit_ lines to their data to make predictions. -->
- Notice that there is a trend that people with a larger `armspan` also tend to have a larger mean `height`.
    - One way of describing this sort of trend is with a line.
- Data scientists often _fit_ lines to their data to make predictions.    
    - What we mean by _fit_ is to come up with a line that's close to as many of the data points as possible.
- Create a scatterplot for `height` and `armspan`. Then run the following code. Draw a line by clicking twice on the _Plot_ pane.

```r
add_line()
```


Predicting with lines
===

- Draw a line that you think is a good _fit_ and write down its equation. Using this equation:
    - **Predict how tall a person with a 62 inch armspan and a person with a 65 inch `armspan` would be.**
    
<!-- - **How much taller is the person with a 70 inch `armspan` than the 69 inch `armspan`? Does this difference seem more reasonable than the difference we calculated using the means?**   -->
- Using a line to make predictions also lets us make predictions for `armspan`s that aren't in our data.
    - **How tall would you predict a person with a 63.5 inch `armspan` to be?**
- **Compare your answers with a neighbor. Did both of you come up with the same equation for a line? If not, can you tell which line fits the data best?**

Regression lines
===

- If you were to go around your class, each student would have created a different line that they feel _fit_ the data best.
    - Which is a problem because everyone's line will make slightly different predictions.
- To avoid this variation in predictions, data scientists will use _regression lines_.
    - This line connects the mean `height` of people with similar `arm_spans`.
    - Fill in the blanks below to create a _regression line_ using an `lm`, or _linear model_:


```r
lm(____ ~ ____, data = arm_span)
```

Predicting with regression lines
=== 

- Use the output of the code from the previous slide to write down the equation of the _regression line_ in the form  
<center>`y = a + bx`.</center>
- Add this line to a scatterplot by filling in the blanks below:

```r
add_line(intercept = ____, slope = ____)
```

- Predict the height of a person with a 63.5 inch `armspan` and compare it with a neighbor. Ensure you both arrive at the same predicted value.
- **Measure your `armspan` and use the regression line to predict your height. How close was the prediction?**
