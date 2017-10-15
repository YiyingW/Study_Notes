## DE analysis of RNA-seq data
* discover quantitative changes in expresssion levels between experimental groups (or, condition groups)
* in RNA-seq data, genes with larger average expression have on average larger observed variances across samples, heteroscedasticity. 
logarithmic transformation counteracts this and might overdo the adjustment somewhat. 
* The low levels of replication rule out, for all practical purposes, distribution-free rank or permutation-based methods. Poisson model 
doesn't work because it is a single parameter model whith mean = variance. 
* The negative binomial model, where the variability between replicates is modeled by the dispersion parameter. 
* edgeR and DESeq2
