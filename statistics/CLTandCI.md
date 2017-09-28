[play around here for understanding sampling](https://gallery.shinyapps.io/CLT_mean/)
## Sampling variability and CLT
* sample statistics v.s. sampling statistics v.s. polupation statistics 
* standard deviation of the samples means is called standard error  
* Central Limit Theorem: the distribution of sample statistics is nearly normal, centered at the 
population mean, and with a standard deviation equal to the population standard
deviation divided by square root of the sample size. if population SD is unknown, 
use sample SD. tells us about shape, center and spread.   
* CLT is about the distribution of point estimates.    
* condidions for the CLT
    * independence: sample obs must be independent 
        * random sample / assignment
        * if sampling without replacement, n < 10 % of population.    
        It's difficult to get independent sampled individuals   
    * sample size/skew: either the population distribution is normal, or if the population distribution is 
    skewed, the sample size is large (rule of thumb: n > 30).  
    
## Confidence Interval
* CI: the plausible range of values for a population parameter
    * it is not about individuals in the population but about true population parameter
* Confidence level: the percentage of random samples which yield confidence intervals that
capture the true population parameter
* the nearly normal distribution of the point estimate implies that a CI
can be calculated as point estimate ± z* X SE. 
    * z* is the cutoff points in the standard normal distribution to 
    capture the middle XX% of the data, where XX% is the desired confidence level.  
    `qnorm(0.025)` gives us -1.96 but z* is always positive
    * conditions are the same as for CLT
* margin of error: the distance required to travel in either direction away (2SE for 95% CI) 
from the point estimate when constructing a confidence interval.   
* Interpretation: We are xx% confident that the true population parameter is in 
this interval.  
* accuracy v.s. precision 
    * increase accuracy, increase CL, increase width, decrease precision
    * way to go is to increase sample size

    


