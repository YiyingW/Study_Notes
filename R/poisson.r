# Possion distribution is a limit of the Binomial distribution for rare events. 

##### compute the mean and standard deviation of samples from a Poisson distribution
# with an arrival rate of 10
##### compute the mean and standard deviation of samples from a Binomial distribution with 
# parameters n and p such that np = 10

## draw 10000 samples from a Poisson distribution with a mean of 10
pois_10000 <- rpois(10000, 10)
mean(pois_10000)
sd(pois_10000)
# np is always 10
n = c(20, 100, 1000)
p = c(0.5, 0.1, 0.01)

for (i in 1:3) {
  bino_10000 <- rbinom(10000, n[i], p[i])
  print(mean(bino_10000))
  print(sd(bino_10000))
}
# when we have low p, high n, the Binomial distribution is Poisson. 


# on average, there are 251/115 (2.182609) no-hitters per season, what is the probability
# of having seven or more in a season
1-ppois(7, lambda = 251/115)  # 0.001883984
# draw 10000 samples from a Poisson distribution with a mean of 251/115
n_nohitters <- rpois(10000, lambda = 251/115)
n_large <- sum(n_nohitters >= 7)
p_large <- n_large / length(n_nohitters)  # 0.0059



