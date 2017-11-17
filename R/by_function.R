# by function, by(). It is a wrapper for tapply
# for instance, if you are trying to run the same model over and over again, but with different subsets of data
# (like in microarray analysis, by gene.)
data <- na.omit(data)
model.extract <- by(data, INDICES = data$Key, function (x) lm(Value ~ cond_1, data = x))
# grab the slopes and p values
result <- t(data.frame(sapply(model.extract, function(f) summary(f)$coefficients[2,c(1,4)])))

# how to handle potential errors? how to use try function here?
