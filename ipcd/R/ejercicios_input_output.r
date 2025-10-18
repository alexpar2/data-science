#EJERCICIOS_INPUT_OUTPUT
library(tidyverse)
#1. Pida al usuario que introduzca con el teclado una cadena de caracteres s y un número n e imprima en pantalla n veces la cadena s (sin espacios entre palabras) tal como se ve en el ejemplo (notar que no hay un [1] al principio...). 
data <- readline("Pon un input del tipo s=\"cadena de caracteres\" n=numero:")
class(data)
frase_div <- str_split(data, "[=\\\"]+")
s <- frase_div[[1]][2]
n <- as.numeric(frase_div[[1]][4])
cat(rep(s, n), sep="")  #el esfuerzo que me ha costado hacer esto ha sido monumental

#2. Crea tres ficheros llamados dos.txt, tres.txt y cinco.txt que contengan la tabla de 2, 3 y 5 respectivamente (sólo incluye los 10 primeros valores de cada uno, un número en una línea separada, SOLO el número, nada más).
write.table(matrix(2*(1:10), ncol=1), file= "dos.txt", row.names=FALSE, col.names=FALSE)
write.table(matrix(3*(1:10), ncol=1), file= "tres.txt", row.names=FALSE, col.names=FALSE)
write.table(matrix(5*(1:10), ncol=1), file= "cinco.txt", row.names=FALSE, col.names=FALSE)

# 3. Escribe las cinco primeras filas de la matriz creada en el último ejercicio en un nuevo fichero llamado prime.txt y las cinco últimas en otro fichero llamado fin.txt. Ambos ficheros deben tener los datos separados por comas.
# ...existing code...

dos <- scan("dos.txt")
tres <- scan("tres.txt")
cinco <- scan("cinco.txt")
tabla <- cbind(dos, tres, cinco)
write.table(tabla[1:5, ], file="prime.txt", sep=",", row.names=FALSE, col.names=FALSE)
write.table(tabla[6:10, ], file="fin.txt", sep=",", row.names=FALSE, col.names=FALSE)

#4. Dados dos números, f y c (dados por el usuario mediante el teclado), cree una figura cuadrada de f filas y c columnas con el carácter "x" (sin espacios). Vea a continuación un ejemplo para f=4 y c=3 (notar que no hay espacios en blanco ni [1,] ni cosas raras...): 
x <- readline("Hagamos una matriz de X! pon \"f=nfilas c=ncolumnas \"")
filas <- as.numeric(str_match(x, "f=(\\d+)")[,2])
columnas <- as.numeric(str_match(x, "c=(\\d+)")[,2])
filas
columnas
matrix("X", nrow=filas, ncol=columnas)
#5. Cargue la primer y tercera hojas del fichero resultados.xls y muestre un gráfico que compare, para los dos datasets, el resultado en entrenamiento y test a medida que aumenta la cantidad de bits utilizados.
library("readxl")
library("ggplot2")

datos1 <- read_xlsx("results.xlsx", sheet=1, col_names=TRUE, skip = 1) %>% mutate(Origen="o1")
datos2 <- read_xlsx("results.xlsx", sheet=3, col_names= TRUE, skip=1) %>% mutate(Origen="o2")
datos <- bind_rows(datos1, datos2)
ggplot(datos, aes(x=Train, y=Test, color=Origen)) + geom_line() + theme_minimal()
