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
sd(simulated_means)  # standard deviation of sampling mean, standard error, 2 / sqrt(n) = 2 / 10
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


########################## Generate Monte Carlo Simulations under null models ########################

# how can we use monte carlo simulations to generate the distributions of parameter estimates under null
# models. 

# Read data into R
dll.data <- read.csv("http://datadryad.org/bitstream/handle/10255/dryad.8377/dll.csv", header=TRUE)
dll.data$temp <- factor(dll.data$temp)
dll.data$replicate <- factor(dll.data$replicate)
dll.data$genotype <- relevel(dll.data$genotype, "wt")

dll.data.subset <- na.omit(dll.data[, c("SCT", "tarsus")])

# center our covariate (for interpreting the intercept)
dll.data.subset$tarsus.cent <- scale(dll.data.subset$tarsus, scale = F, center = T)

# what we need to do:
# 1. Fit the null model with the observed data.
# 2. Using the estimates from the null model, simulate the data (response values) under the null.
# 3. Fit the "full" model using the simulated data under the null model. -> get estimates under null.
# 4. Repeat this a large number of times. Store result for the parameters of interest. -> get a distribution of estimates under null. 
# 5. Fit the full model with the real data. Compare these estimates to the distributions generated under simulation. 

SimulationUnderNull <- function(model = dll.null, covariate = dll.data.subset$tarus.cent) {
  a = coef(model)[1]  # intercept for null model
  rse = summary(model)$sigma  # residual squared error for null model
  df = model$df # df for the null model
  
  # first we simulate the rse based on the observed rse and the dff (from a chisq distribution)
  # if variance is assumed to be uniform, then let sigma = constant = 1, and chi-square function
  # yields the sum of squared residuals function
  rse.sim <- rse*sqrt(df/rchisq(1, df = df))
  # now we generate simulated vector of the response variable under the null
  y.sim <- rnorm(n = length(covariate), mean = a, sd = rse.sim)
  # we take the simulated response vector and model it as a function of our co-variate(s) of interest
  lm.sim <- lm(y.sim ~ covariate)
  coef(lm.sim) # grad coefficents
}

# Fit model under null
dll.null <- lm(SCT ~ 1, data = dll.data.subset)
# Fit the full model
dll.model <- lm(SCT ~ 1 + tarsus.cent, data = dll.data.subset)
# extracting the slope of the model 
observed.coef <- coef(dll.model)[2]

#  let's take a quick look at some important parameters
coef(dll.null)
coef(dll.model)
summary(dll.null)$sigma
summary(dll.model)$sigma

# let's try running a single iteration of the simulation under the null
SimulationUnderNull(model = dll.null, covariate=dll.data.subset$tarsus.cent)

# let's do a lot of iterations
N = 1000
simulated.coefficients <- replicate(N, SimulationUnderNull(model = dll.null, covariate=dll.data.subset$tarsus.cent))
simulated.coefficients <- t(simulated.coefficients)
hist(simulated.coefficients[,2])

# the main mass of the variance under the simulation
quantile(simulated.coefficients[,2], c(0.025, 0.975))  # 95% percentiles UNDER THE NULL (NOT confidence intervals for the estimates because this is not real slope)

# use this to make a statement about how likely is our observed slope which is 26 under simulation (null), p-value
simulated.slopes <- simulated.coefficients[,2]
p.value.2 <- length(simulated.slopes[simulated.slopes >= observed.coef]) / N  # a monte carlo approximation for p value
