sigma2 <- c(1, 2, 5, 10, 15)
result <- matrix(nrow=100, ncol=length(sigma2))
N <- 10000

i = 1
while (i <= nrow(result)) {
  p <- c()
  for (v in sigma2) {
    xs <- rnorm(N, 0, v)
    ys <- rnorm(N, 0, v)
    p <- c(p, sum(xs > 2 * ys) / N)
  }
  result[i,] <- p
  i = i + 1
}

apply(result, 2, mean)
apply(result, 2, sd)
apply(result, 2, var)

