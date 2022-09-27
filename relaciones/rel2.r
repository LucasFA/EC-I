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