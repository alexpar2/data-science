#EJERCICIOS_PROGRAMACION
# Crear una función "creciente" que indique si los elementos de un array dado son estrictamente crecientes. No se permite ordenar el vector.
creciente <- function(v){
    l <- length(v)
    all(v[1:l-1] < v[2:l])
}

creciente(1:10)
creciente(c(1,2,2,3))
creciente(10:1)

#2. Crear una función "montecarlo" que calcule la estimación de la integral dada: 
montecarlo <- function(N=10000){
    valores <- list(runif(N,0,1), runif(N,0,1))
    sum(valores[[1]] < valores[[2]]^2)/N
}
montecarlo(1000000)

# 3. Crea una lista de cinco matrices numéricas y ordena cada una de ellas tras su creación (el elemento [1,1] tendrá el valor menor y el [#filas,#columnas] el valor mayor).

matrices <- lapply(1:5, function(i){matrix(sample(1:1000, 25), ncol=5)})
lapply(matrices, function(i){matrix(sort(i),ncol=5)})

#4. Calcula el valor mínimo de cada columna de una matriz, pero suponiendo que los números impares son negativos y los pares positivos.
m <- matrix(sample(1:1000, 25), ncol=5)
apply(m, 2, function(i){
    alt <- lapply(i, function(j){ifelse(j%%2 == 0, j, -j)})
    abs(min(unlist(alt)))
})

#5. Dada una matriz devuelve una lista de todos los valores mayores que 7 de cada fila.
m <- matrix(sample(1:10, 25, replace=TRUE), ncol=5)
m
apply(m,1,function(x){x[x>7]})
