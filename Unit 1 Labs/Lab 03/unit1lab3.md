Discovering Objects
================================
transition: rotate
transition-speed: slow
css: ../../IDSLabCSS.css

Unit 1 - Lab 3

Directions: Follow along with the slides and answer the questions in **red** font in your journal.



What are objects?
====================

- When we're coding: the numbers, variables, functions and data stored on the computer are all different types of **objects**.
    - **Objects** assign a _name_ and _type_ to a set of _values_.
    - _Functions_, like `histogram`, are also objects with names and coded _steps_ instead of sets _values_
- **Objects** then are the groups of values, variables or steps needed by a function, that we can use to easily analyze data.
    
Take this line of code, for example:
====================================

```r
bargraph(~helmet, data = cdc)
```
- `bargraph` is a **function** object.
    - This function takes other objects, `helmet` & `cdc` in this case, and performs all the necessary steps needed to produces a bargraph.
- `helmet` is a **vector** object.
    - The different values of the `helmet` variable are stored, in order, for us to use.
- `cdc` is a **data frame** object.
    - It stores all of the different values of _all_ of the variables variables in our data set and keeps them all ordered.

Why are objects important?
==========================

- By using _objects_, we simplify the code writing process:
    - We can use the _values_ of our data sets by calling their _variable names_.
    - We can call  _functions_ instead of having to continually write the same steps over and over and over ...



A simple use of objects
=======================

- Load the `cdc` data into RStudio.
- We can use the following to look at the first 25 values of the `weight` variable

```r
head(~weight, data = cdc, n = 25)
```
- **Write down how you would add these 25 values together.**
- **What would you do if someone asked you to compute the total combined weight of _everyone_ in the data?**


A simple use of objects
=======================

- Here's how we can answer these questions using objects.
- First we save our values as new object named `first_25`.

```r
first_25 <- head(~weight, data = cdc, 
                 n = 25)
```
- And then we use the `sum` function on this object:

```r
sum(first_25)
```
- And if we wanted the total weight of everyone?

```r
sum(~weight, data = cdc)
```


A couple things to notice (1/2):
==========================

- When we save objects and give them a name, we want to choose names that are:
  - _Short_. So we don't have to waste time writing our code.
  - _Descriptive_. So we can remember what the object contains.
- **In your opinion, was `first_25` a good name for the first 25 values of our `weight` variable? Why or why not?** 
  - **What would be a good name for the value of `sum(first_25`?**

A couple things to notice (2/2):
================================

- When we ran:

```r
sum(~weight, data = cdc)
```
- You may have noticed a warning message popped up:

```r
Warning message:
In sum(~weight, data = cdc) : The data contains 979 missing values
```
- This message is telling us that 979 people in our data didn't report their weight.
  - We denote **missing values** in our data as `NA`, which stands for _not available_.




What just happened?
==================
- We created a **vector** of the first 25 `weights` in our data and **assigned** it the name `first_25`.
    - The arrow, `<-`, is how we assigned the _values_ from `head(~weight, data = cdc, n = 25)` to the _name_ `first_25`.
    - A **vector** is a type of object that stores one or more values and keeps them in order.
- When then put this object into the `sum()` function.
    - The function 


More about objects
====================

- Every _object_ needs 3 things:
    1. The _name_ we can call to use the object.
    2. The _values_ contained in the object. 
    3. The _type_ of object.

Our example explained:
=====================


```r
first_25 <- head(~weight, data = cdc, 
                 n = 25)
```

- `first_25` is the _name_ of our object.
- We **assign** the _values_ of our object, `head(~weight, data = cdc, n = 25)`, using the `<-` symbol.
- And since we're storing values from a single variable, and keeping them in order, we're creating a _vector_ type object.


Objects and their info
======================

- **Run the following commands and give a brief description about what each function does:**

```r
names(cdc)
```


```r
print(~age, data = cdc)
```


```r
View(first_25)
```


```r
str(cdc)
```

- **What information gets printed for the last command?**



On your own:
============

- **Choose a variable besides `weight`:**
  - **Create a _vector_ of the last 50 values using the `tail` function (Look at how you used the `head` function for a hint at how to use the `tail` function).**
  - **Give your _vector_ object a name and write it down. Is the name short & descriptive?**
- **For these 50 values, create either a `histogram` or a `bargraph`.**
  - **How did you know which plot is appropriate for your values?**
  - **Which particular values seemed to occur the most often?**
