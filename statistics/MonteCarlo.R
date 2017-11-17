# simulate: generate some data from an underlying process
# when used for statistical inference, many Monte Carlo approaches fall under the rubric of Parametric Bootstrapping. 
# Note: different than the non-parametric bootstrap which uses resampling of the original data to generate empirical sampling
# distribution. 

runif(n=1, min=0, max=1)
runif(n=1000, min=0, max=1)
runif(n=1000) # default is from 0 to 1
random.uniform.1000 <- runif(1000)
hist(random.uniform.1000)

############################ Monte Carlo Simulations (mean and sd)#######################
N <- 2000
# first, initialize a variable to store the means
simulated_means <- rep(NA, N)
for (i in 1:N) {
  sim_data <- rnorm(n = 100, mean = 5, sd = 2)
  simulated_means[i] <- mean(sim_data)
  rm(sim_data)
}
hist(simulated_means)
sd(simulated_means)  # standard deviation of sampling mean, standard error, 2 / sqrt(n) = 2 / 100
# sample size influences the estimated standard error 

############################ Monte Carlo Simulations (regression)#######################
# Y ~ N(a+b*x, sd)
a <- 5
b <- 0.7
x <- seq(2, 20)  # predictor variable
y_fixed <- a + b*x  # the deterministic part of our model
par(mfrow=c(2, 1))
plot(y_fixed ~ x)
# But response is randomly sampled (conditioned on x), say sd=2.5
y.sim.1 <- rnorm(length(x), mean=y_fixed, sd=2.5)
plot(y.sim.1 ~ x)
abline(a = a, b = b)

# But what are the actual parameter estimates for the regression based on the simulated data (for y)? 
# run a linear regression
y.sim.1.lm <- lm(y.sim.1 ~ x)
summary(y.sim.1.lm)
confint(y.sim.1.lm)
abline(reg=y.sim.1.lm, lty=2, col="red", lwd=2)

# Do the above thing 200 times and plot all the simulation lines
plot(y_fixed ~ x)
abline(a=a, b=b)
for (i in 1:200) {
  y.sim <- rnorm(length(x), mean=y_fixed, sd=2.5)
  y.sim.lm <- lm(y.sim ~ x)
  abline(reg=y.sim.lm, lty=2, col="red")
}

