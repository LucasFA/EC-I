# Ejercicio 1

genera <- function(a, b) {
    m <- mean(c(a, b))
    out <- c()
    new_val <- runif(1, a, b)
    while (new_val <= m) {
        out <- append(out, new_val)
        new_val <- runif(1, a, b)
    }

    return(list(out, length(out)))
}

# Ejercicio 2

dado <- function(n) {
    resultado <- sample(c(1, 6), n, replace = TRUE)
    resultado_original <- resultado
    index_pares <- resultado %% 2 == 0
    n_pares <- sum(index_pares)

    mayoria_pares <- n_pares > n / 2
    if (mayoria_pares) {
        resultado[index_pares] <- mean(resultado)
    } else {
        porcentaje_impares <- (n - n_pares) / n
        resultado[-index_pares] <- porcentaje_impares
    }

    list(
        n_lanzamientos = n,
        resultado_inicial = resultado_original,
        resultado_procesado = resultado,
        n_cifras_modificadas = if (mayoria_pares) {
            n_pares
        } else {
            n - n_pares
        }
    )
}


# Ejercicio 3

data <- ISwR::juul
str(data)

data <- transform(data,
    sex = factor(sex,
        levels = c(1, 2), labels = c("M", "F")),
    menarche = factor(menarche,
        levels = c(1, 2), labels = c("No", "Si")),
    tanner = factor(tanner,
        levels = c(1:5),
        labels = c("I", "II", "III", "IV", "V")
    )
)

# B
data <- transform(data,
    edad = trunc(age)
)

table(data$edad)
plot(table(data$edad)) # No me lo has pedido pero ya que estamos...

# C

summary(data)
