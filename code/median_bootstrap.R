library(dplyr)
n <- 5
obs <- c(103, 104, 109, 110, 120)
B <- c(14, 20, 1000, 10000)
table <- data.frame(B = numeric(), SD = numeric())

for (b in B) {
  results <- rep(0, b)
  for (i in 1:b) {
    results[i] <- median(sample(obs, n, replace = TRUE))
  }
  table <- table %>%
    rbind(data.frame(B = b, SD = sd(results)))
}

