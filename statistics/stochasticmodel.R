# Stochastic Models
# Random Numbers 
# 1. Draw from existing distributions
runif(10, 0, 1)
runif(15, 1, 10)
rnorm(10, 50, 100)

# toss 100 coins for 7 times, how many get heads?
rbinom(n=7, size=100, prob=0.5)  # rbinom(n, size, prob)
plot(x = seq(0, 100), y = dbinom(x=seq(0, 100), size = 100, prob=0.5 ))

# 2. Draw from Custom-Made selections sample()
sample(1:10, 5)
population <- 1:10
sample(population, 5)
population <- c(30, 10, 50, 20, 70, 90)
sample(population, 15, replace = T)
options <- c("heads", "tails")
sample(options, 10, replace = T)

############# Genetic Drift ################
# def: the occurrence of changes in gene frequencies caused by entirely random events (not selection)
# two types, A and B have equal fitness and reproduce asexually in discrete generations. Total population size is 50 and remains constant over time.
# Next generation, each and every one of the N offspring have probability pA of being type A (pA = NA / N) and pB of type B (pB = NB / N)
N <- 50
pA <- c()
pA[1] <- 0.5
i <- 1
while (pA[i] < 1 & pA[i] > 0) {
  nA <- rbinom(1, size = N, prob = pA[i])
  pA[i+1] <- nA / N
  i <- i+1
}
plot(1:i, pA[1:i], xlab="generations", ylab="proportion type A", type="o")



# the number of generations it takes for one type to go extinct for different population size

N <- c(20, 50, 100, 200, 400, 800)
reps <- 100
matrix <- matrix(0, nrow=reps, ncol=length(N))
for (t in 1:100) {
  Fixation <- c()
  for (r in N) {
    pA <- c()
    i <- 1
    pA[i] <- 0.5
    while (pA[i] < 1 & pA[i] > 0) {
      nA <- rbinom(1, size = r, prob = pA[i])
      pA[i+1] <- nA / r
      i <- i+1
    }
    Fixation <- c(Fixation, i)
  }
  matrix[t,] <- Fixation
}
Means <- colMeans(matrix)
plot(N, Means, xlab = "population size", ylab = "Average time to fixation")
abline(lm(Means~N))
