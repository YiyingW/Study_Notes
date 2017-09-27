## R^2
* strength of the fit of a linear model
* square of the correlation coefficient
* tells us what percent of variability in the response variable is explained by the model
* From ANOVA, 1 - SSE/SST, explained variation / total variation 

## Regression with categorical explanatory variables
* code one level to the be the reference level -> 0 (0, 1)
* what if you have four levels?    
  one reference and three other levels. reference not show up in regression model.   
  
 ## Outliers 
 * points that far away from the clound of points
 * leverage points: outliers that fall horizontally away from the center of the cloud but don't influence the slope of the regression line
 * influential points: outliers that influence the slope of the regression line
    * high leverage points
    * visualize the regression line with and without the point and see if the slope of the line change considerably. 
* influential points always reduce R^2? False.

## Inference for linear regression
* hypotheses testing for the slope
    * Is the explanatory variable a significant predictor of the response variable? 
    * use a t-statistic in inference for regression  
    T = (point estimate - null value) / SE     
    T = (b1 - 0) / SEb1, df = n - 2 (lose 1 df for each parameter estimated, we estimate 2 parameters, beta0 and beta1)  
    * use t score and df to determine p value
* confidence interval for the slope
    * point estimate ± margin of error    
    b1 ± tdf * SEb1   
    `qt(0.025, df = 25)` In R, this gives you a critical t score for df of 25   
    * if 95% C.I. is 0.7 ~ 1.1, it means, we are 95% confident that for each additional increase on the X, the Y is expected
    on average to be higher by 0.7 to 1.1 unit.     

## variability partitioning 
* partitioning the variability in y to explained and unexplained variability requires ANOVA  
* R^2 two ways to calculate
    * square of correlation coefficient
    * proportion of explained to total variability 
