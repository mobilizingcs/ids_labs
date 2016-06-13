Making Maps
========================================================
transition: rotate
transition-speed: slow
css: ../../IDSLabCSS.css

Unit 3 - Lab 7 

Directions: Follow along with the slides and answer the questions in **red** font in your journal.
 



Informative and Fun!
========================

- Maps are some of the funnest plots to make because the info represents:
  - Where we live.
  - Where we go.
  - Places that interest us.
- Maps are also helpful to display geographic information.
  - John Snow (the physician, not the character from _Game of Thrones_...) once famously used [a map to discover how cholera was transmitted.](http://commons.wikimedia.org/wiki/File:Snow-cholera-map-1.jpg#mediaviewer/File:Snow-cholera-map-1.jpg)
  
Load and go!
===========

- In the previous labs, we scraped a tall mountains data file.
  - In the _Files_ pane, click on your data to load it or run:

```r
library(XML)
data_url <- 
  "http://web.ohmage.org/mobilize/resources/ids/data/mountains.html" 
var_classes <- c(rep('factor', 3),
                 rep('numeric', 7))
tables <- readHTMLTable(data_url, 
                        colClasses=var_classes)
mountains <- tables[[1]]
names(mountains) <- gsub("[\n]*[[:space:]]",
                         "",names(mountains))
```


Latitudes & Longitudes
==================

- To make a map, you need data with some _latitudes_ & _longitudes_.
  - _Latitude_ describes your North/South location. Positive values mean you're north of the Equator. Negative values mean you're south of it.
  - _Longitude_ describes your East/West location. Positive values mean you're east of the Prime Meridian. Negative values mean you're west of it.
  - Los Angeles is -118.25 degrees longitude and 34.05 degrees latitude.
  
Making a basic map
==================

- Using our mountains `long` and `lat` values, we can make:

```r
make_map(latitude=lat, longitude=long, 
         data=mountains)
```
- **Are the 200 tallest peaks evenly distributed across the U.S.? Or are they concentrated? If so, where are the highest concentrations?**

California mountains
=========

- Suppose we wanted to get a better look at our California moutnains.
- To subset our data, run:

```r
ca_mtns <- subset(mountains, 
                  state=="California")
```
- And then make a map of just these mountains:

```r
make_map(latitude=lat, longitude=long, 
         data=ca_mtns)
```

Using colors
=========

- Maybe you'll want to change the color of the points.
  - To do so, add in the `col` argument

```r
make_map(latitude=lat, longitude=long, 
         data=ca_mtns, col="red")
```
- Even better though, is when you select the color to be a categorical variable

```r
make_map(latitude=lat, longitude=long, 
         data=ca_mtns, col=range)
```
- **How many mountain ranges are in California?**

Scaling points
==========

- Besides coloring points based on a categorical variable, we can also scale the points based on a numerical variable.
- The 5th largest mountain in California has a rank of 34. Let's look at just the top 5 tallest mountains in CA by first subsetting:

```r
tall_mtns <- subset(ca_mtns, rank <= 34)
```
- And then scaling them by their prominence in meters.

```r
make_map(latitude=lat, longitude=long, 
        data=tall_mtns, scaleby=prominence_m)
```

Points too big?
===========

- You can shring the size of the points by adding the `size` argument.

```r
make_map(latitude=lat, longitude=long, 
        data=tall_mtns, scaleby=prominence_m,
        size=75)
```

- The `size=75` argument means make the points 75% of their normal width.


Putting everything together
=====

- We can combine scaling, sizing and color to make our final product:

```r
make_map(latitude=lat, longitude=long, 
        data=tall_mtns, scaleby=prominence_m,
        size=75, col=range)
```


On your own
===========

- Create a subset for the 10 smallest mountains in the entire data set and name the object `short_mtns`. Then answer the following questions by making appropriate maps:
- **What code did you run to create the `short_mtns` subset?**
- **Which states are the 10 shortest mountains in?**
- **How many mountain ranges are these mountains in?**
