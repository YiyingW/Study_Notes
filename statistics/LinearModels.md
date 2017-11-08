## Introduction
* Linear models are the most used statistical methods. T-tests, ANOVA, ANCOVA and regression can all be formulated as special cases of 
linear models. 
* Generalized linear models are generalizations of the linear model and are widely used for modeling and analysis. 
* Statistical models have two components, the systematic or "fixed effects" component that describes the deterministic part of the system
and the random component that describes the random parts of the system including biological and technical variation. 
* Every model includes some assumptions. In linear models we usually assume the noise is Normally distributed. Taking logarithms of 
the data tend to make the noise more symmetric and closer to Normal. In some cases, we may do a sensitivity analysis of the model 
to determine sensitivity to violations of the model assumptions. 

## Linear Models
* LIMMA package
    * Instead of computing a t-statistic for every gene (lipid) using a loop, LIMMA computes the mean difference and the standard error 
    of the mean difference efficiently using matrix operations.   
    * Uses a design matrix that can conduct very flexible statistical analysis. By changing the design matrix, LIMMA can be used for 
    complicated experimental designs like 2-way ANOVA and randomized complete block designs. 
    * The default method in LIMMA uses an empirical Bayes estimate to "moderate" the standard deviation in the t-test denominator using 
    the distribution of all the standard deviations. This can improve the power especially with small samples. (Power is the probability 
    of correctly rejecting the null hypothesis when it is false, more power for the same p-value means improved FDR.) 
    * Moderated t-test 
      * Stein's paradox: when you are estimating 4 or more population means, the best estimator is not the 4 or more sample means, but a 
      weighted average of the sample means and the "mean of the means". One way to find an appropriate weighting is to assume that the 
      population means themselves come from a population (Bayesian idea). This population is the prior, and the best estimator of each 
      population mean is the Bayes predictor, which is a weighted average of the prior mean and the sample mean. 
      * The moderated t-test is a t-test using the square root of the moderated variance as the SD instead of the sample variance. Having 
      a better estimate of the standard deviation turns out to be reflected in having more power for the tests. 
      
