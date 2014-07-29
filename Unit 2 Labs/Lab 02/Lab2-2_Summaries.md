Oh the Summaries ...
========================================================
transition: rotate
transition-speed: slow
css: IDSLabCSS.css

Unit 2 - Lab 2  

Directions: Follow along with the slides and answer the questions in **red** font in your journal.
 




Just the beginning
=====================

- Means, medians, MAD are just a few examples of **numerical summaries**
- **Numerical summaries** are numbers that describe characteristics of the data.
    - Means and medians described the _center_ of the data.
    - MAD describes the _spread_ of the data.
- **Can you think of other numbers that might describe your data?**

To start
========

- Load your personality color data again and name it: ` color_data`.
- Replace any code that says `COLOR` with the variable of scores for your _primary_ color.

Extreme values
==================

- Besides looking at _typical_ values, sometimes we want to see _extreme_ values. Like the smallest and largest values.
- To find these values, we can calculate the `min` and `max`.

```r
min(~COLOR, data=color_data)
```


```r
max(~COLOR, data=color_data)
```


Range
=====

- Using the `min` and `max` values, we can calculate the `range`.
- The range is another, but often less informative, measure of _spread_.
    - Calculate it by taking: $\max - \min$.
- Try the following    

```r
max(~COLOR, data = color_data) - min(~COLOR, data = color_data)
```


```r
range(~COLOR, data = color_data)
```


- **When might you use the _range_ to describe the spread of a distribution?**


Quartiles (Q1 & Q3)
=========================

- We often use the `median` to describe the _center_ of our data beccause half of the data is smaller than the median and the other half is larger.
- If instead we found a value that was larger than just 25% of our data, we would have computed the _1st quartile_.
- If we found the value that was larger than 75$ of our data, we call that the _3rd quartile_.




- **Why do you think we use the names _`st_ and _3rd quartiles_?**

The Inter-Quartile-Range (IQR)
========================

- Just like we used the `min` and `max` to comupute the `range`, we can also use the _1st_ and _3rd_ quartiles to compute the `IQR`.
- The `IQR` is another way to describe _spread_.
    - It describes how _wide_ or _narrow_ the middle 50% of our data are.
    - If the `IQR` is a small number, then the middle 50% of our data is close to the `median`.
    - Otherwise, the middle 50% of our data is further away from our median.

```r
IQR(~COLOR, data = color_data)
```




Other quantiles
===============

- The median, 1st and 3rd _quartiles_ can also be called the the 50th, 25th and 75th _quantiles_. 
    - They're called _quantiles_ becuase they're the _quantity_ of data that is smaller than that value.
    - The 25th quantile is the value that is larger than 25% of the data.
- We can computer quantiles too

```r
qdata(~COLOR, data = color_data, p = 0.35)
```


- Where `p` stands for the _percentage_ of data you'd like our value to be larger than.

Boxplots
========

- By using the medians, quartiles and min/max, we can construct a new single variable plot called the **box and whisker** plot, often shortened to just a **8boxplot**.
- Try making one of your primary color.


```r
bwplot(~COLOR, data=color_data)
```


- **Sketch your boxplot in your journal. Label the `min` `max`, `Q1`, `Q3` and `median`.**
- **How would you interpret your boxplot? Where is the bulk of your data? Where is it centered? Can you say anything about its shape?**

Our favorite summaries
=====================

- Numerical summaries are brief ways to describe, using numbers, our data.
- Computing lots of different summaries though can be tedious.
- Use the following command to compute some of our _favorite_ summaries

```r
favstats(~COLOR, data=color_data)
```

- **Which summaries are diesplayed?**
- **What do you think `n` stands for?**





