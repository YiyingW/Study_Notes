require(arm)
require(car)

# Read in Data
dll.data <- read.csv("http://datadryad.org/bitstream/handle/10255/dryad.8377/dll.csv", header=TRUE)
# Quality Control of the dataframe
dll.data$temp <- factor(dll.data$temp)
dll.data$replicate <- factor(dll.data$replicate)
dll.data$genotype <- relevel(dll.data$genotype, "wt")  # setting the wt as reference
dll.data <- na.omit(dll.data)

############### Basic Plotting ################
par(mfrow=c(1,1))
plot(dll.data$SCT ~ dll.data$tarsus, col=c("red", "blue")[dll.data$genotype],
     ylim = c(5, 25), pch=c(1,2)[dll.data$temp], cex=0.8,
     ylab="# of SCT",
     xlab="Tarsus length",
     main="Scatterplot of Sex comb teeth and basi tarsus length")
legend(0.23, 25, legend=c("Dll 25", "Dll 30", "wt 25", "wt 30"),
       col=c("red", "red", "blue", "blue"),
       pch=c(1, 2, 1, 2))

######## We could plot lowess curves
# LOWESS: locally weighted scatterplot smoothing, creates a smooth line through a scatterplot
# to help you see relationship between variables and foresee trends

# fitting a non-linear spline using lowess, non-parametric
lines(lowess(dll.data$tarsus[dll.data$genotype=="Dll" & dll.data$temp=="25"], 
             dll.data$SCT[dll.data$genotype=="Dll" & dll.data$temp=="25"]),
      lwd=2, type="o", col="red")

lines(lowess(dll.data$tarsus[dll.data$genotype=="Dll" & dll.data$temp=="30"], 
             dll.data$SCT[dll.data$genotype=="Dll" & dll.data$temp=="30"]),
      lwd=2, type="o", col="red", pch=2)

lines(lowess(dll.data$tarsus[dll.data$genotype=="wt" & dll.data$temp=="25"], 
             dll.data$SCT[dll.data$genotype=="wt" & dll.data$temp=="25"]),
      lwd=2, type="o", col="blue")

lines(lowess(dll.data$tarsus[dll.data$genotype=="wt" & dll.data$temp=="30"], 
             dll.data$SCT[dll.data$genotype=="wt" & dll.data$temp=="30"]),
      lwd=2, type="o", col="blue", pch=2)

## now we can look at just the factors
par(mfrow=c(2,1))
boxplot(SCT~temp:genotype, data=dll.data,
        xlab = "Genotype by Temp treatments",
        ylab = "# of Sex Comb Teeth",
        main = "Variation in number of sex comb teeth by rearing temp and genotype")
boxplot(SCT~line, data=dll.data,
        xlab = "Line",
        ylab = "# of Sex Comb Teeth",
        main = "Variation in number of sex comb teeth by line")
require(lattice)
bwplot(SCT~line|temp:genotype, data=dll.data)
xyplot(SCT~tarsus|temp:genotype, data=dll.data)
xyplot(SCT~tarsus|line, data=dll.data)
xyplot(SCT~tarsus|line:temp:genotype, data=dll.data)


################# Basic linear models ##################
regression.1 <- lm(SCT~tarsus, data=dll.data)  # the intercept is implicit
# see the design matrix. design matrix has as many rows as observations
head(model.matrix(regression.1))
model.matrix(regression.1)[500:520,]
### Interpreting the model output 
coef(regression.1)  # point estimate for intercept and slope
confint(regression.1)  # CI for intercept and slope
summary(regression.1)
# residuals, a five number summary of residuals
# t value, the estimate / std error
# residual standard error, your standard error in your fitted value after accounting for your model
# R^2, measures the strength of the relationship between your model and the dependent variable. if the F test
# is significant, you can conclude that R^2 does not equal to 0. 

# The F-test of overall significance indicates whether your linear regression model provides a better fit to 
# the data than a model that contains no independent variables. An F test is a type of statistical test that is
# very flexible. F-tests can evaluate multiple model terms simultaneously, which allows them to compare the fits
# of different linear models. t-tests can evaluate just one term at a time. 
# null hypothesis: the model with no independent variables fits the data as well as your model.
# alternative hypothesis: your model fits the data better than the intercept-only model. 

# co-variances for the estimated parameters
# this helps you recognize whether the estimated values depend on each other and suggests some lack of 
# independence that needs to be fixed
vcov(regression.1)
# How would we get the standard errors for the estimates from this matrix? 

cov2cor(vcov(regression.1))  # correlation between intercept and slope. -0.99 bad, because extrpolated 
# intercept to a place x is 0 which is impossible 

################### This plot demonstrates how crazy this would be
par(mfrow=c(2, 1))
plot(SCT ~ tarsus, data=dll.data, xlim=c(0, max(dll.data$tarsus)))
abline(regression.1)

# To make confidence bands, we generally need to generate a set of new values for explanatory variable,
# use these to predict fitted values
new_tarsus <- data.frame(tarsus=seq(0, range(dll.data$tarsus)[2], by=0.005))
predicted.model.1 <- predict(regression.1, new_tarsus, interval = "confidence")
lines(x = new_tarsus[,1], y=predicted.model.1[,1], lwd=4)
lines(x = new_tarsus[,1], y=predicted.model.1[,3], lwd=3, lty=2, col="grey")
lines(x = new_tarsus[,1], y=predicted.model.1[,2], lwd=3, lty=2, col="grey")

# we can also look at the confidence ellipse around the estimated parameters 
confidenceEllipse(regression.1)  # the estimates are highly correlated with one another 



##################### What do we do? ########################
# center the covariates 
par(mfrow=c(2, 1))
dll.data$cent.tarsus <- dll.data$tarsus - mean(dll.data$tarsus)

hist(dll.data$tarsus)
hist(dll.data$cent.tarsus)

# re-run the model with the centered co-variate
regression.2 <- lm(SCT~cent.tarsus, data=dll.data)  # the intercept is implicit

par(mfrow=c(2,1))
plot(SCT~cent.tarsus, data=dll.data)
abline(regression.2)
cov2cor(vcov(regression.2)) 
confidenceEllipse(regression.2)

