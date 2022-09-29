# ────────────────────────────────────────────────────────────────────────────────
# Ej 1
x <- c(1, 2, 3, 4, 5)
y <- 1:5
z <- seq(1, 5)
all(x == y)
all(y == z)

all(c(1, 2, 3, 4, 5) == 1:5 & 1:5 == seq(1, 5))

# ────────────────────────────────────────────────────────────────────────────────
# Ej 2
y <- c(1, 3, 5, 7)
seq(1, 7, 2)

# ────────────────────────────────────────────────────────────────────────────────
# Ej 3

x <- 8:5
y <- rep(c(3, 2), times = c(8, 2))
z <- seq(1, 4, 0.75)

# ────────────────────────────────────────────────────────────────────────────────
# Ej 4
chica <- c("Ana", "Maria", "Natalia", "Almudena")

# ────────────────────────────────────────────────────────────────────────────────
# Ej 5
x <- c(2, -5, 4, 6, -2, 8)
y <- x[x > 0]
z <- x[x < 0]
v <- x[-1]
w <- x[seq_along(x) %% 2 == 1]
# primero entendí esto como los índices pares, en vez de el mismo número, como en el apartado iv
w2 <- x[seq_along(x) %% 2 == 0]
# realmente sería
w2 <- x[x %% 2 == 0 & x > 0]

# ej 6
x <- c(3, log(-15), 5)
is.nan(x)
x <- x[!is.nan(x)]

# ────────────────────────────────────────────────────────────────────────────────
# Ej 7
x <- 1:6
y <- 7:8
z <- 9:12
x + x
x + y # ha tomado como y, rep(y, length.out = max(length(x), length(y))). Es decir, repetido y hasta que acabes con x
# rep(y, length.out = max(length(x), length(y)))
x + z
# Lo calcula de la misma forma, pero avisa de que ahora ni siquiera "encajan bien"

# ────────────────────────────────────────────────────────────────────────────────
# Ej 8
x <- 1:6
matrix(x, nrow = 2, ncol = 3)
matrix(x, nrow = 3, ncol = 2)
matrix(x, nrow = 2, ncol = 3, byrow = TRUE)
matrix(x, nrow = 3, ncol = 3)

# ────────────────────────────────────────────────────────────────────────────────
# Ej 9

# Elige el número de columnas de forma que se utilice todo el argumento data, aquí 1:6.
matrix(1:6, nrow = 2)
matrix(1:6, nrow = 4)
matrix(1:6, nrow = 4, ncol = 4)

# ────────────────────────────────────────────────────────────────────────────────
# Ej 10
A <- matrix(c(2, 1, 3, 4), nrow = 2)
B <- matrix(c(3, 8), nrow = 2)

A * B # Producto elemento a elemento, que aquí no funciona por no tener el mismo tamaño
A %*% B # es la multiplicación de matrices normal
outer(A, B) # multiplica de todas las formas posibles.
# Es más claro por ejemplo con
outer(c(2, 3), c(5, 7))

# ────────────────────────────────────────────────────────────────────────────────
# Ej 11

A <- matrix(1:36, nrow = 2, ncol = 3)
B <- matrix(1:36, nrow = 3, ncol = 4)
C <- matrix(1:36, nrow = 2, ncol = 3)

A * B # no tienen los mismos tamaños
outer(A, B) # sin problema
A + 2 # sin problema

A %*% B # encajan

exp(B) # elemento a elemento

A * C # elemento a elemento

A %*% C # no encaja el producto de matrices (3 A ncol!= 2 C ncol)

# ────────────────────────────────────────────────────────────────────────────────
# Ej 12
matrix(0, nrow = 3, ncol = 2)


# ────────────────────────────────────────────────────────────────────────────────
# Ej 13

A <- matrix(1:3, nrow = 3, ncol = 10)
A
# también:
# matrix(rep(1:3, each = 10), nrow = 3, ncol = 10, byrow = TRUE)

rbind(rep(1, 10), rep(2, 10), rep(3, 10))
matrix(cbind(rep(1:3, 10)), nrow = 3)

B <- matrix(1:3, nrow = 3, ncol = 10, byrow = T)
B
A %*% B # no tienen tamaños apropiados.
# Asumiendo que quizás quieras decir elemento a elemento
A * B


# ────────────────────────────────────────────────────────────────────────────────
# Ej 14
A <- matrix(c(5, 7, 13, 4, 1, 7, 14, 3, 11),
    nrow = 3,
    ncol = 3,
    dimnames = list(
        c("Blanco", "Negro", "Rojo"),
        c("Toyota", "Audi", "Nissan")
    )
)

A <- rbind(A, c(8, 5, 7))
rownames(A)[4] <- "Azul"

A <- cbind(A, c(2, 7, 3, 5))
colnames(A)[4] <- "Hyundai"

A[c("Negro", "Rojo"), ]
A[, c("Toyota", "Hyundai")]

A[c("Azul"), c("Nissan", "Hyundai")]

A <- cbind(A, c(7, 1, 9, 12))
colnames(A)[5] <- "Kia"

A <- rbind(A, c(4, 5, 2, 1, 0))
rownames(A)[5] <- "Verde"

A[c("Azul", "Verde"), c("Hyundai", "Kia")]

A <- A[, colnames(A) != "Kia"]
A <- A[rownames(A) != "Verde", ]
A
