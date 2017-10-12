A Diamond in the Rough
===============================
transition: none
css: ../../IDSLabCSS.css

Lab 1F

Directions: Follow along with the slides and answer the questions in **red** font in your journal.




Messy data? Get used to it
==========================

- Since lab 1, the data we've been using has been pretty _clean_.
- Why do we call it _clean_?
    - Variables were named so we could understand what they were about.
    - There didn't seem to be any _typos_ in the values.
    - Numerical variables were considered numbers.
    - Categorical variables were composed of categories.
- Unfortunately, more often than not, data is _messy_ until YOU clean it.
- In this lab, we'll learn a few essentials for cleaning _dirty_ data.


Messy data?
===========

- What do we mean by messy data?
- Variables might have _non-descriptive names_
    - _Var01_, _V2_, _a_, ...
- Categorical variables might have _misspelled categories_
    - _"blue"_, _"Blue"_, _"blu"_, ...
- Numerical variables might have been _input incorrectly_. For example, if we're talk about people's height in inches:
    - _64.7_, _6.86_, _676_, ... 
- Numerical variables might be _incorrectly coded_ as categorical variables (Or vice-versa)
    - "64.7", "68.6", "67.6"
    
The American Time Use Survey
============================

- To show you what _dirty_ data looks like, we'll check out the _American Time Use Survey_, or _ATU_ survey.
- What is ATU survey?
    - It's a survey conducted by the US government (Specifically the Bureau of Labor Statistics).
    - They survey thousands of people to find out exactly what activities they do throughout a single day.
    - These thousands of people combined together give an idea about how much time the typical person living in the US spends doing various activites.

Load and go:
============================

- Type the following commands into your console:

```r
data(atu_dirty)
```

```r
View(atu_dirty)
```
- **Just by viewing the data, what parts of our ATU data do you think need cleaning?**

Description of ATU Variables
=============================

- The description of the actual variables:
    - `caseid`: Anonymous ID of survey taker.
    - `V1`: The age of the respondent.
    - `V2`: The gender of the respondent.
    - `V3`: Whether the person is employed full-time or part-time.
    - `V4`: Whether the person has a physical difficulty.
    - `V5`: How long the person sleeps, in minutes.
    - `V6`: How long the survey taker spent on homework, in minutes.
    - `V7`: How long the respondent spent socializing, in minutes.

New name, same old data
=======================

- To fix the variable names, we need to _assign_ a new set of names in place of the old ones. 
    - Below is an example of the `rename` function:

```r
atu_cleaner <- rename(atu_dirty, age = V1,
                       gender = V2)
```

- **Use the example code and the variable information on the previous slide to rename the rest of the variables in `atu_dirty`.**
    - Names should be short, contain no spaces and describe what the variable is related to. So use abbreviations to your heart's content.


Next up: Strings
=============================

- In programming, a _string_ is sort of like a _word_.
    - It's a value made up of _characters_ (i.e. letters)
- The following are example of strings. Notice that each **string** has quotes before and after.

```r
"string"
```

```r
"A1B2c3"
```

```r
"Hot Cocoa"
```

```r
"0015"
```

Numbers are words? (Sometimes)
=============================

- In some cases, R will treat values that look like _numbers_ as if they were _strings_.
- Sometimes we do this on purpose.
    - For example, we can code `Yes/No` variables as `"1"`/`"0"`.
- Sometimes we don't mean for this to happen.
    - The _number of siblings_ a person has should not be a string.
- Look at the `str`ucture of your data and the variable descriptions from a few slides back:
    - **Write down the variables that should be _numeric_ but are improperly coded as _strings_ or _characters_.**


Changing strings into numbers
=============================

- To fix this problem, we need to tell R to think of our _numeric_ variables as numeric variables.
- We can do this with the `as.numeric` function. 
    - An example using this function is below:

```r
as.numeric("3.14")
```

```
[1] 3.14
```
- Notice: We started with a string, `"3.14"`, but `as.numeric` was able to turn it back into a number.

Mutating in action
=============================

- Look at the variables you thought should be _numeric_ and select one. Then fill in the blanks below to see how we can correctly code it as a number:

```r
atu_cleaner <- mutate(atu_cleaner, 
                 age = as.numeric(age),
                 ___ = as.numeric(___))
```
- **Once you have this code working, use a similar line of code to correctly code the other _numeric_ variables as numbers.**


Deciphering Categorical Variables
=================================

- We mentioned earlier that we sometimes code categorical variables as numbers.
    - For example, our `gender` variable uses `"01"` and `"02"` for `"Male"` and `"Female"`, respectively.
- It's often much easier to analyze and interpret when we use more descriptive categories, such as `"Male"` and `"Female"`.


Factors and Levels
==================

- R has a special name for _categorical_ variables, called _factors_.
- R also has a special name for the different _categories_ of a _categorical_ variable.
    - The individual categories are called _levels_.
- To see the levels of `gender` type:

```r
tally(~gender, data = atu_cleaner)
```
- **Use similar code as we used above to write down the levels for the three factors in our data.**


A level by any other name...
===========================

- If we know that '`01`' means '`Male`' and '`02`' means '`Female`' then we can use the following code to revalue the _levels_ of _gender_.
- Type the following command into your console:

```r
atu_cleaner <- mutate(atu_cleaner, gender = 
                 revalue(gender, 
                         c("01"="Male", 
                           "02" = "Female")))
```

- This code is definitely a bit of a mouthful. Let's break it down.

Allow me to explain
===================


```r
atu_cleaner <- mutate(atu_cleaner, gender = 
                  revalue(gender, c("01"="Male", 
                    "02" = "Female")))
```

- This code is saying:
    - Replace my current version of `atu_cleaner`...
    - with a mutated one where ...
    - the `gender` variable's levels ...
    - have been revalued..."
    - where `"01"` will now be `"Male"`...
    - and `"02"` will now be `"Female"`.


Finish it off!
==================

- **Revalue the categorical variable about whether the person surveyed had a physical challenge or not. The coding is currently:**
    - `"01"`: Person surveyed _did not_ have a physical challenge.
    - `"02"`: Person surveyed _did_ have a physical challenge.
- **Write a script that:**
    - (1) Loads the `atu_dirty` data set
    - (2) Cleans the the data as we have in this lab
    - (3) Saves a copy of the cleaned data (see next slide).

The final lines
===============

- The last few lines of your script to clean and then save your American Time Use data might look like:


```r
atu_clean <- atu_cleaner
```

```r
save(atu_clean, file = "atu_clean.Rda")
```

- Be sure to `View` your data to make sure it looks clean and tidy before saving.


