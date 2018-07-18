Data, Code & RStudio
====================
transition: none
css: ../../IDSLabCSS.css

Lab 1A  

Directions: Follow along with the slides and answer the questions in **red** font in your journal.
 


Welcome to the labs!
===================

- Throughout the year, you'll be putting your data science skills to work by completing the labs.
- You'll learn how to program in the `R` programming language.
    - The programming language used by actual data scientists.
- Your code will be written in RStudio which is an easy to use interface for coding using `R`.
 

So let's get started!
=====================

- The data for our first few labs comes from the Centers for Disease Control (CDC)
    - The CDC is a federal institution that studies public health.
- Type these two commands into the your console:


```r
data(cdc)
```

```r
View(cdc)
```
  
- **Describe the data that appeared after running `View(cdc)`:** 
    - **_Who_ is the information about?**
    - **What sorts of information about them was collected?**


Data: Variables & Observations
==============================

- Data can be broken up into two parts. 
    1. Observations
    2. Variables
- If need be, re-type the command you used to `View` your data. Then answer the following:
    - **How are our _observations_ represented in our data?**
    - **What does the first column tell us about our observations?**
    - **How often did our first observation wear a seatbelt while riding in a car?**

Uncovering our Data's Structure
===============================

- Now that we've looked at our data, let's look at how RStudio is organized.
- RStudio's main window is composed of four _panes_
- Find the pane that has a _tab_ titled _Environment_ and click on the _tab_.
    - This pane contains a list of everything that's currently available for R to use.
    - Notice that R knows we have our `cdc` data loaded.
- **How many students are in our `cdc` data set?**
- **How many variables were measured for each student?**

  
Type the following commands into the console
============================================


```r
dim(cdc)
```

```r
nrow(cdc)
```

```r
ncol(cdc)
```

```r
names(cdc)
```

- **Which of these functions tell us the number of observations in our data?**
- **Which of these functions tell us the number of variables?**

First Steps
=========================

- Typing commands into the console is your first step into the larger world of _programming_ or _coding_ (terms which are often used interchangeably).
- Coding is all about learning how to send instructions to your computer.
    - We call the way we _speak_ to the coding language, _syntax_.
- _Capitalization_, _spelling_ and _punctuation_ are REALLY important.

Syntax matters
==============

- **Run the following commands and write down what happens after each. Which does R understand?**


```r
Names(cdc)
```

```r
NAMES(cdc)
```

```r
names(cdc)
```

```r
names(CDC)
```



R's most important syntax
=========================

<font size="7" color="green">
*<p align='center'> _function_ (y~x, data = ____ ) </p>*
</font>

- Search through the different panes. Find and then click on the _Plots_ tab.
    - To get back to the slides, find and then click on the _Viewer_ tab.
    

Syntax in action
================

<font size="7" color="green">
*<p align='center'> _function_ (y~x, data = ____ ) </p>*
</font>

- **Which one of these plots would be useful for answering the question: _Is it unusual for students in the CDC dataset to be taller than 1.8 meters?_**


```r
histogram(~height, data = cdc)
```

```r
bargraph(~drive_text, data = cdc)
```

```r
xyplot(weight~height, data = cdc)
```

- **Do you think it's unusual for students in the data to be taller than 1.8 meters? Why or why not?**


On your own:
===========

- After completing the lab, answer the following questions:
    - **What is _public health_ and do we collect data about it?**
    - **How do you think our data was collected? Does it include every high school aged student in the US?**
    - **How might the CDC use this data? Who else could benefit from using this data?**
    - **Write the code to visualize the distribution of weights of the students in the CDC data with a histogram. What is the _typical_ weight?**
    - **Write the code to create a barplot to visualize the distribution of how often students wore a helmet while bike riding. About how many students never wore a helmet?**
