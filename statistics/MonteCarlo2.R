######################### using Monte Carlo simulations to generate confidence intervals in R #########################
x <- -10:10  # a covariate of known values
b0 <- 0
b1 <- 1.5  # slope of the model

# we generate our response variable y, based on x
y <- rnorm(length(x), b0 + b1 * x, 10)

plot(y~x)

# linear model of y ~ x 
lm.1 <- lm(y~x)
coef(lm.1)
confint(lm.1)

# covariance between parameter estimates 
vcov(lm.1)
summary(lm.1)

# plot the fitted line (estimated from this simple regression)
abline(lm.1, lwd = 3)

####################### Asymptotic normal confidence bands #######################
# this is what you would normally construct based on the SE and the t-distribution
# we can use predict() to construct the asymptotic normal confidence intervals 

x.frame <- data.frame(x=x)
conf.int <- predict(lm.1, interval="conf", newdata=x.frame)
head(conf.int)

# matlines (matrix of lines)
matlines(x = x.frame$x, y = conf.int, lty=c(1, 2, 2), lwd=2, col="red")


########### Function to perform the monte carlo simulation ##################
# for now, not accounting for uncertainty in residual variation 
SimReg1 <- function(mod.input = lm.1) {
  a = coef(mod.input)[1]  # intercept from model
  b = coef(mod.input)[2]  # slope from model 
  rse = summary(mod.input)$sigma  # residual squared error 
  y.sim <- rnorm(n = length(x), mean = a + b*x, sd = rse)
  lm.sim <- lm(y.sim ~ x)
  coef(lm.sim)
}

N = 1000
simulated.coef <- replicate(N, SimReg1())
simulated.coef <- t(simulated.coef)

sd(simulated.coef[,1])  # this should approxiamte the standard error for the intercept
sd(simulated.coef[,2])  # this should approximate the standard error for the slope
# the standard error uses statistics (sample data) standard deviations use parameters (population data)
# The standard error (SE) of a statistic (most commonly the mean) is the standard deviation of its sampling distribution,
# or sometimes an estimate of that standard deviation.

# compare to
summary(lm.1)$coef[,1:2]

# approximate monte carlo CIs for the slope
quantile(simulated.coef[,2], c(0.025, 0.975))

# compare to asymptotic CIs for the slope
confint(lm.1)[2,]

# as with any parameter estimates, we should consider if those estimated in this simulation are correlated
cor(simulated.coef[,1], simulated.coef[,2])
plot(simulated.coef[,1], simulated.coef[,2])


########### Correcting our simulation to allow for undertainty in RSE #############
# the monte carlo CIs generated above might be too narrow, as we have not accounted for uncertainty in the RSE
# correcting our simulation to correctly propogate error (sample from RSE and then sample values conditional upon that)
# rse represents a random sample from a distribution as well
# rse = redisual standard error, df = residual degrees of freedom for model
SimReg2 <- function(mod.input = lm.1) {
  a = coef(mod.input)[1]  # intercept from model
  b = coef(mod.input)[2]  # slope from model 
  df.sim <- mod.input$df 
  rse = summary(mod.input)$sigma  # residual squared error 
  rse.sim = rse*sqrt(df.sim/rchisq(1, df = df.sim))  # incorporate uncertainty by simulating the changes in the variance we would expect for rse
  # the larger the df, the more close rse.sim to rse
  y.sim <- rnorm(n = length(x), mean = a + b*x, sd = rse.sim)
  lm.sim <- lm(y.sim ~ x)
  coef(lm.sim)
}


