* forecasting at scale
    * forecasting daily data into the distant future
    * the scale means having many time series to forecast, not from any particular time series being extraordinarily long. 
    * Facebook system does this using regularized regression
    * Google system works by averaging a large ensemble of forecasts. 
    * focus on daily data, and careful about holidays. 
* Structural time series models 
    * a structural time series model is defined by two equations: observation equation and transition equation. 
    * structural time series models are useful because they are flexible and modular
