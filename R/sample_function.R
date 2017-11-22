# sample() function

# sample(x=your.vector, size=length(your.vector), replace=F)
y <- 1:10

sample(x=y, size = length(y), replace=F)  # permutation tests 
# same as
sample(x=y, replace=F)
# mean and sd will be the same



# sampling with replacement (nonparametric bootstrap)
sample(x=y, replace=T)
# now the mean and sd may be different 

# we can also use this to roll dice
y2 <- 1:6  # six sided die
sample(x=y2, size=1, replace=T)  # single roll of the die
sample(x=y2, size=10, replace=T)  # ten independent rolls of the 6 sized die

# sametimes we want to sample rows or columns of a matrix, not the individual elements of a vector 
# use the index
y3 <- 11:20
Y <- cbind(y, y3)
# we want to sample rows of this matrix with replacement
Y[sample(nrow(Y), replace=T),]
