Are you sure about that?
========================================================
transition: none
css: ../../IDSLabCSS.css

Lab 3D

Directions: Follow along with the slides and answer the questions in **red** font in your journal.




Confidence and intervals
===

- Throughout the year, we've seen that:
    - Means are used for describing the typical value in a sample or population, but we usually don't know what they are, because we can't see the entire population.
    - Means of samples can be used to _estimate_ means of populations.
    - By including a margin of error with our estimate, we create an interval that increases our confidence that we've located the correct value of the population mean.
- Today, we'll learn how we can calculate _margins of error_ by using a method called the _bootstrap_.
    - Which comes from the phrase, _Picking yourself up by your own bootstraps_.


In this lab
===

- Load the built-in `atus` (_American Time Use Survey_) data set, which is a survey of how a sample of Americans spent their day.
    - **The United States has an estimated population of 327,350,075. How many people were surveyed for this particular data set?**
- The statistical question we wish to investigate is:

_What is the mean age of people older than 15 living in the United States?_

- **Why is it important that the ATUS is a random sample?**
- **Use our `atus` data to calculate an estimate for the average age of people older than 15 living in the U.S.**


One bootstrap
===

- A _bootstrapped_ sample is when we take a random `sample()` of our original data (`atus`) _WITH_ replacement.
    - The `size` of the sample should be the same size as the original data.
- We can create a single _bootstrapped_ sample for the `mean` in three steps:
    1. Sample the number of the rows to use in our _bootstrap_.
    2. `slice` those rows from our original data into our _bootstrap_ data.
    3. Calculate the mean our our _bootstrapped_ data.
    

Our first bootstrap
===

- Fill in the blanks to `sample` the row numbers we'll use in our _bootstrapped_ sample.
    - Be sure to re-read what a _bootstrapped_ sample is from the previous slide to help you fill in the blanks.
    - Use `set.seed(123)` before taking the sample.


```r
bs_rows <- ____(1:____, size = ____, replace = ____)
```

- We can use the `slice` function to create a new data set that includes each row from our `sample`


```r
bs_atus <- slice(atus, bs_rows)
```


Take a look
===

- Look at the values of `bs_rows` and `bs_atus`.
    - **Write a paragraph that explains to someone that's not familiar with `R` how you created `bs_rows` and `bs_atus`. Be sure to include an explanation of what the _values_ of `bs_rows` mean and how those values are used to create `bs_atus`. Also, be sure to explain what each argument of each function does.**


One strap, two strap
=== 

- Calculate the `mean` of the `age` variable in your `bootstrapped` data, then use a different value of `set.seed()` to create your own, personal _bootstrapped_ sample. Then calculate its `mean`.
    - Compare this second _bootstrapped_ sample with three other classmates and write a sentence about how similar or different the _bootstrapped_ sample means were.


Many bootstraps
===

- To use _bootstrapped_ samples to create _confidence intervals_, we need to create many _bootstrapped_ samples.
    - Normally, the more _bootstrapped_ samples we use, the better the _confidence interval_.
    - In this lab, we'll `do()` 500 _bootstrapped_ samples.
- To make `do()`-ing 500 _bootstraps_ easier, we'll code our 3-step bootstrap method into a function.
    - Open a new R script (File -> New File -> R Script) to write your function into.
    

Bootstrap function
===

- Fill in the blank space below with the 3-steps needed to create a _bootstrapped_ sample `mean` for our `atus` data.
    - Each step should be written on its own line between the curly braces.


```r
bs_func <- function() {
  
  
  
}
```

- Highlight and _Run_ the code you write. 


Visualizing our bootstraps
===

- Once your function is created, fill in the blanks to create 500 _bootstrapped_ sample means:


```r
bs_means <- do(____) * bs_func()
```

- **Create a histogram for your bootstrapped samples and describe the _center_, _shape_ and _spread_ of its distribution.**
    - These bootstrapped estimates no longer estimate the average age of people in the U.S.
    - Instead, they estimate how much the estimate of the average age of people in the U.S. varies.
- In the next slide, we'll look at how we can use these bootstrapped means to create _90% confidence intervals_.


Bootstrapped confidence intervals
===
    
- To create a 90% confidence interval, we need to decide between which two _ages_ the middle 90% of our bootstrapped estimates are contained.
- **Using your histogram, fill in the statement below:**

The lowest 5% of our estimates are below _______ years and the highest 5% of our estimates are above_______ years.

- Use the quantile() function to check your estimates.
- **Based on your bootstrapped estimates, between which two ages are we 90% confident the actual mean age of people living in the U.S. is contained?**

    

On your own
===

- Using your _bootstrapped_ sample means, create a 95% confidence interval for the mean age of people living in the U.S.
    - **Why is the 95% confidence interval wider than the 90% interval?**
    - **Write down how you would explain what a 95% confidence interval means to someone not taking _Introduction to Data Science_.**
