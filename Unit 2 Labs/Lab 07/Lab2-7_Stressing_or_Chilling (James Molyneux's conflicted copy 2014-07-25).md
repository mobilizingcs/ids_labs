Analysing our personality colors
========================================================
transition: rotate
transition-speed: slow
css: IDSLabCSS.css

Unit 2 - Lab 7  

Directions: Follow along with the slides and answer the questions in **red** font in your journal.
 




Colors and Sports
========================

- Answer the following questions:
    - **Do you think people's personalities affect their likes/dislikes? How and why?**
    - **Are there personality colors you think that are more interested in playing sports? If so, which colors?**


Personality colors
==================

- The predominant color questionnaire claims to be able to classify people into distinct personality types. 
    - Does this classification really mean anything?  Or is it just classifying by chance?  
    
- Using our own color data, we'll investigate whethers your predominant  color category help us know whether or not you enjoy sports?
- Load your personality color data and be sure to name it `colors`.


Which colors like sports?
==========

- Run the following command:

```r
tally(sport.label~p_color.label, data=colors)
```

- Which predominant personaility color had the highest percentage of people who played sports?
    - **Do you think there's something about this personality color that makes them tend to play more sports? Or is this just a spurious relationship?**


Directions
==========

- Using the ideas you learned in the previous labs:
    - Create the same 2-way frequency table as the previous slide BUT first permute (or shuffle/resample) your data's predominant colors. 
    - Create this tally of shuffled data 300 times and save the results as `shuffled_colors`.
    - Create a histogram, using the results of your shuffled data, of the color which had the highest percentage of people who played sports in your _actual_ data.
- When you're done, answer the questions on the following slide.


Questions
=========

- **Write down the code you used to shuffle your data once**
- **Write down the code you used to shuffle your data 300 times**
- Based on your histogram:
    - **About how often did your actual result occur in the randomized data?**
    - **Do you think there's evidence to support that claim that some personailities are more likely to play sports? Justify your answer.** 
