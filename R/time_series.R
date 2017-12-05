##################### White Noise #########################

# Simulate n = 50 observations from the white noise model
WN_1 <- arima.sim(model = list(order = c(0, 0, 0)), n = 50)
head(WN_1)
ts.plot(WN_1)

# Simulate from the WN model with mean = 4 and sd = 2
WN_2 <- arima.sim(model = list(order = c(0, 0, 0)),
                  n = 50,
                  mean = 4, 
                  sd = 2)
ts.plot(WN_2)

# Estimating white noise
# Fit the WN model with arima()
arima(WN_2, order = c(0, 0, 0))

##################### Random Walk #########################
# Yt = Yt-1 + error
# error is mean zero white noise
# simulation requires an initial point Y0
# only one parameter, the WN variance 
# Random Walk with Drift
# Today = Constant + Yesterday + Noise
# two parameters, constant c and WN variance 

# random walk model is the cumulative sum (integration) of a mean zero white noise series. 
model1 <- list(order = c(0, 1, 0))
random_walk <- arima.sim(model1, n = 100)
ts.plot(random_walk)
random_walk_diff <- diff(random_walk)
ts.plot(random_walk_diff)
# simulate the random walk model with a drift
rw_drift <- arima.sim(model = list(order = c(0, 1, 0)), n = 100, mean = 1)
ts.plot(rw_drift)
rw_drift_diff <- diff(rw_drift)
ts.plot(rw_drift_diff)

# Estimate the random walk model
rw_diff <- diff(random_walk)
ts.plot(rw_diff)
model_wn <- arima(rw_diff, order = c(0,0,0))
int_wn <- model_wn$coef
ts.plot(random_walk)
abline(0, int_wn)

########################## Stationarity ########################
# weak stationary: mean, variance, covariance constant over time
# Many financial time series do not exhibit stationarity, however, 
# the changes in the series are often approximately stationary 
# a stationary series should show random oscillation around some fixed level, mean-reversion

# there are many commonly encountered departures from stationarity, including time trends, 
# periodicity, and a lack of mean reversion. 


# Simulate and plot AR model with slope 0.9 
x <- arima.sim(model = list(ar = 0.9), n = 200)
ts.plot(x)
acf(x)

# Simulate and plot AR model with slope 0.98
y <- arima.sim(model = list(ar = 0.98), n = 200)
ts.plot(y)
acf(y)

# Simulate and plot RW model
z <- arima.sim(model = list(order = c(0, 1, 0)), n = 200)
ts.plot(z)
acf(z)


########## AR processes, inflation rate ############
data(Mishkin, package = "Ecdat")
inflation <- as.ts(Mishkin[, 1])
ts.plot(inflation)  # usually positive value and it is fairly persistance 
acf(inflation)  # strong, positive but decaying autocorrelation estimates from lag 1 to 24
# AR model: (Today - mean) = slope * (yesterday - mean) + noise
AR_inflation <- arima(inflation, order = c(1, 0, 0))
AR_inflation
# mean = 3.745, slope = 0.596

# AR fitted values, Today_hat = mean_hat + slope_hat * (Yesterday - mean_hat)
# residuals = Today - Today_hat
ts.plot(inflation)
AR_inflation_fitted <- inflation - residuals(AR_inflation)
points(AR_inflation_fitted, type = "l", col = "red", lty = 2)

# Forecasting
# 1-step ahead forcasts
predict(AR_inflation)
# h-step ahead forcasts
predict(AR_inflation, n.ahead = 6)








