## Lipidomics Data Analysis
* On a whole lipidome-wide scale, the goal of the differential expression analysis is to generate a list of all lipids 
that are differentially expressed. 
* For continuous concentration measurements, the group concentration level can be summarised by the mean expression level of the 
replicates. The problem is fundamentally comparison of the means. 
  * With two comparison groups, differential expression problem can be solved by conducting a t-test. 
  * With more than two comparison groups, one can conduct ANOVA.
* Thousands of hypotheses are tested simultaneously, casuing a problem of multiple comparisons. To avoid numerous false positive 
discoveries, some sort of multiple comparison correction, such as Bonferroni, FDR. 

## LIMMA package
* [LIMMA package](http://bioconductor.org/packages/release/bioc/html/limma.html) is designed to fit linear models for microarray data analysis, which is similar to lipidomic data, genes v.s. lipids species. 
* Why use limma? 
    * Instead of computing a t-statistic for every gene (lipid) using a loop, LIMMA computes the mean difference and the standard error 
    of the mean difference efficiently using matrix operations.   
    * Uses a design matrix that can conduct very flexible statistical analysis. By changing the design matrix, LIMMA can be used for 
    complicated experimental designs like 2-way ANOVA and randomized complete block designs. 
    * The default method in LIMMA uses an empirical Bayes estimate to "moderate" the standard deviation in the t-test denominator using 
    the distribution of all the standard deviations. This can improve the power especially with small samples. (Power is the probability 
    of correctly rejecting the null hypothesis when it is false, more power for the same p-value means improved FDR.) 
    * Moderated t-test 
      * Stein's paradox: when you are estimating 4 or more population means, the best estimator is not the 4 or more sample means, but a         weighted average of the sample means and the "mean of the means". One way to find an appropriate weighting is to assume that the 
      population means themselves come from a population (Bayesian idea). This population is the prior, and the best estimator of each 
      population mean is the Bayes predictor, which is a weighted average of the prior mean and the sample mean. 
      * The moderated t-test is a t-test using the square root of the moderated variance as the SD instead of the sample variance. Having 
      a better estimate of the standard deviation turns out to be reflected in having more power for the tests.

