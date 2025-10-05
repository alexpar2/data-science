#EJERCICIOS FACTORES


#1. Crea un factor llamado "fact_puntuacion" que contenga puntuaciones de 1 al 5 para 1000 productos. Utiliza la función summary() para obtener un resumen de la distribución de puntuaciones. ¿Qué puedes deducir del tipo de aleatoriedad usada en sample? ¿Es normal, uniforme, ...?
puntuacion <- sample(1:5, 1000, replace=TRUE)
puntuacion
fact_puntuacion <- factor(puntuacion, levels=c(1,2,3,4,5), labels=c("Trash", "Low", "Mid", "Good", "Great"))
summary(fact_puntuacion)
#Trash   Low   Mid  Good Great 
#  210   180   219   201   190
#El tipo de aleatoriedad usado en sample es bastante uniforme, ninguno se desvía más del 10% (20 ocurrencias) del resultado esperado
# Aunque cabe decir que esto se tendría que repetir muchas veces para realmente hcer una observación útil.


#2. Crea un factor ordenado para edades entre 0 y 100 de 100 personas. Utiliza la función cut para generar 3 nieveles separados. Ahora reetiqueta el factor como "joven", "adulto" o "anciano". Muestra la frecuencia de cada nivel.
edades <- sample(0:100, 100, replace=TRUE)
edades
factor_edades <- cut(edades, breaks=c(0,18,65, 100), labels=c("Menor", "Adulto", "Senior"), include_lowest=TRUE)
summary(factor_edades)


# 3. Crea un factor para el siguiente vector teniendo en cuenta que los niveles posibles son todas las letras de la "A" a la "Z": 
v <- c("A","I", "I", "J", "A", "Z", "X")
factor_v <- factor(v, levels=LETTERS)
#Modifica una de las "I" por una "F"
factor_v[2]<- "F"
factor_v
# Agrega una nueva "A" en última posición
factor_v <- c(factor_v, "A")
factor_v   #por qué se transforman en números????
# Al parecer hay que reacerlo
factor_v <- factor(v, levels=LETTERS)
factor_v[2]<- "F"
factor_v <- as.character(factor_v)  #pasarlo a caracter
factor_v <- c(factor_v, "A")    #añadir el elemento
factor_v <- factor(factor_v, levels=LETTERS)   #volver a convertir a factor
factor_v

#Indica las letras que aparecen en el factor ordenadas por su frecuencia, empezando con la menos frecuente
sort(table(factor_v)[table(factor_v) > 0])
