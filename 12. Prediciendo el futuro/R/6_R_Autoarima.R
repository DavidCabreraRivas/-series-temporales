library(forecast)

# Dataset de linces 
# N?mero de linces atrapados por a?o en el per?odo 1821-1934 en Canad?
length(lynx)

plot(lynx)

# Parece estacionario pero probablemente haya autocorrelaci?n 
# Si se capturan muchos linces un a?o, se espera que al ?o sgte hayan menos porque hay menos para reproducirse.
# Vemos un pulso c?clico que son los puntos m?ximos, no hay estacionalidad pero hay un patr?n

# Es estacionaria
adf.test(lynx)



tsdisplay(lynx) # autoregresion?

#Por lo menos un AR(2)

auto.arima(lynx) # version basica

auto.arima(lynx, trace = T)

# Mejor modelo
myarima=auto.arima(lynx, trace = T, 
           stepwise = F, 
           approximation = F)
### ARIMA Forecast

# Forecast de 10 a?os
arimafore <- forecast(myarima, h = 10)

plot(arimafore)

# Valores estimados del futuro
arimafore$mean

# Ultimas observaciones y forecast
plot(arimafore, xlim = c(1930, 1944))



