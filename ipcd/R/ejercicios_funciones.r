#EJERCICIOS_FUNCIONES
library(tidyverse)
#1. Crea una función "impares" que dada una matriz devuelva el número de elementos impares que contiene.

impares <- function(m){
    sum(m %% 2 != 0)
}
m <- matrix(c(1,2,3,4,5,6,7,8,9), nrow=3)
impares(m)

#2. Crear una función "cambio" que, dada una matriz de números enteros, devuelva una nueva matriz con todos los NA sustituidos por 0.
cambio <- function(m){
    m[is.na(m)] <- 0
    m
}

m2 <- matrix(c(1,2,NA,4,5,NA,7,8,9), nrow=3)
cambio(m2)




#3. Crear una función "reducir" que dados dos vectores devuelva uno lista con dos componentes: 1) un vector con los elementos comunes sin repetir y 2) la cantidad de elementos totales eliminados al quitar los repetidos.
vector1 <- c(1,2,NA,4,5,NA,7,8,9)
vector2 <- c(1,2,3,4,5,6,7,8,9)

reducir <- function(v1, v2){
    vx <- v1 %in% v2     #veo si el elemento está en v2
    v3 <- v1[vx]    #los añado a v3
    v3 <- unique(v3) #quito los repetidos
    l <- length(v3)  #calculo los eliminados
    c(v3, l)
}
#No entiendo muy bien el enunciado. L "la cantidad de elementos totales eliminados al quitar los repetidos". Pues a mí me suena que  siempre va a ser la longitud de v3. Poruqe si metes un elemento en v3 se supone que lo metes dos veces, está repetido, y lo eliminas (no dice nada de eliminar repetidos en v1 y v2)
#Otra opción es que "totales" se refiera a en los vectores 1 y 2. En ese caso simplemente sería 2 veces la longitud de v3 porque los has quitado una vez de cada vector.
#Pero en ambos casos me parece trivial, así que supongo que no estoy entendiendo bien el enunciado.
x <- reducir(vector1, vector2)
x

#4. Crear una función "vyc" que dada una cadena de caracteres devuelva una lista de dos componentes, uno que contenga las vocales y otro las consonantes (en orden alfabético y minúsculas sin repetir).
vyc <- function(string){
    vocales <- sort(tolower(unique(unlist(str_extract_all(string,"[AEIOUaeiou]"))))) #en R hay funciones para todo
    consonantes <- sort(tolower(unique(unlist(str_extract_all(string,"[BCDFGHJKLMNÑPQRSTVWXYZbcdfghjklmnñpqrstvxyz]")))))
    list(vocales, consonantes)
}
#Debería haber usado los pipelines del tidyverse? Quizás. 

cadena <- "Hola que tal esto es una prueba para ver si funciona     WAWIAASGH"
vyc(cadena)

#5. Crear una función "subpos" que dado un vector v y dos valores x e y (siendo y un parámetro opcional), devuelva una nuevo vector con los valores incluidos después de la aparición de la primera x (si x no está, empieza desde el principio) hasta la primera y (que aparezca después de la primera x), (si y no está o no se pasa por parámetro, termina hasta el final del vector). Ejemplos: 
subpos <-function(v,x=1,y=length(v)){ #x e y por defecto, por lo tanto no necesitas ponerlos
    a <- as.numeric(!y %in% v)    #no puedo usar if, pero puedo reinventarlo con pasos extra muajaja
    y <- y - (y - length(v)) * a          #SOLO si "y" está fuera del rango del vector (el 0 del false del %in% lo convierto en 1 invirtiendo con "!"), se convierte en length(v). Si está dento -> el factor "a" será 0 y por lo tanto es un simple y <- y
    b <- as.numeric(!x %in% v)
    x <- x - (x-1)*b            #y x igual pero reduciendolo a 1 (el principio de un vector)
    v[x:y]
}

subpos(1:4, 8, 3)
subpos(1:4, 2, 8)
subpos(1:4, 2)
subpos(1:4, 3, 2) #debilidad: x>y dentro de los valores válidos del vector. Lo va a poner backwards. No se me ocurre forma de tratarlo. Mi truquito de multiplicar no sirve para devolver vectores vacíos en este caso

subpos(1:4, -8, 3) #comprobando que funciona con negativos
subpos(1:4, 2, -8)
