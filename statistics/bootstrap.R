##################### Performing the Nonparametric bootstrap ##################
# Read data into R
dll.data <- read.csv("http://datadryad.org/bitstream/handle/10255/dryad.8377/dll.csv", header=TRUE)
dll.data <- na.omit(dll.data)
dll.data$temp <- factor(dll.data$temp)
dll.data$replicate <- factor(dll.data$replicate)

### the basic nonparametric bootstrap to generate CIs for the mean
BootstrapMean <- function(X = dll.data$SCT){
  x.boot <- sample(X, size = length(X), replace = T)
  mean(x.boot)
}
N <- 1000
boot.replicate <- replicate(N, BootstrapMean())

hist(boot.replicate)
abline(v = mean(dll.data$SCT), lwd=2, col="red")

# SE of estimate (parametric)
with(dll.data, sd(SCT)/sqrt(length(SCT)))

# SE of mean based on bootstrapping
sd(boot.replicate)

# parametric confidence intervals based on assumptions of normality
CI_L <- with(dll.data, mean(SCT) - 1.96 * (sd(SCT)/sqrt(length(SCT))))
CI_H <- with(dll.data, mean(SCT) + 1.96 * (sd(SCT)/sqrt(length(SCT))))
CI_L
CI_H
# bootstrapped percentile confidence intervals
quantile(boot.replicate, probs=c(0.025, 0.975))

# the percentile confidence intervals are generally biased. BCAs is preferred 
# Bias Corrected and Accelerated intervals 
library(boot)
# first write a function that generates a vector of means of SCT for bootstrapping
f1 <- function(y=dll.data$SCT, id) {mean(y[id])}
boot.out <- boot(dll.data$SCT, f1, 3000)
boot.out
boot.ci(boot.out, conf = 0.95, type = c("basic", "bca", "perc"))

################ basic bootstrapping approach for a statistical test ############
names(dll.data)
levels(dll.data$genotype)
dll.SCT <- dll.data[dll.data$genotype == "Dll", "SCT"]
dll.SCT <- na.omit(dll.SCT)
l1 <- length(dll.SCT)

wt.SCT <- dll.data[dll.data$genotype == "wt", "SCT"]
wt.SCT <- na.omit(wt.SCT)
l2 <- length(wt.SCT)

diff.SCT <- mean(dll.SCT) - mean(wt.SCT)  # mean differences

###### bootstrap resampling for the means to compare difference
par(mfrow=c(1,1))
N <- 1000
stat = numeric(N)
for (i in 1:N) {
  SCT_Boot.dll <- BootstrapMean(X = dll.SCT)
  SCT_Boot.wt <- BootstrapMean(X = wt.SCT)
  stat[i] <- SCT_Boot.dll - SCT_Boot.wt
}
hist(stat)
# the psudo p value
length(stat[stat <= 0]) / N
mean(stat)







