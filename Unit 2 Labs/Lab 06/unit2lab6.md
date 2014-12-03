The Color Shuffle
========================================================
transition: rotate
transition-speed: slow
css: ../../IDSLabCSS.css

Unit 2 - Lab 6  

Directions: Follow along with the slides and answer the questions in **red** font in your journal.
 



The benefit of computers
========================

- In class, you shuffled your group's color labels only a handful of times. 
  - Each time, you looked at the difference in the median color scores for the class' most occurring predominant color.

- Today, we will shuffle the group labels hundreds of times to see what the median difference looks like when something is caused, solely, by chance.

- **NOTE**: This lab is written assuming the class' most occurring predominant color is <font color = "green"> _Green_ </font>. If your class' most occurring primary color is NOT green, be sure to change questions and code accordingly.


Before we begin
================

- If we shuffle our data many times and compare the medians:
  - **Write down what you think the smallest median difference will be.**
  - **What do you think the largest difference will be?**  
  - **What do you think the typical difference will be?**
- **In class, you found the real difference in median <font color = "green"> _Green_ </font> scores between the true Green group and everyone else.  Write down that difference.**


Step 1: Upload your data
=========================

- For this lab, we will be looking at your class' actual _Personality Color_ data.
- So head to the [Mobilize Web Front-end](http://lausd.mobilizingcs.org) and then _Download_, _Upload_, and _Load_ your class' data.
  - Assign your data the name: `colors`.
- If you have forgotten how to _Download_, _Upload_, and _Load_ your data, refer back to how you did this during the Unit 1 labs.


Greens and Others
=================

- Just like in the classroom activity, we want to group people whose predominant personality color is <font color = "green"> _Green_ </font> together and those whose predominant personality color is not Green together.
- An easy way to do this is with the `ifelse` function.
- Run the following code to create a new variable called `pc_group`.

```r
colors <-
  transform(colors, pc_group =
    ifelse(p_color.label == "Green",
           "Green", "Other"))
```


What did we just do?
==================


```r
colors <-
  transform(colors, pc_group =
    ifelse(p_color.label == "Green",
           "Green", "Other"))
```

- This code is pretty complex. So let's break it down:
  - First, we tell R that we want to `transform` our dataset called `colors`...
  - Specifically, we want to create a new variable called `pc_group` (_predominant color group_).
  - To assign which group (<font color = "green"> _Green_ </font> or _Other_) each student belongs in, we use the `ifelse` function.

Using ifelse:
==================


```r
colors <-
  transform(colors, pc_group =
    ifelse(p_color.label == "Green",
           "Green", "Other"))
```

- **IF** a person's `p_color.label` variable has the value of <font color = "green"> `"Green"` </font>
  - That is, if `p_color.label ==` <font color = "green"> `"Green"` </font> 
- **then** give the new `pc_group` variable the value <font color = "green"> `"Green"` </font>
- ...
  
Using ifelse:
==================


```r
colors <-
  transform(colors, pc_group =
    ifelse(p_color.label == "Green",
           "Green", "Other"))
```

- **ELSE** (or otherwise) if the student's `p_color.label` is _NOT_ <font color = "green"> `"Green"` </font>
- **then** assign their `pc_group` variable the value `"Other"`


Now we learn to shuffle
=======================

- The term data scientists use for _shuffling_ data is _resampling_.
- If we want to calculate the medians for our <font color = "green"> `"Green"` </font> and `"Other"` groups we should write:

```r
median(~green | pc_group,
       data=colors)
```
- To randomly assign the _predominant color_ labels and compute each group's (randomized) median scores:

```r
median(~green | pc_group, 
       data=resample(colors, 
              shuffled="pc_group"))
```



What just happened?
=================


```r
median(~green | pc_group, 
       data=resample(colors, 
              shuffled="pc_group"))
```

- By writing: `data=resample(colors, shuffled="pc_group")`
  - R takes our `colors` data ...
  - And resamples (or 'shuffles') it up ...
  - By shuffling all of the `pc_group` values.
  - All of the other values of the data stay the same.
- After resampling, the median <font color = "green"> _Green_ </font> scores for the  different groups are completely random.

Shuffling many times
====================

- So why should we bother resampling?
  - If we resample lots and lots of times, we can see how often our actual observed difference occurs by chance.
  - Knowing this will help us decide if people with a <font color = "green"> _Green_ </font> predominant color typically have large <font color = "green"> _Green_ </font> color scores.
- Use a `do`-loop to compute the shuffled-medians 300 times.

```r
shfl_colors <- 
  do(300)*median(~green | pc_group, 
       data=resample(colors, 
        shuffled="pc_group"))
```


What have we got now?
==================

- Now that we have shuffled our data 300 times ...
  - And each time computed the medians for our randomized data.
  - We can type the following to see the first few randomized medians:

```r
head(shfl_colors)
```
- And we can calculate the difference in color score between our randomized <font color = "green"> `"Green"` </font> and `"Other"` groups. 

Finding the difference
=====

- Similar to how we used `transform` to add our new variable `pc_group` to our `colors` data, we can use `transform` on our shuffled data to compute the difference in median values.
- To do so, run:

```r
shfl_colors <-
  transform(shfl_colors,
    Diff = Green - Other)
```
- **Explain, in your own words, what this code does exactly.**


On your own
===========

- **Make a visualization of the difference in medians.**  
- **What was the typical difference?  What was the largest difference? What was the smallest?**
- **How does the true median difference compare to this distribution of randomized differences?**
