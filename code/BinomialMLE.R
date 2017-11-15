### Likelihood & Loglikelihood ###
## Define the likelihood function for binomial sample with N = 1315 and X = 630

likelhd = function(p) dbinom(630, 1315, p)
loglik = function(p) dbinom(630, 1315, p, log=TRUE)

### Plot the likelihood function
# postscript("name")
# dev.off()

plot(likelhd, 0, 1, xlab="pi", ylab="l(p)", main="Binomial likelihood, N=1315, X=630")
plot(loglik, 0, 1, xlab="pi", ylab="l(p)", main="Binomial loglikelihood, N=1315, X=630")



########### MLE ##################
mle = optimize(likelhd, c(0, 1), maximum=TRUE)
mle
mle$maximum  # value of the MLE

########### 1-proportion Hypothesis test, Approximate 95% CI, and MLE ########
####### H0: p=0.5
prop.test(630, 1315, 0.5)
### when the sample size is small, we can do an exact test via
binom.test(630, 1315, 0.5)
