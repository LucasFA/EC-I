elegidos <- function(n) {
    tabla <- read.csv("curso.txt")
    muestra <- tabla[sample(seq_along(tabla), n, replace = TRUE), ] # Muestra aleatoria simple => con reemplazamiento

    choice <- sample(1:6, 1)

    f1 <- function(muestra) {
        # i
        mejor_nota <- muestra[which.max(muestra$calificacion), ]
        return(list(
            opcion = 1,
            id = mejor_nota$id,
            sexo = mejor_nota$sexo,
            provincia_de_procedencia = mejor_nota$provincia
        ))
    }

    f5 <- function(muestra) {
        nota_cualitativa <- function(calif_numerica) {
            ifelse(calif_numerica < 5,
                "Suspenso",
                ifelse(calif_numerica < 7,
                    "Aprobado",
                    ifelse(calif_numerica < 9,
                        "Notable",
                        "Sobresaliente"
                    )
                )
            )
        }
        return(transform(muestra, notas = nota_cualitativa(calificacion)))
    }

    switch(choice,
        # i
        return(f1(muestra)),
        # ii
        return(curso2 <- subset(muestra, horas_estudio > 225)),
        # iii
        return(curso3 <- subset(muestra, 150 <= horas_estudio & horas_estudio <= 200 & calificacion >= 5)),

        # iv
        return(muestra[muestra$calificacion < 5, "calificacion"] <- 3.9999),

        # v
        return(f5(muestra))
    )
}


# Ejercicio 2
oposicion <- function(n1, n2, n3) {
    bolas_escogidas <- sample(n1 + n2 + n3, 2, replace = FALSE)

    bloque_del_tema <- function(bola) {
        if (bola <= n1) {
            1
        } else if (bola <= n1 + n2) {
            2
        } else {
            3
        }
    }

    bloques <- sapply(bolas_escogidas, bloque_del_tema)
    horas <- if (bloques[[1]] == bloques[[2]]) {
        2
    } else {
        3
    }

    return(list(
        bloques = bloques,
        tiempo = horas
    ))
}
