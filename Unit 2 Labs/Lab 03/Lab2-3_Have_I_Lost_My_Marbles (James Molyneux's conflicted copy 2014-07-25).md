Have I Lost My Marbles?
========================================================
transition: rotate
transition-speed: slow
css: IDSLabCSS.css

Unit 2 - Lab 3  

Directions: Follow along with the slides and answer the questions in **red** font in your journal.
 


Some background...
===============================
- Let's assume we have a bag of 100 marbles.
  - There are 23 <font color = "blue"> blue </font> marbles, and the rest are <font color = "green"> green </font>.

  - **What is the probability of selecting one <font color = "blue"> blue </font> marble from this bag?**
  
- In this lab, we will be _estimating_ **probabilities** by drawing  marbles from the bag and recording our responses.

But wait! I didn't bring a bag of marbles...
===============================
- No problem! You can **simulate** one in RStudio!
- Let's first create a vector for just the blue marbles


```r
blue <- rep("blue", times = 23)
```
  - **What do you think the `rep()` function does?**


Finishing up the bag
===============================
- Create a vector for the green marbles on your own. 
    - **Write down your command in your DS Journal.**
- Next, combine the `blue` and `green` vectors into one new vector and name it `marbles`.


Now we can create our first sample!
===============================
- If we just want to draw ONE marble out, we can run the following code:


```r
sample1 <- sample(x = marbles, size = 1)
```

- **What color marble did you draw?**

- **If we wanted a sample of 10 marbles instead of just one, how could we revise the code?**

- Run your revised code and **write down the sample of 10 marbles in your DS Journal.**

But wait!
================================
- **Is this sample of 10 marbles _independent_?**

- The `sample()` function can generally be expressed as


```r
sample(x = data_frame_to_sample_from, 
       size = number_of_times_to_sample, 
       replace = either TRUE or FALSE)
```

- So, we can use the `replace` argument to assure _independence_.
  - **What value should we assign to `replace` (`TRUE` or `FALSE`)? Explain your reasoning.**


Back to those 10 marbles...
================================
- Rerun your code for the sample size of 10 (don't forget to create a new name for this sample - maybe `sample2`?) and include the `replace` argument and **write down the sample in your DS Journal.**
  
- **What percent of the 10 marbles were blue?**
- **How does your answer compare to your neighbor's?**


Sample probabilities vs. the TRUE probability
=================================
- **How does your answer from the previous slide compare to the TRUE probability of selecting a blue marble?**

- Let's run our code a few more times, but instead of just drawing 10 marbles from our bag, let's draw out 100.

- Obviously, we don't want to write out all 100 marble colors, so we can simply tally up the number of blue marbles that our sample produced by using the `tally()` function.


Sample probabilities vs. the TRUE probability
=================================
- **In your sample of 100, how many marbles were blue? What is your sample probability?**
  - **How does this probability compare with the sample probability you found when you only selected 10 marbles?**
  - **Which probability is _closer_ to the TRUE probability?**


Sample probabilities vs. the TRUE probability
=================================
- Let's create another sample, but draw 1000 marbles! 
  - **How many marbles were blue? What is your sample probability?**
  - **How does this probability compare with the sample probabilities you found for 10 marbles and 100 marbles?**
  - **Which probability is _closer_ to the TRUE probability?**
  

How can we estimate the true probability of blue marbles?
=================================
- Now that we've done multiple simulations...
  - **What have you noticed about sample probabilities as the number of marble draws increases?**

- **Can we create a general _rule_ for what this means?**
