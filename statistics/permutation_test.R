
set.seed(135)
s1 <- round(rnorm(10, 100, 16))
s2 <- round(rnorm(10, 100, 16))
t.test(s1, s2, var.equal = TRUE)

# In real life, we don't know with certainty the distribution of the population from which our
# samples are drawn. or we may have small sample sizes. t-test is pretty robust and usually reliable
# even when its assumptions are wrong. 

# If you still have doubts, try a permutation test.

# the permutation test takes all possible combinations of group membership and creates a permutation distribution.
# If we assume both samples came from the same population, a data point in group 1 is just as likely to appear in 
# group 2. If we determine all possible permutations, we can calculate our statistic of interest for each 
# permutation and create a distribution. Then, assess where our original statistic falls in this distribution. 

d0 <- mean(s1) - mean(s2)
alls <- c(s1, s2)  # combine into one vector
N <- length(alls)
n <- length(s1) 
p <- combn(N, n)  # generate all combinations of n chosen from N
dmeans <- numeric(dim(p)[2])  # vector to store means 
for (i in 1:dim(p)[2]) {
  dmeans[i] <- mean(alls[p[,i]]) - mean(alls[-p[,i]])
}
# plot histogram of all possible difference in means with lines indicating our original difference
hist(dmeans)
abline(v = d0, lty = 2)
abline(v = -d0, lty = 2)
# two sided p value
p.sim <- sum(dmeans <= -d0 | dmeans >= d0) / length(dmeans)


############ Use monte carlo simulation when samples are large ##############
# resampling, repeatedly resample from our combined vector of values to get a large number of combinations. 
dmeans <- numeric(2000)  
for (i in 1:2000) {
  g <- sample(N, n)
  dmeans[i] <- mean(alls[g]) - mean(alls[-g])
}
hist(dmeans)
abline(v = d0, lty = 2)
abline(v = -d0, lty = 2)
p.sim <- sum(dmeans <= -d0 | dmeans >= d0) / length(dmeans)

# Permutation methods tend to apply to only a narrow range of problems. However, when they apply,
# as in testing F = G in a two-sample problem, they give gratifyingly exact answers without parametric assumptions. 

















