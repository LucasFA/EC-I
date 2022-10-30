# 1
leibniz <- function(n) {
    n <- trunc(n)
    term <- function(n) {
        (-1)**n / (2 * n + 1)
    }
    valores <- term(seq(from = 0, to = n))

    sum(valores) * 4
}

# 2

# 3

# 4
set.seed(42)
# aviso, tarda bastante. Si no, mejor la otra línea
medias <- replicate(10**6, mean(runif(100)))
medias <- replicate(10**5, mean(runif(100)))
summary(medias)


# 5
juego_dados <- function(nreplicas) {
    tirar_dados <- function(n) {
        sample(1:6, n, replace = TRUE)
    }
    dado <- matrix(
        data = replicate(nreplicas, tirar_dados(3)),
        byrow = TRUE, ncol = 3
    )
    suma_dado <- rowSums(dado)
    aux <- 1:6
    frec_abs <- sapply(aux, function(valor_dado) sum(dado == valor_dado))
    frec_rel <- frec_abs / (nreplicas * 3)

    list(
        resultado_dado = dado,
        suma = suma_dado,
        frecuencia_absoluta = frec_abs,
        frecuencia_relativa = frec_rel
    )
}

juego_normal <- function(nreplicas) {
    muestra <- rnorm(nreplicas, 4, 3.2)
    muestra <- sort(muestra)
    list(
        cuartiles = quantile(muestra),
        media = mean(muestra),
        desv_típica = sd(muestra) # cuasidesviación típica
    )
}