library(data.table)
library(dplyr)

data <- data.frame(fread("OBJ0038657_species_long.txt"))
data$Value <- log2(data$Value)


mean.Value <- with(data, tapply(Value, list(Key, cond_1), mean, na.rm=TRUE))
cv.Value <- with(data, tapply(Value, list(Key, cond_1), var, na.rm=TRUE))

plot(mean.Value)
abline(a=0, b=1)

# Computing Levene's statistic for multifactorial designs
# Levene's test is often used before a comparison of means. When Levene's test shows significance, one should
# switch to more generalized tests that is free from homoscedasticity assumptions (even non-parametric tests).
# also used as a main test for whether two sub-samples in a given population have equal or different variances.

# for one group
levene.test <- function(y, group) {
  meds <- tapply(y, group, median, na.rm=TRUE)
  resp <- abs(y - meds[group])
  table <- anova(lm(resp ~ group, na.action=na.omit))
  row.names(table)[2] <- " "
  cat("Levene's Test for Homogeneity of Variance\n\n")
  table[, c(1, 4, 5)]
}
