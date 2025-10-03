#EJERCICIOS_INPUT_OUTPUT
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