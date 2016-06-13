Growing (Classification) Trees
========================================================
transition: rotate
transition-speed: slow
css: ../../IDSLabCSS.css

Unit 4 - Lab 6

Directions: Follow along with the slides and answer the questions in **red** font in your journal.
 



Trees vs. Lines
====================

- Up to now, we've used linear models to make predictions.
  - We took data, fit the best line possible and then used that line to make predictions.
- We now turn our focus to making predictions using _trees_.
  - Instead of using a line, we split our data into branches.
  - Each branch is split based on a _yes or no_ question.
  - The branches help sort our data into _leaves_, or _nodes_.
- In this lab, we'll see how to build trees in R, build a few and then test their predictive performance.


Starting simple
===============

- Start by loading our `titanic` data set:

```r
data(titanic)
```

- To build a tree that predicts whether someone survived or not based on their gender, run:

```r
m1 <- tree(survived~gender, data=titanic)
```

- `m1` is a convenient way to save our first model.
- `tree` is the function that builds tree models.

Our first tree
==============

- Now that we've created our first tree model, let's see what it looks like:

```r
treeplot(m1)
```
- A `treeplot` takes the model we made previously and displays the tree with some other information.
  - We'll go over how to interpret this plot on the next slide.
  
Interpreting tree plots (1)
======================

<img src="unit4lab6-figure/unnamed-chunk-5.png" title="plot of chunk unnamed-chunk-5" alt="plot of chunk unnamed-chunk-5" style="display: block; margin: auto;" />

- Start by noticing that our branches are split on whether the person is a male (`gender = male`) or is a female (`gender = female`). 
  - The branches are the _arms_ of the plot.
  - Two new branches are formed each time we make a new split.

Interpreting tree plots (2)
======================

<img src="unit4lab6-figure/unnamed-chunk-6.png" title="plot of chunk unnamed-chunk-6" alt="plot of chunk unnamed-chunk-6" style="display: block; margin: auto;" />

- The `Yes` and `No` in the nodes (i.e. the circle shapes) are the categories of the `survived` variable. 
- In this case, the tree predicts that, if the person was a female, then `Yes`, she survived. If the person was a male, then `No`, he did not survive.

Interpreting tree plots (3)
======================

<img src="unit4lab6-figure/unnamed-chunk-7.png" title="plot of chunk unnamed-chunk-7" alt="plot of chunk unnamed-chunk-7" style="display: block; margin: auto;" />

- The fraction at the bottom of the nodes indicate a few things:
  - The first number is the number of people misclassified. That is, 109 males were predicted to die, but in reality they survived.
  - The second number is the total number of people in the particular node. In this case, there are 314 females in the `Yes` node.
  
Interpreting tree plots (4)
======================

<img src="unit4lab6-figure/unnamed-chunk-8.png" title="plot of chunk unnamed-chunk-8" alt="plot of chunk unnamed-chunk-8" style="display: block; margin: auto;" />

- Based on this tree:
  - **How many males in this data set survived?**
  - **Given your own gender, if you were on the Titanic, would this model predict that you survived or died?**
  
  
Trees with more branches
=======================

- Creating more complex trees is easy. We can just add more variables to the `tree` function like so:

```r
m2 <- tree(survived~gender+age+class+embarked, 
           data=titanic)
```
- Create a tree plot for this new, more complex, model.
  - **How many branches are there in total?**
  - **Mrs. Cumings was a 38 year old female with a 1st class ticket from Cherbourg. Does the model predict that she survived?**
  - **Check the original data set to see if Mrs. Cumings actually survived. Was the tree prediction correct?**
  

Making predictions
================================

- To evaluate our model's predictions, start by loading the `titanic_test` data set.

```r
data(titanic_test)
```

- We can use the `predict` function to compute the probability that each passenger lives or dies using our simple model, `m1`:

```r
predict(m1, newdata=titanic_test, type="prob")
```

- **What was the `name` and `gender` of the 1st person in the `titanic_test` data. What's the probability that they survived the Titanic based on our model?**


Calculating successful prediction
======================

- We can also use the `predict` function to see which tree model (`m1` or `m2`) does a better job at making predictions outside of the data they were trained on.
- Run the following to compute the success-rate for our 1st model:

```r
m1_pred <- predict(m1, newdata=titanic_test, 
                   type="class")
```

```r
m1_success <- subset(titanic_test, 
                     m1_pred == survived)
```

```r
nrow(m1_success)/nrow(titanic_test)
```

Which model is better?
======================

- **Describe, in detail, the coding steps required to compute the success rate for the `m1` model.**
  - **What percentage of people was this simple model able to correctly predict?**
  - **Do you think the more complex model, `m2`, will make fewer mistakes? Or more mistakes? Why or why not?**
- Carefully alter the code from the previous slide to compute the success rate for the `m2` model.
- **Which model, `m1` or `m2`, is better at correctly predicting whether a passenger on the Titanic lived or died?**


Are complex models always better? (1)
=======================================

- Typically, more complex models will make _fewer_ mistakes when using training data.
  - BUT! These complex models are sometimes so specific to the training data that they will actually perform worse on testing data.
- To create a model with additional complexity, we can adjust
  - (1) The _complexity parameter_, `cp`.
  - (2) The minimum number of objects a node must contain before we even consider splitting it.
  
  
Are complex models always better? (2)
=======================================

- For example, let's take the same variables that we used in `m2`
  - We'll allow for more complex models by changing `cp` from its default, `0.01`, to `0.005`.
  - We'll also lower the minimum number of people required to split a node down from its default, `20`, down to `10.

```r
m3 <- tree(survived~gender+age+class+embarked, 
           data=titanic, cp=0.005, minsplit=10)
```
- **What do you notice about the `treeplot` for `m3` compared to the `treeplot` for `m2`?**


Are complex models always better? (3)
=======================================

- Create the following model (But do NOT plot it! You will freeze your computer because it is so complex):

```r
m4 <- tree(survived~gender+age+class+embarked, 
           data=titanic, cp=0.0001,minsplit=1)
```

- **Compute the success rates for the models `m2`, `m3` and `m4`. Write them down in your Data Science Journals.**
- **Which model performed the best? Which model performed the worst?**