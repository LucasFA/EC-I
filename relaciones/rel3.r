# Ejercicio 1
df <- data.frame(iris, stringsAsFactors = TRUE)
str(df)
length(df[, 1]) # número de registros

# Ejercicio 2

# Ejercicio 3
# a)
df[rownames(df) %in% c("15", "56", "109"), ]
subset(df, c("15", "56", "109"))
# b)
# Las dos son válidas
subset(df, select = c("Petal.Length", "Petal.Width"))
subset(df, select = c(Petal.Length, Petal.Width))

# c)
subset(df, Species == "setosa", c(Petal.Length, Sepal.Length))

# d)
data <- subset(df, Species == "versicolor", Sepal.Width)
data # data.frame
as.vector(data$Sepal.Width)



# Ejercicio 4

# Construimos los datos:
set.seed(120)
letra_aleatoria <- function() {
    sample(LETTERS, size = 1)
}
letras1 <- replicate(10, letra_aleatoria())
letras2 <- replicate(10, letra_aleatoria())

# Respuestas:
# Encuentra el índice de la primera "D"
match("D", letras1)

# ¿Y el índice de las primeras "A" o "B"?
match(c("A", "B"), letras1)
    # ¿Qué significa ese NA?
# Que "B" no está en el vector

# Comprueba si alguna "F"
"F" %in% letras1

# Encuentra las letras que estén en los dos vectores
intersect(letras1, letras2)

# ¿Están las letras A y C en ambos vectores?
c("A", "C") %in% intersect(letras1, letras2)

