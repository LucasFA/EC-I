help(df)

A <- data.frame(
    matrix(
        c(5, 7, 13, 4, 1, 7, 14, 3, 11),
        nrow = 3,
        ncol = 3,
    ),
    row.names = c("Blanco", "Negro", "Rojo")
)
colnames(A) <- c("Toyota", "Audi", "Nissan")

A["Azul", ] <- c(8, 5, 7)

A[, "Hyundai"] <- c(2, 7, 3, 5)

A[c("Rojo", "Negro"), ]

A[, c("Toyota", "Audi")]

A["Azul", c("Nissan", "Hyundai")]

A[, "Kia"] <- c(7, 1, 9, 2)

A["Verde", ] <- c(4, 5, 2, 1, 0)

A[c("Azul", "Verde"), c("Hyundai", "Kia")]

A[, "Kia"] <- NULL

A <- A[row.names(A) != "Verde", ]

# ────────────────────────────────────────────────────────────────────────────────
# Ej 2
nombre <- c("Tor", "Linda", "Ato", "Kira", "Dragón", "Kimba")
edad <- c(0.5, 2, 4, 0.25, 1, 10)
sexo <- c("M", "H", "M", "H", "M", "M")

sexf <- factor(sexo,
    levels = c("M", "H"),
    labels = c("macho", "hembra")
)

perros <- data.frame(nombre, edad, sexf)

# También se puede usar cbind
perros <- data.frame(perros, peso = c(25, 5, 7, 1.5, 6, 39))

# Nota: hace falta usar list, y no c(...) para manejar apropiadamente tipos de datos heterogéneos
perros <- rbind(perros, list("Atila", NA, "macho", 17))

# f
perros <- transform(perros, edad_humana = 7 * edad)

edad_h <- perros$edad_humana

edad_h <- factor(edad_h)

edad_h / 7
# Los factores no se guardan como los valores originales:
as.numeric(edad_h)

perros <- perros[nombre != "Kimba", ]

perros <- perros[complete.cases(perros), ]

perros2 <- perros[c("nombre", "edad", "sexf")]

tapply(perros2$edad, perros2$sexf, mean)
# aggregate(perros2$edad, by = list(perros2$sexf), FUN = mean)


# ──────────────────────────────────────────────────────────────────────────────
# Ej 3

datos <- read.csv("2Sesion_ECI_datos.txt", stringsAsFactors = TRUE)

str(datos)
nrow(datos) # registros
ncol(datos) #variables, con nombres:
names(datos)

head(datos)
tail(datos)

datos[sample(nrow(datos), 6), ]
# datos[sample(rownames(datos), 6), ]

datos[datos$country == "United Kingdom", ]

datos[which(datos$country == "United Kingdom"), ]

datosmios <- datos[which(datos$country %in% c("Spain", "Mali", "Canada")), ]

write.csv(datosmios, file = "datosmios.txt")
# write.csv(datosmios, file = "datosmios.txt", row.names = F)
# Este último no guarda los números de filas, haciéndolo más fácil de leer


