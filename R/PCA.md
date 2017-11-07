* PCA is a dimensionality reduction technique that is widely in data analysis. 
    * lower dimension can significantly reduce the computational time of some numerical algorithms. 
    * many statistical models suffer from high correlation between covariates and PCA can be used to produce 
    linear combinations of the covariates that are uncorrelated between each other. 
    * PCA projects p-dimensional data into a q-dimensional sub-space (q <= p) in a way that minimizes the residual sum of 
    squares of the projection. It minimizes the sum of squared distances from the points to their projections. This is
    equivalent to maximizing the covariance matrix of the projected data. 
* General Advice:
    * PCA is not scale invariant, it is highly recommended to standardize all the p variables before applying PCA
    * Singular Value Decomposition (SVD) is more numerically stable than eigendecomposition and it usually used in practice
    * How many principal components to retain will depend on the specific application
    * Plotting (1 - R^2) versus the number of components can be used to visualize the number of principal components that retain
    most of the variability contained in the original data
    * two or three principal components can be used for visualization purposes 
* Computing and visualizing PCA in R 
    
