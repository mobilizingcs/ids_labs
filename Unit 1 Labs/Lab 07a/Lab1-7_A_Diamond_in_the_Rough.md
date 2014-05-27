A Diamond in the Rough
======================
transition: rotate
transition-speed: slow
css: IDSLabCSS.css

Unit 1 - Lab 7

Directions: Follow along with the slides and answer the questions in **red** font in your journal.




Messy data? Get used to it
==========================

- Since lab 1, we've been using data from the CDC.
- What you might not have noticed was how **clean** the data was:
    - Variables were named so we could understand what they were about.
    - There didn't seem to be any _typos_ in the values.
    - The variables were formatted properly.
    - etc.

- Unfortunately, more often than not, data is **messy** until YOU clean it.

Messy data?
===========

- What do we mean by messy data?
- Variables might have **non-descriptive names**
    - _Var01_, _V2_, _a_, ...
- Categorical variables might have **misspelled categories**
    - _"blue"_, _"Blue"_, _"blu"_, ...
- Numerical variables might have been **input incorrectly**. For example, if we're talk about people's height in inches:
    - _64.7_, _68.6_, _676_, ... 
- Numerical variables might be **incorrectly coded** as categorical variables (Or vice-versa)
    - "64.7", "68.6", "67.6"
    
The American Time Use Survey
============================

- To show you what **messy** data looks like, we'll check out the _American Time Use Survey_, or _ATUS_.
- What is ATUS?
    - It's a survey conducted by the US government (Specifically the Bureau of Labor Statistics)
    - Survey thousands of people to find out exactly what activities they do throughout a single day.
    - Combine the thousands of people together to get an idea about how much time the typical person living in the US spends doing various activites.

The American Time Use Survey
============================

- Let's take a look at the data before it's been properly cleaned.
    - Data scientists call the act of cleaning data **Munging**
- Type the following commands into your console:

```r
load("~/Dropbox/IDS Curriculum Design/Labs/Unit 1 Labs/Lab 07/atus_dirty.RData")
```


```r
View(atus_dirty)
```

- **Write down as many problems with the data as you can find.**

Fixing Variable Names
=====================

- Let's start our cleaning by fixing the variables names.
- Currently the variables are named: caseid, V1, V2, V3, V4, V5, V6, V7
    - Verify this by typing `names(atus_dirty)` into the console.

Description of ATUS Variables
=============================

- The description of the actual variables:
    - `caseid`: Anonymous ID of survey taker.
    - `V1`: The age of the respondent.
    - `V2`: The gender of the respondent.
    - `V3`: Whether the person is employed full time or part time.
    - `V4`: Whether the person has a physical difficulty.
    - `V5`: How long the person sleeps, in minutes.
    - `V6`: How long the survey take spent on homework, in minutes.
    - `V7`: How long the respondent spent socializing, in minutes.

New name, same old data
=======================

- To fix the variable names, we need to _assign_ a new set of names in place of the old ones. 
- Something like:

```r
names(atus_dirty) <- c(new_name1, new_name2, ...)
```


- This would take the first variable (caseid) and rename it `new_name1`.
- It would then take the second variable (caseid) and rename it `new_name2`.
- And so on...

On your own
===========

- **Come up with new variable names for each variable in the data**
    - Good names should be short and describe what the variable is related to.
    - Use an _underscore_ '_' to combine 2 words or abbreviated words if you'd like.
- **Rename your variables using the method on the previous slide**
- **`View` your data when you're done. Make sure that the names are in the correct order**


Everyone together
=================

- To keep everyone together for the rest of the lab, let's agree to adopt a common set of variable names.
    - (I'm sure your variable names were very good).
- Type the following into the console:

```r
names(atus_dirty) <- c("caseid",
                       "age",
                       "gender",
                       "fulltime_emp",
                       "phys_challenge",
                       "sleep",
                       "homework",
                       "socializing")
```



Playing with Strings
=============================

- In programming, a **string** is sort of like a _word_.
    - It's a value made up of **characters** (i.e. letters)
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


Numbers are words? (Sometimes)
=============================

- Type the following commands into the console:

```r
0015
```


```r
"0015"
```


- **What's different about each output?**
- **What do you think would happen if we multiplied two _strings_ together?**
    - **Create two strings and try it!**  
  
Changing strings into numbers
=============================    

- **strings** in R are called **character** objects.    
- Click on the _Environment_ pane and find the `atus_dirty`, data. 
- Click on the blue arrow next to it.
    - Find the `age` variable under `atus_dirty`
- **Notice that R thinks, for the moment, that _age_ is a _chr_ or _character_ object**
- **How many of the other variables you thought should be numerical variables were miss specified as factors _character_ objects?**


Changing strings into numbers
=============================

- To fix this problem, we need to tell R to think of our variables **`as.numeric`** variables.
    - But first, we need a way make changes to a single variable in the data.
    - Can do this using the dollar sign ($).
    - Whenever you need to get a single _variable_ from your _data_, write:
    <center>**`data$variable`**</center>
- **What happens when you type `atus_dirty$age` into the console?**

Changing strings into numbers
=============================

- To fix our **age** variable then, we'd write:

```r
atus_dirty$age <- as.numeric(atus_dirty$age)
```

- This code is telling R:
    - "Take the current values of my _age_ variable in my *atus_dirty* data..."
    - "... and assign it ..."
    - "... the **numeric** values of my _age_ variable in my *atus_dirty* data."

On your own
=============================

- Click on the _Environment_ tab again.
    - Click on the blue arrow next to `atus_dirty` and find `age`
    - **Instead of reading _chr_, next to `age`, what does it say now?** 
- **Using the steps you just followed to change `age` into a numeric variable, do the same stapes for the following variables:**
    - `sleep` 
    - `homework`
    - `socializing` 

Deciphering Categorical Variables
=================================

- Let's take a look at our **gender** variable:


```r
View(atus_dirty)
```


- Clearly, **gender** is a categorical variable but it's categories are represented by numbers.
    - This isn't necessarily a huge problem, but our data would be much clearer if we could replace the numbers `"01"` and `"02"` with `"Male"` and `"Female"`.
    
Factors and Levels
==================

- R has a special name for _categorical_ variables, called **Factors**.
- R also has a special name for the different _categories_ of a _categorical_ variable.
    - The individual categories are called **`"levels"`**.
- Take a look at the **`levels`** of the **gender** variable by typing:

```r
levels(atus_dirty$gender)
```


Factors and Levels
==================


```r
levels(atus_dirty$gender)
```


- Let's go through the code, step-by-step, to see what we're asking R to tell us:
    - "Show me the **`levels`** (i.e. categories)..."
    - "... for the factor (i.e. categorical variable) **gender**..."
    - "... which can be found in the **`atus_dirty`** data."

A level by any other name...
===========================

- If we know that `01` means `Male` and `02` means `female` then we can use the following code to rename the **`levels`** of _gender_.
- Type the following command into your console:

```r
levels(atus_dirty$gender) <- c("Male",
                               "Female")
```


- This code is telling R:
    - "Take my old levels of **gender**..."
    - "... and assign the values of ..."
    - "... **Male** to `01` and **Female** to `02`."

Factors and Levels
==================

- `View` your data again and look at the values for **gender**
- **Rename the values of the variable `phys_challenge` where**
    - **`01:** No difficulty
    - **`02:** Has difficulty

Ta-da!
======

- It took some work, but you should have a data set you can be proud of.
- Let's rename our data now that it's clean:

```r
atus_clean <- atus_dirty
```

- And let's also take a moment to admire it:

```r
View(atus_clean)
```




