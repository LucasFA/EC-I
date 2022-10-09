# (Disculpa el retraso, me lié en su momento y se me pasó mandar aunque fuera lo que tuviera más o menos listo)
# Ejercicio 4
# Preguntas:
# Encuentra el índice de la primera "D"
# ¿Y el índice de las primeras "A" o "B"?
# ¿Qué significa ese NA?
# Comprueba si hay alguna "F"
# Encuentra las letras que estén en los dos vectores
# ¿Están las letras A y C en ambos vectores?
# Encuentra el índice en letras1 de la primera ocurrencia de un valor común a letras1 y letras2

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

# Encuentra el índice en letras1 de la primera ocurrencia de un valor común a letras1 y letras2
min(match(intersect(letras1, letras2), letras1))
