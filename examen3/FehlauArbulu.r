# Ejercicio 1
# Apartado a
colores_por_mes <- topo.colors(12)
plot(
    y = airquality$Ozone,
    x = airquality$Solar.R,
    main = "Gráfica de dispersión",
    sub = "Calidad del aire",
    xlab = "Nivel de radiación solar",
    ylab = "Nivel de ozono en el aire",
    xlim = c(0, 400),
    ylim = c(0, 175),
    col = colores_por_mes
)

legend(
    x = 0,
    y = 170,
    legend = month.name,
    fill = colores_por_mes
)

# Apartado b
cols_box <- topo.colors(5)
boxplot(
    airquality$Temp ~ airquality$Month,
    horizontal = TRUE,
    col = cols_box,
    main = "Distribución de la temperatura\nen función el mes",
)
legend(
    x = 90,
    legend = month.name[5:9],
    fill = cols_box
)

# Apartado c
f <- function(x) {
    sin(x^2) - cos(x) + 1
}

curve(f, 0, pi)


# Ejercicio 2
# Apartado a
posibles_meses <- as.integer(levels(factor(airquality$Month)))
indices <- sample(x = posibles_meses, size = 2)

temperatura <- airquality$Temp
ozono <- airquality$Ozone

reg <- lm(ozono ~ temperatura)


muestras <- runif(2, 65, 78)
# predict.lm(reg, newdata = muestras)

reg$residuals

# Apartado b
ajuste <- function(modelo) {
    # 

    # 

    # 
}