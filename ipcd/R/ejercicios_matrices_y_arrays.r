#EJERCICIOS MATRICES Y ARRAYS
#1. Dada la siguiente matriz: 
laberinto <- matrix(c(

"O", "X", "O", "O", "O",

"O", "X", "X", "X", "O",

"O", "O", "O", "O", "X",

"X", "X", "X", "O", "X",

"O", "O", "O", "O", "O"

 ), nrow = 5, byrow = TRUE)
#Indique donde están las "X" usando la función which
which(laberinto == "X")
# Indique donde están las "X" usando la función which pero usando el parámetro arr.ind
which(laberinto == "X", arr.ind = TRUE)
# Indique cuantos valores "X" hay en la matriz
length(which(laberinto == "X"))
# Reemplace las "X" por 1 y los "O" por 0 y convierta la matrix en una matrix numérica
laberinto[which(laberinto == "X", arr.ind = TRUE)] <- 1
laberinto
laberinto[which(laberinto == "O", arr.ind = TRUE)] <- 0
laberinto

laberinto <- matrix(as.numeric(laberinto), nrow = 5)
laberinto
# Indique si la matrix es simétrica
laberinto == t(laberinto)
all(laberinto == t(laberinto)) #una matriz es simétrica si es igual a su transpuesta
#Cree una nueva matrix con los valores en las filas y columnas pares
nuevorinto <- laberinto[seq(2,4,2), seq(2,4,2)]
nuevorinto


# 1. Crea una matriz que represente un Sudoku. Debe estar inicializada en NA. Luego rellenar solo un 10% de las casillas con un valor entre 1 y 9 (HINT: usa la función sample). No se preocupe de que sea un esquema válido (se pueden repetir valores en una fila por ejemplo... eso ya lo haremos más adelante...)
sudoku <-matrix(nrow=9, ncol=9, data= NA)
indices <- sample(1:81, 8) #aleatorios que rellenan 8 posiciones (aunque no es un 10% exacto jijiji)
sudoku[indices] <-sample(1:9,8)
sudoku
# 2. Teniendo estas dos matrices:
matriz <- matrix(sample(1:9, 30,replace=TRUE), nrow=5)
mascara <- matrix(sample(c(TRUE,FALSE), 30, replace=TRUE), nrow=5)
mascara
# Aplique la máscara a la matrix, en donde si la posicion en la máscara es FALSE entonces el resultado es 0 y sino se mantiene su valor
modificada <-matriz * as.numeric(mascara)
modificada
# Calcule el producto de la matriz original por la matriz modificada traspuesta (NOTA: la matriz final será de 5x5)
matriz %*% t(modificada)

# Crea un array 5D llamado "mi_array5D" con las siguientes características, rellénalo con números enteros consecutivos comenzando desde 1:
mi_array5D <- array(1:(2*3*4*5*6), dim=c(2,3,4,5,6))
mi_array5D
#accede a los elementos pares (analice la posición de esos valores en las 5 dimensiones)
which(mi_array5D %% 2 == 0)
which(mi_array5D %% 2 == 0, arr.ind=TRUE)
# estudiando el caso anterior muestre los elementos impares sin usar ningun tipo de condicional, igualdad o desigualdad
mi_array5D[1,,,,] # me he sentido muy listo
# 4.2) Redimensiona el array para que tenga...
dim(mi_array5D) <- c(6,5,4,3,2)


#Supongamos que tenemos un grafo no dirigido con 6 nodos etiquetados del 1 al 6, y las siguientes aristas...
adyacencia <- matrix(nrow=6, ncol=6, data=0)
adyacencia[1,2] <- 1
adyacencia[1,3] <- 1
adyacencia[2,4] <- 1
adyacencia[2,5] <- 1
adyacencia[3,6] <- 1
adyacencia[4,5] <- 1
adyacencia <- adyacencia + t(adyacencia) #como el grafo no es dirigido, un nodo que conecta 1 con 2 también conecta 2 con 1. Adicionalmente tenemos todos los datos en la fila y en la columna del nodo
# Calcula el grado del nodo 4 en el grafo. El grado de un nodo es la cantidad de aristas que inciden en él
sum(adyacencia[4,])
# Encuentra todos los nodos adyacentes del nodo 2
adyacencia[2,]*(1:6)  #un poco inortodoxo, pero da por pantalla los números de los nodos
adyacencia
# Cuenta la cantidad de nodos que tiene una arista hacia si mismos (self-loop)
sum(diag(adyacencia))  #creo que el enunciado se refiere a esto? Espero que no hay que hacer un algoritmo recursivo que busque bucles de varios nodos jaja
