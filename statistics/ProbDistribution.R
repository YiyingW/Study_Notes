######################## Probability Distributions in R ######################
factorial(x)
gamma(x)  # what?
beata(a, b)  # what?
choose(n, k)

dnorm(0, mean=0, sd=1)

par(mfrow=c(2, 1))
curve(dnorm(x, mean=0, sd=1), from=-5, to=10)
curve(dnorm(x, mean=5, sd=1.5), from=-5, to=10)

pnorm(2, mean=0, sd=1, lower.tail=T)
# you use this all the time whenever you calculate a p value
model.1 <- lm(SCT ~ genotype, data=dll.data)
anova(model.1)
# generate the p value directly from the F distribution
pf(q=50.316, df1=1, df2=1916, lower.tail=F) # prob of getting 50.316 or more extreme 

par(mfrow=c(2,1))
curve(dnorm(x), from=-5, to=5, ylim=c(0,1))
curve(pnorm(x), from=-5, to=5, add=T, col="red")

qnorm(0.95, 0, 1, lower.tail = T)

# what does a bimodal normal look like
par(mfrow=c(2, 1))
curve(dnorm(x, 5, 1), 0, 15)
curve(dnorm(x, 8, 1), 0, 15, add=T, col="red")

curve((dnorm(x, 8, 1) + dnorm(x, 5, 1)), 0, 15)

# what happens to a t distribution as sample size increases?
curve(dt(x, 3), -5, 5, ylim=c(0, 0.5))
curve(dt(x, 20), -5, 5, col = "red", add=T)
curve(dt(x, 2100), -5, 5, col="blue", add=T)

set.seed(1)
x <- seq(1:100)
y1 <- x + rnorm(length(x), 0, 3)
y2 <- rnorm(length(x), x, 3)


###### Look at the distribution for discrete data
curve(dpois(x, lambda=11), 0, 20)  # not looking so good
# this is better
x.discrete <- seq(0, 20, by=1)
plot(dpois(x.discrete, lambda=11), type="h", lwd=5)
barplot(dpois(x.discrete, 11))


