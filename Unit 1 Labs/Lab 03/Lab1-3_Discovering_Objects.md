Discovering Objects
================================
transition: rotate
transition-speed: slow
css: IDSLabCSS.css

Unit 1 - Lab 3

Directions: Follow along with the slides and answer the questions in **red** font in your journal.



What are objects?
====================

- When we're coding: the numbers, variables, functions and data stored on the computer are all different types of **objects**.
    - **Objects** assign a _name_ and _type_ to a set of _values_.
    - _Functions_, like `histogram`, are also objects with names and coded _steps_ instead of sets _values_
    
    
Take this line of code, for example:
====================================

```r
bargraph(~helmet, data = cdc)
```
- `bargraph` is a **function** object.
    - Put other objects between the parenthesis and it produces a bargraph.
- `helmet` is a **vector** object.
    - It stores all of the values of our variable and keeps them in order.
- `cdc` is a **data frame** object.
    - It stores all of the different variables in our data set.

Why are objects important?
==========================

- By using _objects_, we simplify the code writing process:
    - We can reference the _variables_ in our _data sets_ by name instead of having to write out the values by hand.
    - We can call upon _functions_ instead of having to continually write the same lines of code over and over and over ...


A simple use of objects
=======================

- Load the `cdc` data into RStudio.
- We can use the following to look at the first 25 of the `weight` variable

```r
head(weight, data = cdc, n = 25)
```
- **How would you add these 25 values together**
- **What would you do if someone asked you to compute the total combined height of _everyone_ in the data?**


A simple use of objects
=======================

- Here's how we can answer these questions using objects.
- First we save our values as an object named `first_25` (but really, we can name it whatever we'd like).

```r
first_25 <- head(~weight, data = cdc, 
                 n = 25)
```
- And then we use the `sum` function on this object:

```r
sum(first_25)
```
- And if we wanted the total height of everyone?

```r
sum(~weight, data = cdc)
```


But why are objects awesome?
========================

- Using objects makes it easy to:
    - Store information and values.
    - Manipulate them
    - And use them!





What just happened?
==================
- We created a **vector** of the first 25 `heights` in our data and **assigned** it the name `first_25`.
    - The arrow, `<-`, is how we assigned the _values_ from `head(~weight, data = cdc, n = 25)` to the _name_ `first_25`.
    - A **vector** is a type of object that stores one or more values and keeps them in order.
- When then put this object into the `sum()` function.
    - The function 


More about objects
====================

- Every _object_ has 3 things:
    1. The _name_ we can call to use the object.
    2. The _values_ contained in the object. 
    3. The _type_ of object.
- Some common _types_ of objects are:
    - **Vectors**, which stores values in a particular order.
    - **Data frame**, which stores 

Making vectors (tra-la-la!)
====================

- Let's create our **vector** of integers between 5 and 14:
    - We'll _name_ it `numbers`
    - We'll _assign_ it values using `<-`
    - Our _values_ will be the numbers 5 through 14
- Write the following code into your console.

```r
numbers <- c(5, 6, 7, 8, 9, 10, 11, 12, 13, 14)
```
- Click on the _environment_ pane. 
    - Objects you create will show up there!

Let's review what we just did
=============================


```r
numbers <- c(5, 6, 7, 8, 9, 10, 11, 12, 13, 14)
```

- This line of code tells R:
  1. Create a single _object_ called `numbers`
  2. **Combine** the numbers 5 through 14 into a _single object_ using the `c()` function
  3. **Assign** the values we combined, using the `<-` symbol, to the object we created.
- The `numbers` object you created is an example of a _vector_
  
Let's review what we just did
=============================


```r
numbers <- c(5, 6, 7, 8, 9, 10, 11, 12, 13, 14)
```

- After running the code:
    - The _object_ pops up in the _environment_ tab.
    - Nothing is printed in the console.
- **What happens if you type `numbers` into the console and hit _enter_?**

Try the example again using objects
===================================

- Let's go back now and redo our previous example:
- Create the object

```r
numbers <- c(5, 6, 7, 8, 9, 10, 11, 12, 13, 14)
```

- **What type of object is this again? Why?**

Try the example again using objects
===================================

- R contains many convenient functions.
- One such function is the `sum()` function.
    - It takes vectors of numbers and adds all the values in them together.
    

```r
sum(numbers)
```

- **Do you think using objects is any easier than just adding the numbers together in the console? Why or why not? Be honest!**

Try the example again using objects
===================================

- Let's save the sum of all numbers between 5 and 15 as another new object.
- Run these lines of code:
  

```r
total <- sum(numbers)
```

```r
total
```

- **What is the _name_ of the object? What is its value? How did you tell R to _assign_ the value to the object?**

Try the example again using objects
===================================

- Finally, let's calculate the differences of the sum and the numbers
    - Meaning, `95 minus 5`, `95 minus 6`, and so on
- We already have the sum (`total`) and all of the values (`numbers`)
- To calculate the differences of these two objects:
  

```r
total - numbers
```

- **In your opinion, was using objects for this task easier than before? Why or why not?**

Other ways to save time!
========================

- The `sum()` function was just one function that saves you time.
- Compare the outputs of the following:

```r
c(5, 6, 7, 8, 9, 10, 11, 12, 13, 14)
```

```r
5:14
```

```r
seq(from = 5, to = 14, by = 1)
```
- **How are these 3 methods different?**
- **Explain how you think R interprets each line.**

... a twist
=================

- Compare the following outputs:

```r
5:14
```

```r
14:5
```

- **What do you notice about the outputs?**

... a final twist
=================

- Compare the following outputs:

```r
seq(from = 5, to = 14, by = 1)
```

```r
seq(from = 5, to = 14, by = 3)
```

```r
seq(5, 14, 1)
```

- **What do you notice about the outputs?**
- **For each line, explain how each part effects the output**

On your own:
============

- **Create a _vector_ of numbers and save it as an _object_**
- Run the commands with *your_object* (whatever you decide to name it):

```r
your_object + your_object
```

```r
your_object * 2
```

```r
cumsum(your_object)
```
- **Describe the computations that take place for each output**
