set.seed(666)
########## simulating n coin flips ######## 
prop = c()
for (n in 4:100) {
  nums <- runif(n, 0, 1)
  result <- ifelse(nums < 0.5, TRUE, FALSE)
  prop <- c(prop, sum(result) / n * 100)
}
plot(4:100, prop,
     xlab = "number of coin flips",
     ylab = "percentage of head, %",
     main = "simulation of coin flips")


######## The probability of getting 4 heads if we flip the coin 4 times over and over again #######
count = 0
for (i in 1:1000) {
  num_heads <- sum(ifelse(runif(4) < 0.5, TRUE, FALSE))
  if (num_heads == 4) count = count + 1
}
print(count / 1000)

########## A fair coin. on average, how many flips till you get two of the same flip in a row ########
n = 10000
num_flips <- rep(NA, n)
for (i in 1:n) {
  coins <- ifelse(runif(2) < 0.5, T, F)
  while (coins[length(coins)] != coins[length(coins)-1]) {
    coins <- c(coins, ifelse(runif(1) < 0.5, T, F))
  }
  num_flips[i] <- length(coins)
}
print(mean(num_flips))

######## A fair coin. on average, how many flips would you need to get two heads in a row? #######
n = 10000
num_flips <- rep(NA, n)
for (i in 1:n) {
  coins <- ifelse(runif(2) < 0.5, T, F)
  while (coins[length(coins)] + coins[length(coins) - 1] != 2) {
    coins <- c(coins, ifelse(runif(1) < 0.5, T, F))
  }
  num_flips[i] <- length(coins)
}
print(mean(num_flips))
