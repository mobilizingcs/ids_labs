What's the FREQ?
================
transition: rotate
transition-speed: slow
css: IDSLabCSS.css

Unit 1 - Lab 8

Directions: Follow along with the slides and answer the questions in **red** font in your journal.





USA! USA!
=========

- In the previous lab, we cleaned our American Time Use Survey (ATUS) data to make it usable.
- Now we can actually start to analyze it to learn how people spend their time in the US.
- The process of cleaning and then analyzing data is very common in Data Science.

Using Numerical Summaries
=========================

- Take a look at the following code, but don't run it (yet).
    - **Based on the code, write down what the plot will display.**

```r
histogram(~homework | gender, 
          data = atus_clean, 
          subset = homework > 0, 
          layout = c(1,2))
```


- Now run the code
- **Based on the plot, do you think that the typical _male_ or the typical _female_ does more homework?**

Summarizing data
=================================

- Plots are extremely useful.
    - Help find interesting patterns.
    - Easy to make comparisons.
- Plots are also up to interpretation
    - **Find someone in your class who came to the opposite conclusion as you did about which gender, typically, does more homework**.
- Instead of relying solely on plots, we can use **summary statistic**.
    - **Summary statistics** are actual numbers.
    - Can help make comparisons easier to make.


Summarizing Numerical Variables
===============================

- You've seen lots of **summary statistics** in your class already.
    - We can use the `mean` or `median` to describe **typical** values.
    - Can use 'MAD' (mean absolute deviation) and 'sd' (standard deviation) to describe the **spread** of values.
- Run the following command:

```r
histogram(~sleep, data = atus_clean)
```

- **Based on the plot, write down what you think a _typical_ value is for the amount Americans sleep.**

Summarizing Numerical Variables
===============================

- To find the **typical** number of minutes Americans sleep:

```r
mean(~sleep, data = atus_clean)
```


```r
median(~sleep, data = atus_clean)
```

- **Why do you think the _mean_ and _median_ give slightly different numbers?**
    - **Check the histogram for `sleep` and see if there might be some values that are bigger/smaller than the smallest/biggest values.**


Median vs. Mean
===============

- When our data are **skewed**, it's often better to use the **median**.
    - **Why do you think that is?**
- Let's look again at the number of hours that _males_ and _females_ spent doing homework (Tossing out everyone who did 0 minutes of homework)

```r
histogram(~homework | gender, 
          data = atus_clean, 
          subset = homework > 0)
```


- **What's the _shape_ of these distributions?**
- **Should we use the `median` or `mean` to describe the _typical_ values?**

Which gender does more homework?
================================

- On your own:
    - **Create a `subset` of your data, called `atus_hw` that discards everyone who did 0 minutes of homework.**
    - Remember the: `subset(data, rule)`, command from lab 1.4.
    - **Type the following into the console:**

```r
median(~homework, 
       data = atus_hw, 
       groups = gender)
```


- **Which gender, typically, does more homework?**
- **Describe what `groups = gender` does in the code.**

Spread is important too!
========================

- Now that we know which _gender_ spends more time on homework, we'd like to see just how much the **typical** number **varies**.
- Using the same `atus_hw` data from before, calculate:
    

```r
MAD(~homework,
    data = atus_hw,
    groups = gender)
```


```r
sd(~homework,
    data = atus_hw,
    groups = gender)
```

- **Does the time spent on homework vary by very much between the genders?**


What about categorical variables?
=================================

- When we're dealing with categorical variables, we lose the ability to calculate `means`, `MAD`s and the like.
    - (Honestly, what's the `mean` of categories _orange_, _apple_ and _banana_, for instance)
- Instead of using summary statistics, we calculate **frequency tables**

Frequency tables?
=================

- When it comes to categories, about all you can do is **count** or **tally** how often each category comes up in the data.
- Let's calculate how many _males_ and _females_ are in our data set.
- Type the following into the console:

```r
tally(~gender, data = atus_clean)
```

- **How many more _females_ than _males_ are there?**

2-way Frequency Tables
======================

- Counting the categories of a single variable is nice, but often times we want to make comparisons.
    - For example, what if we wanted to compare the number of people with phyiscal challanges and their genders?
- To makes these types of comparisons, we can make a 2-way frequency table:

```r
tally(phys_challenge~gender, data = atus_clean)
```

- **Run this command and write down what you notice about numbers of _males_ and _females_ with physical challenges. Are we still counting?**

Interpreting 2-way frequency tables
===================================

- Recall that  there were 1371 more women than men in our data set.
    - Comparing **counts** then doesn't make sense.
    - If there are more women, then we might also expect to have more women who have a physical challenge (compared to men).
- Instead of using **counts**, we use **percentages**
    - So for instance, roughly 89.198% of men do not have a physical difficulty.
    
On your own
===========

- **Which gender has a higher rate of _part time employment_?**
- **Explore the amount of time each gender socializes**
    - **Create a subset of data of people who socialized at least 1 minute or more**
    - **Compare the average amount of socializing done by each gender**
    - **Does one gender's amount of socializing vary more than the other?**




