############### Fit a Mixed Seasonal Model ######################
# full seasonal model is denoted by SARIMA(p, d, q)x(P, D, Q)s where capital letters denote the seasonal orders
# You will now start to fit a seasonal ARIMA model to the monthly US unemployment data, unemp, from the astsa package.
# Plot unemp 
plot(unemp)

# Difference your data and plot it
d_unemp <- diff(unemp)
plot(d_unemp)

# Seasonally difference d_unemp and plot it
dd_unemp <- diff(d_unemp, lag = 12)  
plot(dd_unemp)  # the data appears to be stationary
# Plot P/ACF pair of fully differenced data to lag 60
acf2(dd_unemp, max.lag = 60)

# Fit an appropriate model
sarima(unemp, 2, 1, 0, 0, 1, 1, S = 12)


