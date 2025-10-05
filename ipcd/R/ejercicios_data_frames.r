#EJERCICIOS DATA FRAMES
#Usando el dataset mtcars: 
data(mtcars)
mtcars
#Muestra las 5 primeras filas
mtcars[1:5,]
#Presenta un resumen del datasest
summary(mtcars)
#Haz una copia del dataset y: 
copycars <- mtcars
#Convierte la variables "cyl", "gear" y "carb" en factores
copycars$cyl <- as.factor(copycars$cyl)
copycars$gear <- as.factor(copycars$gear)
copycars$carb <- as.factor(copycars$carb)
class(copycars$cyl)
class(copycars$gear)
class(copycars$carb)
#Convierte las variables "vs" y "am" en lógicas
copycars$vs <- as.logical(copycars$vs)
copycars$am <- as.logical(copycars$am)
class(copycars$vs)
class(copycars$am)
#Muestra solo los coches con una potencia ("hp") mayor a 100
copycars[copycars$hp > 100,]
#Crea un nuevo data frame llamado coches_seleccionados que incluya solo las columnas "mpg", "cyl", "hp" y "qsec" del dataset
coches_seleccionados <- copycars[,c("mpg", "cyl", "hp", "qsec")]
coches_seleccionados
#Calcula el resumen estadístico (media, mediana, desviación estándar, etc.) de la columna "mpg" (millas por galón) para todos los coches en el dataset
summary(copycars[,"mpg"])
#Idem para "cyl" (número de cilindros)
summary(as.numeric(mtcars[,"cyl"]))#los factores siempre complican las cosas
summary((mtcars[,"cyl"]))#para comprobar que sale lo mismo
#Calcula la cantidad total de coches para cada valor único en la columna "cyl" (número de cilindros)
nrow(copycars[copycars$cyl == "4", ])
nrow(copycars[copycars$cyl == "6", ])   #me gustaría hacerlo todo en un solo comando, pero no doy con la tecla
nrow(copycars[copycars$cyl == "8", ])
# Encuentra el modelo de coche con la mayor potencia ("hp") y muestra su información completa
copycars$hp
max(copycars$hp)
copycars[copycars$hp == max(copycars$hp),]
#Calcula el promedio de potencia de los coches con 8 cilindros
mean(copycars$hp[copycars$cyl == "8"])

#Usando el dataset Cars93 del paquete MASS y el dataset mtcars: 
data(Cars93, package="MASS")
Cars93
#Agrega una columna al dataset de mtcars que contenga la marca y modelo de cada coche
mtcars$Make <- rownames(mtcars)
# Combina los dos dataset por modelo y marca del coche solo para aquellos modelos presentes en ambos datasets. ¿Coinciden los demás valores?
combo <- merge(mtcars, Cars93, by="Make") #Los nombres de los coches son diferentes. En mtcars usan Merc para Mercedes, en Cars93 usan Mercedes o Mercedes-Benz
combo[c("Cylinders" ,"cyl")] #No coinciden

#Supongamos que tienes dos dataframes con información sobre estudiantes de dos cursos diferentes. Cada data frame contiene tres columnas: "Nombre", "Edad" y "Promedio". 
curso_a <- data.frame(
 Nombre = c("Juan", "María", "Carlos"),
 Edad = c(20, 22, 21),
 Promedio = c(85, 92, 78))

curso_b <- data.frame(
Nombre = c("Ana", "Luis", "Sofía", "Lourdes"),
Edad = c(19, 23, 20, 21),
Promedio = c(88, 90, 85, 80))
#Combina los dos dataframes en uno solo llamado todos_los_estudiantes
todos_los_estudiantes <- rbind(curso_a, curso_b)
todos_los_estudiantes
#Agrega una nueva columna llamada "Curso" al dataframe todos_los_estudiantes que indicar a qué curso pertenece cada estudiante ("A" o "B")
todos_los_estudiantes$curso <- c(rep("A", nrow(curso_a)), rep("B", nrow(curso_b)))
todos_los_estudiantes
