## Function for plotting a chi-squared distribution with various dfs

x <- seq(1:50)
plot(dchisq(x, 1), type = "l", xlab = "Value of chi-squared", ylab = "Probability Density",
     main = "Example of chi-squared distributions")

# adding more density lines for various DFs
lines(dchisq(x, 5), col = "red")
lines(dchisq(x, 10), col = "blue")
lines(dchisq(x, 20), col = "green")
lines(dchisq(x, 40), col = "purple")

# adding a legend
legend(40, 0.2, c("df=1", "df=5", "df=10", "df=20","df=40"),
       text.col = c("black", "red", "blue", "green", "purple"))
