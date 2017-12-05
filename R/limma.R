# create design and contrst matrix by hand
# 6 samples, 3 were treated with drug, 3 were control. 

# design matrix
design.mat <- cbind(c(1,1,1,0,0,0), c(0,0,0,1,1,1))
colnames(design.mat) <- c("Case", "Control")
design.mat
# contrast matrix
contrast.mat <- matrix(c(1,-1), ncol = 1)
dimnames(contrast.mat) <- list(c("Case", "Control"), "Diff")
contrast.mat


# use limma
# design matrix
sample <- factor(rep(c("COPD", "smoker", "non_smoker"), each = 3))  # store sample information into a variable. the order is not significant
design.mat <- model.matrix(~0+sample)  # 0 because we do not need an intercept for this linear model
colnames(design.mat) <- levels(sample)
design.mat

# contrast matrix
contrast.mat <- makeContrasts(
  COPD - smoker, COPD - non_smoker,
  levels = design.mat
)

# fit limma
fit <- lmFit(data, design.mat)  # fit linear model to estimate average value for each species for each group
fit2 <- contrasts.fit(fit, contrast.mat)  # fit linear model to estimate a set of contrast. 
fit3 <- eBayes(fit2) 
# Given a linear model fit, compute moderated t-statistics, moderated F-statistics, and log-odds of differential expression by empirical Bayes moderation
# of the standard errors towards a common value. 
deg <- topTable(fit3, coef = "Contrasts",
                p.value = 0.05, adjust.method = 'fdr',
                lfc = log2(1.5),
                number = nrow(dat1)
)
