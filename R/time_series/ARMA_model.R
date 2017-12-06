######## Fitting an AR(1) Model ##########
# use astsa package to fit models to data
# Generate 100 observations from the AR(1) model
# Xt = 0.9Xt-1 + Wt
x <- arima.sim(model = list(order = c(1, 0, 0), ar = .9), n = 100) 

# Plot the generated data 
plot(x)

# Plot the sample P/ACF pair
acf2(x)  # this is from astsa package

# Fit an AR(1) to the data and examine the t-table
sarima(x, p = 1, d = 0, q = 0)

############ Fitting an AR(2) Model #######
# Xt = 1.5Xt-1 - 0.75Xt-2 + Wt
# astsa is preloaded
x <- arima.sim(model = list(order = c(2, 0, 0), ar = c(1.5, -0.75)), n = 200)
# Plot x
plot(x)

# Plot the sample P/ACF of x
acf2(x)

# Fit an AR(2) to the data and examine the t-table
sarima(x, 2, 0, 0)

############ Fitting an MA(1) Model ############
# astsa is preloaded
# Xt = Wt - 0.8Wt-1
x <- arima.sim(model = list(order=c(0,0,1), ma =- 0.8), n = 100)
# Plot x
plot(x)

# Plot the sample P/ACF of x
acf2(x)

# Fit an MA(1) to the data and examine the t-table
sarima(x, 0, 0, 1)


############## Fitting an ARMA Model ###########
# astsa is preloaded
# ARMA(2, 1): Xt = Xt-1 - 0.9Xt-2 + Wt + 0.8Wt-1
x <- arima.sim(model = list(order = c(2, 0, 1), ar = c(1, -0.9), ma = 0.8), n = 250)
# Plot x
plot(x)

# Plot the sample P/ACF of x
acf2(x)

# Fit an ARMA(2,1) to the data and examine the t-table
sarima(x, 2, 0, 1)


