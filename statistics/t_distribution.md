## t-distribution
* used for inference when sigma is unknown 
    * a single mean
    * difference of paired (dependent) means
        * obs are paired if each obs in one dataset has a special correspondence or
        connection with exactly one obs in the other dataset
    * difference of independent means
* t-distribution has a single parameter, df, as df increases, t-distribution
approaches the normal distribution
* if sample size is small, the estimate of the standard error is not reliable. use 
t-distribution to address the uncertainty of the SE estimate
* t-dis has thicker tails, the CI constructed by t-dis is wider, more conservative, less likely
to reject H0
* William Gosset

## Inference for a mean
* df for t statistic for inference on one sample mean, df = n - 1
* two methods
    * find critial t score using R `qt(0.025, df = 21)` for two tail 95% for CI
    * `2*pt(2.3, df=21, lower.tail = FALSE)` to find p value for HT
    
## Inference for comparing two independent means
* estimating the difference between independent means 
    * point estimate ± margin of error 
        * (x1_bar - x2_bar) ± tdf*SE_x1-x2
        * Standard error of difference between two independent means: 
        SE_x1-x2 = sqrt(s1^2/n1 + s2^2/n2)
        * df = min(n1, n2) - 1, a conservative estimate 
    * conditions
      * independence 
        * within groups
        * between groups 
      * sample size / skew, the more skew in the population distribution, the higher
      the sample size needed
      
## Inference for comparing two paired means

## power













