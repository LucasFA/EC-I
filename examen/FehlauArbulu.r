# Ej 1
# q
grupo <- read.csv("grupoA.txt", header = TRUE)
# se puede comprobar que es un dataframe con class(grupo)

# r
grupo <- transform(grupo, mes = sample(month.name, nrow(grupo), replace = TRUE))

# s
grupo[grupo$asignatura == "descriptiva", ]$notas <- 5

# t
grupo_verano <- subset(grupo, mes %in% month.name[7:9])

# u
grupo_verano <- subset(grupo_verano, notas < 5)

# v
C1 <- list(grupo = grupo, grupo_verano = grupo_verano)

# w
length(C1)
# x
sapply(C1, nrow)


#########################
# Ej 2
A <- c(2, 4, 3, 5, 7, 6)
B <- c(6, 4, 2, 3, 5, 3)

F <- c(A, B)

F[length(F)] <- max(A)

F <- F[c(-3, -5)]

F <- F[-length(F)]



####################
# Ej 3

bio <- read.csv("datos_biologia_A.txt", header = TRUE, sep = " ")
alg <- read.csv("datos_algebra_A.txt", header = TRUE, sep = ",")

id_comunes <- intersect(bio$id, alg$id)
df1 <- bio[id_comunes %in% bio$id, c("nombre", "edad")]

# estaría bien comprobar que los datos son consistentes entre los dos dataframes
