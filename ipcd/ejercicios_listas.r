#EJERCICIOS LISTAS
# Crea una lista llamada mi_lista que contenga los siguientes elementos: un vector numérico de 15 elementos, un vector de caracteres de 5 elementos y un vector de valores booleanos de 10 elementos todos TRUE
mi_lista <- list(numeros = 1:15, caracteres = c("h","o","l","a","!"), booleanos = rep(TRUE, 10))
mi_lista
#Dada la siguiente lista my_list <- list(name="Fred", wife="Mary", no.children=3, child.ages=c(4,7,9)): 
my_list <- list(name="Fred", wife="Mary", no.children=3, child.ages=c(4,7,9))
#Imprime los nombres de todos los componentes de la lista
attributes(my_list)
#Devuelve el segundo componente de la lista
print(my_list[2])
#Recupera el segundo elemento del cuarto componente de la lista
print(my_list[[4]][2])
#Imprime la longitud del cuarto elemento de la lista
print(length(my_list[[4]]))
#Reemplaza el cuarto elemento de la lista por un vector de 12 numeros del 1 al 12
my_list[[4]] <- 1:12
my_list
#Elimina el componente wife
my_list$wife <- NULL
my_list
#Añade un componente más a la lista llamado pepe
mi_lista[[length(mi_lista)+1]] <- "pepe"
mi_lista

#Convertir un vector de 30 números postivos y negativos en una lista con [1ra componente: los 2 primeros elementos, 2da componente: los 5 siguientes pero como caracteres, 3ra componente: los elementos restantes que sean valores positivos, 4ta componente: una lista de caracteres con tu nombre y apellidos (ej: "Rocio" "Romero" "Zaliz")] 
vector <- sample(-100:100, 30)
vector
lista_vector <- list(vector[1:2], as.character(vector[3:8]),vector[9:30][vector[9:30] > 0], list("Alejandro", "Pérez", "Argüello"))
lista_vector
#Una vez creado ponles nombre (ej: "1ro", "2do" etc)
names(lista_vector) <- c("1ro", "2do", "3ro", "4to")
lista_vector
#Accede al tercer elemento por su nombre
lista_vector[["3ro"]]
#Fusiona el primer y cuarto componente en un quito componente y borra los originales
lista_vector[[5]] <- c(lista_vector[[1]], lista_vector[[4]])
lista_vector

lista_vector <- lista_vector[-c(1,2,3,4)]
lista_vector

#Crea una nueva lista cuyos componentes sean las listas de los ejericios anteriores (OJO: Su longitude debería ser 3)
nuevalista <- list(mi_lista, my_list, lista_vector)
length(nuevalista)
#Crea una nueva lista que concatene las listas de los tres primeros ejericios. ¿Qué longitud tiene?
novalista <- c(mi_lista, my_list, lista_vector)
class(novalista)
length(novalista)
#longitud 8