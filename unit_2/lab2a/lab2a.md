All About Distributions
========================================================
transition: none
css: ../../IDSLabCSS.css

Lab 2A

Directions: Follow along with the slides and answer the questions in **red** font in your journal.


In the beginning ...
====================

- Most of the labs thus far have covered how to visualize, summarize, and manipulate data.
    - We used visualizations to explore how your class spends their time.
    - We also learned how to clean data to prepare it for analyzing.
- Starting with this lab, we'll learn to use R to answer statistical questions that can be answered by calculating the mean, median and MAD.


How to talk about data
=====================

- When we make plots of our data, we usually want to know:
  - Where is the _bulk_ of the data?
  - Where is the data more _sparse_, or _thin_?
  - What values are _typical_?
  - How much does the data _vary_?
- To answer these questions, we want to look at the _distribution_ of our data.
    - We describe _distributions_ by talking about where the _center_ of the data are, how _spread_ out the data are, and what sort of _shape_ the data has.


Let's begin!
============

- _Export_, _upload_ and _import_ your class' _Personality Color_ data.
    - Name your data `colors` when you load it.
- Before analyzing a new data set, it's often helpful to get familiar with it. So:
    - **Write down the `names` of the 4 variables that contain the point-totals, or _scores_, for each personality color.**
    - **Write down the `names` of the variables that tell us an observation's _introverts/extroverts_ designation and whether they participated in playing _sports_.**
    - **How many variables are in the data set?**
    - **How many observations are in the data set?**


Estimating centers
====

- Create a `dotPlot` of the scores for your _predominant color_.
    - Pro-tip: If the `dotPlot` comes out looking wonky, try changing the value of the _character expansion_ argument, `cex`. 
    - The default value is `1`. Try a few values between `0` and `1` and a few more values larger than `1`.
- Based on your `dotPlot`: 
    - **Which values came up the most frequently? About how many people in your class had a score similar to yours?**
    - **What, would you say, was a _typical_ score for a person in your class for your predominant color? How does your own score for this color compare?**

Means and medians
=================

- _Means_ and _medians_ are usually good ways to describe the _typical_ value of our data.
- Fill in the blank to calculate the `mean` value of your predominant color score: 


```r
mean(~____, data = colors)
```

- **Use a similar line of code to calculate the `median` value of _your_ predominant color.**
    - **Are the `mean` and `median` roughly the same? If not, use the `dotPlot` you made in the last slide to describe why.**

Comparing introverts/extroverts
=========================

- Make a `dotPlot` of your _predominant color_ again; but this time, facet the plot based on introvert/extrovert variable.
- Use a line of code, using similar syntax to how you facet plots, to _calculate_ a value that describes the _center_ of _each_ birth gender.
    - **Do introverts or extroverts differ in their typical scores for your predominant color? Answer this statistical question using your `dotPlot`.**
- **`Assign` the mean values a name. Then place the name into the `diff()` function to calculate the difference. How much more/less did one birth gender score over the other for your predominant color?**

Estimating Spread
=============================

- Now that we know how to describe our data's _typical_ value we might also like to describe how closely the rest of the data are to this _typical_ value. 
    - We often refer to this as the **variability** of the data. 
    - Variability is seen in a `histogram` or `dotPlot` as the horizontal *spread*.
- **Look at the spread of the `dotPlot` you made for your predominant color then fill in the blank:**

_Data points in my plot will usually fall within_ ____ _units of the center._

- **Which group (introverts or extroverts), if either, seem to have values that are more spread out from the center?**

    
Mean Absolute Deviation
=======================

- The **mean absolute deviation** finds how far away, on average, the data are from the mean.
    - We often write _mean absolute deviation_ as _MAD_.
- Calculate the MAD of your _predominant color_ by filling in the blanks:


```r
MAD(~_____, data = colors)
```

- **Based on the MAD, which group (introverts or extroverts) has more variability for your predominant color's scores?**
    - **Does this match the answer you gave for the last question in the previous slide?** 


On your own
===========

- Do boys and girls in your class differ in their color scores? 
    - **Perform an analysis that produces _numerical summaries_ and _graphs_.**
    - **Then, write a few sentence interpretations that addresses this statistical question and considers the _shape_, _center_ and _spread_ of the distributions of the graphs you create.**
