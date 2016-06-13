Splitting hairs ... and data.
========================================================
transition: rotate
transition-speed: slow
css: ../../IDSLabCSS.css

Unit 4 - Lab 2

Directions: Follow along with the slides and answer the questions in **red** font in your journal.
 



Testing and Training Data
====================

- Creating training/testing data sets is pretty important.
  - It lets us build models using the info from the training data.
  - And then lets us test our models on a separate testing data.
- This give us a mechanism to see if our model is improving or not!
- For this lab, we'll take a look at how we can create testing and training data for ourselves.
  
  
Starting with movies.
=====================

- To start, load the `movie` data.
- You might remember that a few labs ago, you worked with data that had been pre-split (`movie_test` & `movie_train`). 
  - We'll attempt to make our own test/train data.


A few notes on splitting data.
==============================

- We can't be sloppy when we split our data into testing and training sets.
  - Our results are going to depend on us doing the splitting well.
- When splitting data:
  - We want the bulk of the data to be in the training data. This ensures we have enough info in the data to build a good model.
  - Testing data will therefore usually contain fewer observations than the testing data.
  - The observations in our entire data set should be RANDOMLY assigned to one set or the other BUT NEVER BOTH!
  

Who will help train?
=====================

- Since the majority of our data should be in the training data, let's decide to put 60% of the data in `movies` into the training data.
  - The remaining 40% will go into the testing data.
- We can run the following code to randomly decide which of our 489 movies will go into the training data:

```r
training_obs <- sample(1:nrow(movie), 
                       size=0.6*nrow(movie), 
                       replace=FALSE)
```


Explain:
========


```r
training_obs <- sample(1:nrow(movie), 
                       size=0.6*nrow(movie), 
                       replace=FALSE)
```

- **What does the code `nrow(movie)` tell us about our data?**
- **What does the code `1:nrow(movie)` do?**
- **Why did we write `size=0.6*nrow(movie)`?**
- **What would happen if we had let `replace=TRUE`?**

Who will help test?
===================

- Now that we've decided the observations that will end up in our training data, we want the remaining observations to go to our testing data.
  - An easy way to do this is to use the `setdiff()` function.

```r
testing_obs <- setdiff(1:nrow(movie), 
                        training_obs)
```

- The `setdiff()` function looks at all the values of `1:nrow(movie)` and removes any value that's in `training_obs`.


And ... slice!
==============

- You'll notice that if we run `testing_obs` or `training_obs` in the console that we don't get our data back, just the rows that will go into each set.
  - We'll use the `slice()` function then to slice our data based on the rows of `testing_obs` and `training_obs`.
- To get our training data, run:

```r
movie_train <- slice(movie, training_obs)
```
- **Write down and then run the code you would use to create your `movie_test` data.**


You're done ... but wait.
========================

- So congrats, you made your very own testing/training data.
  - But having to run this process for all of your data set seems a bit tedious 
  - And we're programming, right? Why can't we make the computer split our data automatically.
  - ...
  - Good idea!
- When you find yourself running the same sequence of code over and over and over ... then you might find that it's worth the effort to create a `function` that runs the code automatically.


Let's start with an example:
===========================

- This is an example of a function:

```r
add_3 <- function(x,y,z) {
  total <- x + y + z
  return(total)
}
```


```r
add_3(9,8,7)
```

- Run the first line of code, then the second.


Writing functions
=================


```r
add_3 <- function(x,y,z) {
  total <- x + y + z
  return(total)
}
```

- We write functions much like we write most of our other code.
  - We give our function a name (`add_3`)
  - We tell R that `add_3` is going to be a `function` which requires 3 arguments (`x`, `y`, `z`).
  - Then we tell R what to do with our 3 arguments and wrap these instructions in between `{` and `}`.
  
Notice:
========


```r
add_3 <- function(x,y,z) {
  total <- x + y + z
  return(total)
}
```

- Notice how functions work. When we ran `add_3(9,8,7)`, any `x` between the brackets was replaced with a `9`, any `y` by an `8` and any `z` by a `7`.
- So let's get going on building a new function to split data.


Creating the data_splitter (1)
===========================



- Let's get started with building our `data_splitter` function.


Creating the data_splitter (2)
===========================


```r
data_splitter <- function(             ){
 
 
 
 
 
 
  
    
}
```

- First add in the name, `data_splitter`, and tell `R` that it's going to be a `function`.
- Also add in the brackets `{` and `}`, which will contain our code. 

Creating the data_splitter (3)
===========================


```r
data_splitter <- function(data, p_train){
 
 
 
 
 
 
 
       
}
```

- Our function is going to require us to specify a `data` file to split.
- It's also going to need us to say what percent of the data should belong to the training set (`p_train`).


Creating the data_splitter (4)
===========================


```r
data_splitter <- function(data, p_train){
  training_obs <- sample(1:nrow(data), 
                      size=p_train*nrow(data))
 
 
 
 
 
 
}
```

- We'll use some similar code to what we did before, but this time we'll use `nrow(data)` and `p_train*nrow(data)`.
  - We do this because `data` and `p_train` are placeholders and will eventually be replaced by actual data and values when we run the function.


Creating the data_splitter (5)
===========================


```r
data_splitter <- function(data, p_train){
  training_obs <- sample(1:nrow(data), 
                      size=p_train*nrow(data))
  testing_obs <- setdiff(1:nrow(data),
                         training_obs)
 
 
 
      
}
```

- We'll next add in which observations will go into our testing data.
  - This, again, is similar to what we did before with the movie data, but using `data` as a placeholder.



Creating the data_splitter (6)
===========================


```r
data_splitter <- function(data, p_train){
  training_obs <- sample(1:nrow(data), 
                      size=p_train*nrow(data))
  testing_obs <- setdiff(1:nrow(data),
                         training_obs)
  training_data <- slice(data, training_obs)
 
 
     
}
```

- We'll create our actual `training_data` with our placeholder, `data`.

Creating the data_splitter (7)
===========================


```r
data_splitter <- function(data, p_train){
  training_obs <- sample(1:nrow(data), 
                      size=p_train*nrow(data))
  testing_obs <- setdiff(1:nrow(data),
                         training_obs)
  training_data <- slice(data, training_obs)
  testing_data <- slice(data, testing_obs)
 
     
}
```

- ... and the same for our `testing_data`.


Creating the data_splitter (8)
===========================


```r
data_splitter <- function(data, p_train){
  training_obs <- sample(1:nrow(data), 
                      size=p_train*nrow(data))
  testing_obs <- setdiff(1:nrow(data),
                         training_obs)
  training_data <- slice(data, training_obs)
  testing_data <- slice(data, testing_obs)
  return(list(train=training_data, 
              test=testing_data))
}
```

- Finally, we'll return out two new data files.
  - But watch-out! Because we're returning 2 different objects, we need to tell `R` to `list` each object as either the `train` data or `test` data.
  
Using our new function
=====================

- Run the code from the previous slide. Then load the `cdc` data by running.

```r
data(cdc)
```
- To split this data, we'll use our new function:

```r
cdc_split <- data_splitter(cdc, 0.78)
```
- **What percentage of our cdc data will be in the training data?**


Create cdc_train and cdc_test
============================

- Remember that since our function returns 2 different data objects, we need to have a way to specify which one we're talking about.
- To create our cdc_train data file run:

```r
cdc_train <- cdc_split[["train"]]
```
- To create our cdc_test data file run:

```r
cdc_test <- cdc_split[["test"]]
```
- And we're done!
