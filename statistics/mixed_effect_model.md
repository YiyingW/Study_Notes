## Mixed-effects Models
* Mixed-effects models, describe a relationship between a response variable and some of the covariates that have been measured or 
observed along with the response. 
* In mixed-effects models at least one of the covariates is a categorical covariate representing experimental or observational 
units in the data set. 
* with in each group (COPD or Healthy), there are individual differences, we can model these differences by assuming different random 
intercepts for each subject. Each subject is assigned a different intercept value, and the mixed model estimates these intercepts for you. 
* In the mixed model, we add one or more random effects to fixed effects. These random effects essentially give structure to the error 
term. e.g. add a random effect for subject and this characterizes idiosyncratic variation that is due to individual differences. 
* pitch ~ politeness + sex + (1 | subject) + error
    * assume an intercept that's different for each subject
    * 1 stands for the intercept here 
    * the model should expect that there's going to be multiple responses per subject, and these responses will depend on each subject's 
    baseline level. 
 
