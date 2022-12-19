# Ej 1

data <- Lock5withR::HappyPlanetIndex

# 1
plot(
    x = data$LifeExpectancy, y = data$Happiness,
    main = "Felicidad dada esperanza de vida",
    xlab = "Esperanza de vida",
    ylab = "Índice de felicidad"
)

# 2
hist(data$Happiness,
    main = "Felicidad",
    xlab = "Índice de felicidad",
    ylab = "Frecuencia absoluta",
    xlim = c(0, 10),
    breaks = seq(from = 0, to = 10, by = 0.2),
    col = "lightblue"
)

# 3
barplot(table(data$Region))

# 4
recode <- car::recode

happy_f <- recode(data$Happiness,
    recodes = "2.4:3.5 = 1;
    3.51:6 = 2;
    6.1:9 = 3",
    levels = c("Normal", "Alto", "Muy alto"),
    as.factor = TRUE
)
# Ej 2
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


# Ej 3
x <- rnorm(500)
hist(x, prob = T)
densidad <- density(x)
lines(densidad)

plot(densidad)
polygon(densidad)
