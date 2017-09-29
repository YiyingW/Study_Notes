## ANOVA
* statistical inference method that is used to determine - by simultaneously
considering many groups at once - if the variability in the sample means is so
large that it seems unlikely to be from chance alone. 
* hypothesis
  * H0: mu1 = mu2 = ... = muk
  * HA: at least one mean is different
* conditions:
  1. the obs are independent within and across groups
      * if between groups independence is not met, can use repeated measures ANOVA
  1. the data within each group are enarly normal
  1. the variability across the groups is about equal and use graphical diagnostics to
  check if these conditions are met
      * homoscedastic groups 
* F statistic is calculated as the ratio of the mean sqaure between groups (variability
between groups) and mean square error (variability within errors). 
  * variability partitioning, attributed to what you study (explained) and attributed to everything else (unexplained)
  * large test statistics lead to small p values
  * F = MSG / MSE
* F statistic has a right skewed distribution with two different measures of df, 
df_group = k - 1, k is the number of groups, df_error = n - k, n is the total sample size. 
* calculation of the p value for ANOVA is always one sided. 
  * p value is the probability of at least as large a ratio between the "between"
  and "within" group variabilities if in fact the means of all groups are equal
  * because F is a ratio, it can never be negative. 
  * `pf(21.735, 3, 791, lower.tail = FALSE)`


* corrected significane level, Bonferroni correction, to combat inflating type 1 error 
rate. 
* it is possible to reject the null hypothesis in ANOVA but not find
significant differences between groups when doing pairwise comparisons. 

