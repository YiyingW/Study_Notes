library(dplyr)
library(data.table)
library(ggplot2)
skincancer <- data.frame(fread("skincancer.txt"))

ggplot(skincancer, aes(x=Lat, y=Mort)) + 
  geom_point() +
  geom_smooth(method='lm')

# fit a simple linear model
slm <- lm(Mort~Lat, data=skincancer)
# pearson correlation
cor(skincancer$Mort, skincancer$Lat)
# 95% confidence interval
predict(slm, skincancer, interval="confidence")
# 95% prediction interval for prediction of a new Y
predict(slm, data.frame(Lat=40), interval = "predict")
# 95% confidence interval for slope
confint(slm, "Lat", level = 0.95)

# Check assumptions 
# Residuals v.s. fits plot
# This plot is used to detect non-linearity, unequal error variances, and outliers
skincancer$residuals <- resid(slm)
skincancer$Mort_predicted <- predict(slm)
ggplot(skincancer, aes(x = Mort_predicted, y = residuals)) +
  geom_point()




student_height_weight <- data.frame(
  ht = c(63, 64, 66, 69, 69, 71, 71, 72, 73, 75),
  wt = c(127, 121, 142, 157, 162, 156, 169, 165, 181, 208)
)
slm_hw <- lm(wt~ht, data=student_height_weight)
# ANOVA table
anova(slm_hw)
