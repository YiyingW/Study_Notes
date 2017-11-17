a <- c(2, 6, 4, 5)
a_3 <- c(a, a, a)
a_3_2 <- rep(a, 3)
b <- c(2, 2, 2, 1)
a > b  # element by element comparison

# check if two vectors are the same
identical(a, b)
b2 <- b
identical(b2, b)

# some functions
mean(a)
sum(a)
sd(a)
var(a)
cor(a, b)

d <- cbind(a, b)
is.matrix(d)

mode(a)   # numeric, basic atomic structure
class(d) # matrix
class(a) # numeric
mode(d)  # numeric

cities <- c("Columbia", "San Jose", "Tangshan", "Dalian")
class(cities)
mode(cities)
length(cities)
nchar(cities)

rivers <- c("abc", "ert", "cvb", "ert")
cities_rivers <- cbind(cities, rivers)
mode(cities_rivers)
class(cities_rivers)

q <- "Mountian View"
length(q)

# another type of object is called formula
model.1 <- y ~ x1 + x2 + x1:x2  # x1:x2 interaction
class(model.1)
terms(model.1)


# list objects in the active working space
ls()
# remove
rm(a_3_2)
rm(a_3, q)
rm(list=ls())  # remove all

# saving the workspace
save.image("file_name")
load("file_name.RData")  # load it again


# write functions
# standard error of the mean which is sd/sqrt(sample size)
a <- c(1,2,3,5,7,3,2,5,2)
sd_a <- sd(a)
sample_a <- length(a)
sd_a / sqrt(sample_a)
StdErr <- function(vector) {
  sd(vector) / sqrt(length(vector))
}

# U can put a lot of functions and use source() to load them

# create regular sequences
one_to_20 <- 1:20
twenty_to_1 <- 20:1
seq1 <- seq(from=1, to=20, by=0.5)
seq1 <- seq(1, 20, 0.5)
# repeat a number
many_2 <- rep(2, times=20)
many_a <- rep("a", times=10)
seq_rep <- rep(20:1, 2)
seq_rep <- rep(one_to_20, 3)
# create factor levels
gl(2, 8, labels = c("Control", "Treat"))
lakes_rivers <- rep(c("lake", "river"), each=5)  # this is not factor
lakes_rivers <- rep(c("lake", "river"), 5)
# create a matrix
matrix(rep(20:1, 4), 20, 4)  # vertically fill first. From top to bottom

# Indexing in R
a <- 1:20
b <- 5*a
a[5]
b[c(5, 7)]
a[5] <- 100  # you can modify in place
a[1:10]
a[-20]  # remove the 20th element
b[b>50]

# indexing for matrices
c <- a+b
q_matrix <- cbind(a, b, c)
nrow(q_matrix)
ncol(q_matrix)
dim(q_matrix)
length(q_matrix)  # number of total elements, nrow * ncol
q_matrix[, "c"]








