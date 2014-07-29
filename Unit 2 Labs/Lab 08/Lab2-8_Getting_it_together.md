Getting it together
========================================================
transition: rotate
transition-speed: slow
css: IDSLabCSS.css

Unit 2 - Lab 8  

Directions: Follow along with the slides and answer the questions in **red** font in your journal.
 




Putting data together
=====================

- Data scientists often want to investigate questions for which no single data set can answer.
    - To solve this problem, they create a data set by merging, or joining two or more different data sets.
    
- Load your personality color data and name it `colors`.
- Then _Download, upload, load_ your stress/chill data set and call it `stress`.


Looking at stress/chill
=======================

- Go ahead and `View` the stress/chill data.
- Based on the variables in the stress/chill data:
    - **What factors do you think might tend to raise or lower people's stress/chill level?**
    - **Do you think people's personalities might effect their general level of stress?** 
    - **Using just the stress/chill data, could you answer the question above?**
    

Finding variables in common:
============================

- We have data about people's stress levels in our `stress` data and data about people's personalities in our `colors` data.
- Look at the `names` of the variables in each data set.
- To merge different data sets together, we need to find a variable each data set has in common.
    - This would let us combine the information about our observations together.
- Look at the `names` of variables in each data set. 
    - **Which variables do the data sets have in common?**
    - **Which variable would make sense to merge the data sets together with? Why not one of the others?**
    

Putting them together
=====================

- To merge the data sets together, run the following command:

```r
merge(x = stress, y = colors, by = "user.id")
```


- Save this `merged` data set as `stress_colors`.
    - **What are the dimensions of this data set?**
    - **What happens if you set `x = color_data` and `y = stress` in the code above? How do the dimensions change?**
    

Saving our file to use later
============================

- Now that we've created the data set we want, it makes sense for us to save it for later use.
- Run the following code to save your  `stress_colors` data:

```r
save(stress_colors, file = "~/stress_colors.rda")
```


- Look in your home folder in the _Files_ tab to make sure your data was saved.



