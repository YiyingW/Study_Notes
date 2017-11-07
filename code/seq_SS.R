library(dplyr)
library(data.table)

# sequential sums of squares are useful, because they can be used to test
# 1. whether one slope parameter is 0
# 2. whether a subset of the slope parameters are 0
data <- data.frame(fread("iqsize.txt"))
# Fit the linear regression model with x1 = brain as the only predictor
model_1 <- lm(PIQ~Brain, data = data)
anova(model_1)
# Fit the linear regression model with x1 = brain and x2 = height in the model
model_2 <- lm(PIQ~Brain+Height, data = data)
anova(model_2)
# SSR(x2 | x1) = 16197.5 - 13321.8 = 2875.7

# Fit the linear regression model with the two predictors in reverse order
model_3 <- lm(PIQ~Height+Brain, data = data)
model_4 <- lm(PIQ~Brain+Height+Weight, data = data)
