library(ggplot2)
theurl <- "http://www.amstat.org/publications/jse/datasets/fev.dat.txt"
lungs <- read.table(theurl, header=FALSE)
names(lungs) <- c("age", "lung_cap", "height", "gender", "smoke")

p <- ggplot(lungs)
p + geom_point(aes(x=height, y=lung_cap))
p + geom_point(aes(x=age, y=lung_cap))
p + geom_point(aes(x=age, y=height))

p + geom_bar(aes(age), colour="white") + facet_grid(gender~.)
p + geom_bar(aes(height), colour="white") + facet_grid(gender~.)
p + geom_point(aes(x=age,y=lung_cap, colour=as.factor(gender)))
