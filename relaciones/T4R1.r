# Ej 1
npos <- function(v, w) {
    prod <- outer(v, w)
    list(
        num_prod = length(v) * length(w),
        num_positivos = sum(prod >= 0)
    )
}
sample_size <- 5

npos(rnorm(sample_size), rnorm(sample_size))

# Ej 2

progres <- function(a1, a2, n) {
    if (missing(n) || !is.numeric(n) || n <= 2) {
        return(0)
    }

    if (a1 == 0 && a2 == 0) {
        return(0)
    }

    choice <- sample(c(0, 1), size = 1, prob = c(0.75, 0.25))

    v <- c(a1, a2)
    func_final <- if (choice == 0) {
        function(s) s
    } else {
        function(s) 2 * s
    }

    for (i in seq(from = 3, to = n)) {
        v <- append(
            v,
            func_final(sum(tail(v, 2)))
        )
    }

    list(
        n_term = v[n],
        n_primeros = head(v, 10),
        media = mean(v),
        var = var(v)
    )
}

# 5

juego <- function(arg) {
    data <- read.csv(file = "./moneda.txt", stringsAsFactors = TRUE)
    choice <- sample(c("dado", "moneda"), size = 1)
    if (choice == "dado") {
        list(
            a_media = mean()
        )
        )
    } else {

    }

}