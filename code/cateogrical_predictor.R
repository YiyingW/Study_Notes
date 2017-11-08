library(dplyr)
library(ggplot2)
library(data.table)
library(GGally)

data <- data.frame(fread("birthsmokers.txt"))
# the scatter plot matrix
ggpairs(data)
# the plot of the estimated regression function
ggplot(data = data, aes(x=Gest, y=Wgt, color = Smoke)) +
  geom_point() +
  geom_smooth(method = "lm")
# In this sample of data, it appears the birth weights for non-smoking mothers is higher than that for smoking mothers
# regardless of the length of gestation. A hypothesis test or confidence interval would allow us to see if this result
# extends to the larger population 
# the difference between the two lines, represents the difference in the average birth weights for a fixed gestation length 
# for smoking and non-smoking mothers in the sample. 
