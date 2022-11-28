# 1
gráfica <- hist(quakes$depth, plot = FALSE)
plot(gráfica,
    col = "skyblue",
    main = "Histograma de terremotos",
    xlab = "Profundidad del terremoto",
    ylab = "Frecuencia absoluta"
)
# 2
media_color <- "darkgreen"
abline(
    v = mean(quakes$depth),
    col = media_color, lwd = 3
)

mediana_color <- "limegreen"
abline(
    v = median(quakes$depth),
    col = mediana_color, lwd = 3
)

# text(x = 350, y = 100, "Desviación típica:")

# 3
legend("topright", col = c(media_color, mediana_color), legend = c("Media", "Mediana"), lwd = 3)


# Ej 2
x <- rnorm(500)
hist(x, prob = T)
densidad <- density(x)
lines(densidad)

plot(densidad)
polygon(densidad)
