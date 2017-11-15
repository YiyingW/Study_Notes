### Poisson Distribution with lambda = 2 ###
### Calculate p(x) for x = 0, 1, 2, ..., 10 when lambda = 2 ###
### dpois() is the Poisson probability function or "density" ###
### for x = 1 ###

dpois(1, 2)
dpois(1:10, 2)

### Make a table of the distribution with rounding at 3 decimal places ###
round(cbind(0:10, dpois(0:10, 2)), 3)

### plot the probabilities and give the plot a title and label and axis ###
### type = "h" makes the plot with the vertical lines ###
plot(0:10, dpois(0:10, 2), type="h", xlab="x", ylab="p(x)", main="Poisson Distribution (lambda=2)")

### ppois() is the cumulative distribution function, P(X <= x) ###
### find P(X <= 6) when lambda = 2 ###
ppois(6, 2)
# same as
sum(dpois(0:6, 2))

### Make a table of the first 11 Poisson probabilities and cummulative probabilities when lambda=2 ###
round(cbind(0:10, dpois(0:10, 2), ppois(0:10, 2)), 3)
