Our time.
================
transition: none
css: ../../IDSLabCSS.css

Lab 1H

Directions: Follow along with the slides and answer the questions in **red** font in your journal.




We've come a long way
=====================

- The labs until now have covered a huge range of topics:
    - We've learned how to make plots for different types of variables.
    - We know how to subset our data to get a more refined view of our data.
    - We've covered cleaning data and making two-way frequency tables.
- In this lab, we're going to combine all of these ideas and topics together to find out how we spend out time.

First steps first.
==================

- _Export_, _Upload_, _Import_ the class' `timeuse` data from your class' Home Page as `timeuse_raw`.
- The data, as-is, is very messy and hard to interpret/analyze.
    - Fill in the blank with the name of your imported data to format it:

```r
timeuse <- timeuse_format( _____ )
```
- This function formats/cleans the data so that each row represents a typical day for each student in the class

timeuse_format specifics
=============

- In case you're wondering, the timeuse_format function:
    - Takes each student's daily data and adds up all of the time spent doing each activity for each day.
    - The time spent on each activity for each day is then average together to create a _typical day_ in the life of each student.


Exploring your data
===================

- Start by getting familiar with your `timeuse` data: 
    - **How many observations and variables are there?**
    - **What are the names of the variables?**
    - **Which row represents YOUR _typical day_?**
    
How do we spend our time?
==========================

- We would like to investigate the _research question_: "How did our class spend our time?"
    - To do this, we'll perform a statistical investigation.
- **State and answer two statistical questions based on our _research question_.**  
    - **Also, state one way in which your personal data is _typical_ and one way that it _differs_ from the rest of the class.** 
- **Justify your answers by using appropriate statistical graphics and summary tables.** 
    - **If you subset your data, explain why and how it benefited your analysis.**
