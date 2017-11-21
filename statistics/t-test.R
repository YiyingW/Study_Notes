
# simulate two samples to compare their mean by t test
x <- rnorm(10)
y <- rnorm(10)
t.test(x, y)

# generate many statistics to understand them 
ts <- replicate(1000, t.test(rnorm(10), rnorm(10))$statistic) 

# under the assumptions of normality and equal variance, we are assuming that the statistic will have a
# t-distribution with 10 + 10 - 2 = 18 df. we lose two df because we have to estimate the mean of each group
# how can we test if that is true?

########### Method 1: by looking at plots ###########
# plot the theoretical density of the t-statistic we should be seeing and superimposing the density of our sample
# on top of it. 
range(ts)  # -3.854319  4.368231 
pts <- seq(-4.5, 4.5, length = 100)
plot(pts, dt(pts, df = 18), col = "red", type = "l")  # theoretical density of the t-statistic with df of 18
lines(density(ts))  # density for our simulated sample

########### Method 2: quantile-quantile plot ###########
# the quantiles of two samples are calculated at a variety of points in the range of 0 to 1 and then are plotted
# against each other. If the two samples came from the same distribution with the same parameters, we'd see a straight line
# through the origin with a slope of 1. If the two samples came from similar distributions but their parameters were different,
# we'd still see a straight line but not through the origin. 
qqplot(ts, rt(1000, df=18))
abline(0, 1)


probs <- c(0.9, 0.95, 0.99)
quantile(ts, probs)
qt(probs, df=18)

# under the null hypothesis, the p-values for any statistical test should form a uniform distribution
# between 0 and 1. Any value in the interval 0 to 1 is just as likely to occur as any other value. For
# a uniform distribution, the quantile function is just the identity function. 
# look at the density of probability values when the null hypothesis is true
tps <- replicate(1000, t.test(rnorm(10), rnorm(10))$p.value)
plot(density(tps))
hist(tps)
qqplot(tps, runif(1000))
abline(0,1)
# the probabilities follow a uniform distribution




############## Power of the t-test #################
# suppose we have a difference in means equal to just one standard deviation, and we want to calculate the power
# for detecting that difference. 
t.power <- function(nsamp = c(10, 10), nsim = 1000, means = c(0, 0), sds = c(1, 1)) {
  lower = qt(0.025, df = sum(nsamp) - 2)
  upper = qt(0.975, df = sum(nsamp) - 2)
  ts = replicate(nsim, 
                 t.test(rnorm(nsamp[1], mean = means[1], sd = sds[1]),
                        rnorm(nsamp[2], mean = means[2], sd = sds[2]))$statistic)
  sum(ts < lower | ts > upper) / nsim  # defination of power, the ratio of obs in rejection region to the total length
}
t.power()  # 0.048
t.power(means = c(0, 0.3))  # 0.101
t.power(means = c(0, 1))   # 0.572
t.power(means = c(0, 2))  # 0.989

# How large a sample size would we need to detect difference of -.3 with 95 % power?
samps <- c(100, 200, 300, 400, 500)
res <- sapply(samps, function(n)t.power(means = c(0, 0.3), nsamp = c(n, n)))
names(res) <- samps
res


###################### Issue of unequal variances ###################
# if the power of the test is improved using Welch's t test when the variances are unequal
t.power1 <- function(nsamp=c(10,10), nsim=1000, means=c(0,0), sds=c(1,1), var.equal=TRUE) {
  tps = replicate(nsim,
                  t.test(rnorm(nsamp[1], mean=means[1], sd=sds[1]),
                         rnorm(nsamp[2], mean=means[2], sd=sds[2]))$p.value)
  sum(tps < 0.025 | tps > 0.975) / nsim
}
t.power1(nsim=10000, sds = c(1, 2), mean=c(1,2)) # 0.1771
t.power1(nsim=10000, sds = c(1, 2), mean = c(1,2), var.equal = FALSE)  # 0.1751

# for a variety of sample sizes
sizes = c(10,20,30,40)
res1 = sapply(sizes, function(n)t.power1(nsim=10000, sds=c(1,2), mean=c(1,2), nsamp=c(n,n)))

res2 = sapply(sizes, function(n)t.power1(nsim=10000, sds=c(1,2), mean=c(1,2), nsamp=c(n,n), var.equal = FALSE))
