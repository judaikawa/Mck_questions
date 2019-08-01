
temperature <- c(34.38,34.36,34.74,35.26,35.23,35.29,35.64,36.02,36.1,36.98,37.01,36.75,
                 36.01,35.66,34.72,33.9,32.62,31.51,30.73,29.5,26.94,25.47,23.84,22.55)

startDate <- "2013-01-01"
endDate <- "2013-01-01"
n <- 24
day_pred <- 1

# Number of days between startDate and endDate
delta_day <- as.numeric(as.Date(as.character(endDate), format="%Y-%m-%d")-
             as.Date(as.character(startDate), format="%Y-%m-%d"))

# Final day to predict
final_day <- as.Date(endDate) + day_pred

# Adding hours
startDate <- paste0(startDate, " 00:00")
endDate <- paste0(endDate, " ", (n/24)*(24-1), ":00")


fit <- arima(x=temperature, order=c(0,0,0))
forecasts <- predict(fit, n.ahead=day_pred*23)

acf(temperature)
pacf(temperature)