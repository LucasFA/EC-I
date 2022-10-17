set.seed(42)
alg <- read.csv("datos_algebra_A.txt", header = TRUE, sep = ",", fileEncoding = "UTF-8")

sample_size <- 15
muestra <- alg[sample(seq_along(alg$id), sample_size), ]

str(muestra)

mean(muestra$notas)
var(muestra$notas)

f1 <- function(sample_size = 15) {
    alg <- read.csv("datos_algebra_A.txt", header = TRUE, sep = ",", fileEncoding = "UTF-8")
    muestra <- alg[sample(seq_along(alg$id), sample_size), ]

    write.csv(muestra, file = "escrito.txt", row.names = F, fileEncoding = "UTF-8")
    list(mean = mean(muestra$notas), varianza = var(muestra$notas))
}
f1()
