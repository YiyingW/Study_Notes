## what is bootstrapping
* "pulling oneself up by one's bootstraps" accomplishing an impossible task without any outside help
* the task is estimating a population parameter, using data from only the given sample
* bootstrap scheme
    * take a bootstrap sample - a random sample taken with replacement from the original 
    sample, of the same size as the original sample. 
    * calculate the bootstrap statistic - a statistic such as mean, median, proportion, 
    etc. computed on the bootstrap samples. 
    * repeat above many times to create a bootstrap distribution - a distribution of bootstrap statistics 
* can caldulate confidence interval in two ways
    * percentile method, middle 95% of the statistics 
    * standard error method
        * sample statistic, point estimate +/- t* times SE_boot
        * df = n - 1

## bootstrapping limitations 
* not as rigid conditions as CLT based methods
* if the bootstrap distribution is extremely skewed or sparse, the bootstrap interval might 
be unreliable 
* a representative sample is still required -- if the sample is biased, the estimates 
resulting from this sample will also be biased 

## bootstrap v.s. sampling distribution 
* sampling distribution created using sampling (with replacement) from the population
* bootstrap distribution created using sampling (with replacement) from the sample
* both are distributions of sample statistics 


