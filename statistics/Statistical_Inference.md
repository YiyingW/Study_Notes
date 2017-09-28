## Hypothesis testing for unknown population mean
* p value: the probability of observed or more extreme outcome given that
null hypothesis is true  
* test statistic, z, use z to find p value  
z = (obs - null hypothesis value)/SE   
Many statistical tests can be conveniently performed as approximate 
Z-tests if the sample size is large or the population variance is known. 
If the population variance is unknown (and therefore has to be estimated 
from the sample itself) and the sample size is not large (n < 30), 
the Student's t-test may be more appropriate.

* How to do hypothesis testing for a single mean?
    1. set the hypothesis
    1. calculate the point estimate 
    1. check conditions: independence, sample size / skew
    1. draw sampling distribution, shade p-value, calculate test statistic
    1. make a decision, and interpret it in context of the research question
    
## Inference for other estimators 
* any estimator that has nearly normal sampling distributions
    * sample mean
    * difference between sample means
    * sample proportion 
    * difference b/t sample proportions 
* unbiased estimator 
    * the sampling distribution of the estimate is centered at the true 
    population parameter it estimates 

## Decision errors
* type 1 error is rejecting H0 when H0 is true
    * alpha = 0.05, type 1 error rate 
    * 5% chance of making type 1 error 
* type 2 error is failing to reject H0 when HA is true
    * type 2 error rate is beta, beta is dependent on effect size, 
    effect size is defined as the difference between point estimate and null value
    * power of a test is the probability of correctly rejecting H0, 1-beta
    
## significance v.s. confidence level 
* two sided hypothesis testing with alpha = 0.05 <==> 95% C.I.
* one sided HT with alpha = 0.05 <==> 90% C.I.

## statistical significance v.s. practical significance
* simply by inflating your sample size, you can get statistically significant
result but the effect size might be very small and it is not practically significant
* prior analysis to figure out how many obs to collect. 






    
