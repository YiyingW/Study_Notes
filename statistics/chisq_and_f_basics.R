###### the chi squared distribution is just sampling from a distribution of sum of squares. It tells you something about
# variances. 

# This function generates sum of squares with n = 100, mean = 0 and variance = 1
disti_Gaussian.fun <- function(){
  x <- rnorm(100)
  y <- sum((x - mean(x))^2)
  y
}
# replicates the function 1000 times.
s <- replicate(1000, disti_Gaussian.fun())

par(mfrow=c(2, 1))
plot(density(s, adj=1.3))
hist(s, add=T, freq=F)

# Random sampling from a chi squared distribution with df = 1000 and ncp = 0
q <- rchisq(1000, 100)
plot(density(q, adj=1.3))
hist(q, add=T, freq=F)

# Below is the curve based on the theoretical expectation
curve(dchisq(x, 100), 50, 160, add=T, col="red")

########### the F distribution is the ratio of two chi squared distributions
a <- 100
b <- 20
disti_F.fun <- function(a=100, b=20){
  x.num <- rnorm(b, 0, 1)  # numerator
  y.num <- sum((x.num - mean(x.num))^2)
  x.den <- rnorm(a, 0, 1)  # denominator
  y.den <- sum((x.den - mean(x.den))^2)
  z <- (y.num/b)/(y.den/a)
}

f.sim <- replicate(1000, disti_F.fun())

par(mfrow=c(3, 1))
plot(density(f.sim, adj=1.3))
hist(f.sim, add=T, freq=F)


# random sampling from chi squared distributions
q <- rchisq(1000, 20)
r <- rchisq(1000, 100)
f.chi <- (q/b)/(r/a)
plot(density(f.chi, adj=1.3))
hist(f.chi, add=T, freq=F)

# directly from f
f.f <- rf(1000, 20, 100)
plot(density(f.f, adj=1.3))
hist(f.f, add=T, freq=F)

# Below is the curve based on the theoretical expectation
curve(df(x, 20, 100), 0, 3, add=T, col="red")
