# Una comunidad de vecinos está integrada por tres bloques. El número de inquilinos en cada
# uno de ellos es
# ▪ Bloque 1: 35 vecinos
# ▪ Bloque 2: 35 vecinos
# ▪ Bloque 3: 30 vecinos
# De entre todos los vecinos se selecciona una muestra aleatoria de n individuos para tratar un
# tema de interés
# Se sabe que:
# ▪ Si hay un máximo de individuos del bloque 1, se aceptará la cuestión planteada.
# ▪ Si hay un máximo de individuos del bloque 2, se rechazará.
# ▪ Si el máximo de vecinos son del bloque 3, se anulará la reunión teniendo que convocarse
# otra.
# 1. Crea una función, vecinos, que permita seleccionar los individuos de los bloques y que de
# el resultado de la votación: a favor o en contra, así como el número de veces que se ha
# realizado la votación
# 2. Generaliza la función para que se pueda modificar el número de vecinos de cada bloque.


# Pregunta: muestra aleatoria. Supongamos que no es simple == con reemplazamiento, sino que es sin reemplazamiento.

f <- function(n, n1 = 35, n2 = 35, n3 = 30) {
    contador_veces <- 0
    cont <- c()
    ret <- NULL
    while(is.null(ret)) {
        contador_veces <- contador_veces + 1
        sample <- sample(n1 + n2 + n3, n)
        cont[1] <- sum(sample <= n1)
        cont[2] <- sum(n1 < sample & sample <= n1 + n2)
        cont[3] <- sum(n1 + n2 < sample) # = sum-c1-c2

        ret <- switch(which.max(cont),
            1 = "Aceptado"
            2 = "Rechazado"
        )
    }

    ret
}



# Un individuo participa en un juego. Debe sacar bolas de una urna y ganará o perderá dinero en función
# del color de las bolas que saque.

# Para ello dispone de una urna en la que hay:
# ▪ 300 bolas rojas
# ▪ 100 bolas blancas
# ▪ 200 bolas negras

# El jugador saca 30 bolas con reemplazamiento de la urna a partir de donde:
# ▪ Si se obtiene un máximo de bolas rojas, el jugador gana 20€
# ▪ Si se obtiene un máximo de bolas blancas, el jugador gana 50€
# ▪ Si se obtiene un máximo de bolas negras, el jugador pierde todo lo ganado hasta el momento.

# 1. Crea una función, juego, dependiente del parámetro que determine el número de partidas, npartidas,
# que determine la ganancia del jugador. La función dará como resultado el número de partidas
# realizado y la ganancia obtenida
# 2. Generaliza la función para que el jugador decida la composición de la urna

function(npartidas, urnas = c(300, 100, 200)) {
    if(!is.vector(urnas) || !is.numeric(urnas) || length(urnas) != 3) {
        stop("urnas debe ser un vector numérico de longitud 3")
    }
    probs <- urnas / sum(urnas)

    ganancias <- 0
    
    for( _ in seq_len(npartidas)) {
        s <- sample(1:3, 30, replace = TRUE, prob = probs) # realmente, podríamos pasar urnas directamente. De acuerdo con la documentación, no hace falta que la suma sea 1
        ganancias <- switch(which.max(s),
            ganancias + 20, # rojas
            ganancias + 50, # blancas
            0,              # negras
        )
    }
    list(
        npartidas = npartidas,
        ganancias = ganancias
    )
}