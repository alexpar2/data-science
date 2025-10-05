#EJERCICIOS TIDYVERSE
library(tidyverse)
#Utiliza el dataset de mtcars y el paquete tidyverse para: 
data(mtcars)
#Mostrar las 5 primeras filas del dataset
mtcars %>% slice(1:5) #más largo que sin tidyverse
#Convertir la variables "cyl", "gear" y "carb" en factores y las variables "vs" y "am" en lógicas, y mostrar la estructura del dataset (usar este dataset transformado de aqui en adelante)
mtcars$cyl <- as.factor(mtcars$cyl)
mtcars$gear <- as.factor(mtcars$gear)
mtcars$carb <- as.factor(mtcars$carb)
mtcars$vs <- as.logical(mtcars$vs)
mtcars$am <- as.logical(mtcars$am)
summary(mtcars)
#Mostrar solo los coches con una potencia ("hp") mayor a 100
filter(mtcars, hp > 100)
#Seleccionar solo las columnas "mpg", "cyl", "hp" y "qsec" del dataset
mtcars %>% select(mpg, cyl, hp, qsec)
#Calcular la cantidad total de coches para cada valor único en la columna "cyl" (número de cilindros)
mtcars %>% group_by(cyl) %>% summarise(NN = n()) %>% arrange(desc(NN))
#Encontrar el modelo de coche con la mayor potencia ("hp") y mostrar su información completa
filter(mtcars, hp == max(hp))
#Calcular el promedio de potencia de los coches con 8 cilindros
mtcars %>% filter(cyl == "8") %>% summarise(mean(hp))
#Supongamos que tienes un data frame llamado lego_sets que contiene información sobre diferentes conjuntos de Lego, incluyendo el nombre del conjunto, el número de piezas, el tema y el año de lanzamiento: 
nombres <- paste("Conjunto", 1:80)
piezas <- sample(50:1000, 80, replace = TRUE)
temas <- sample(c("Ciudad", "Espacio", "Arquitectura", "Granja", "Dinosaurios", "Aventuras", "Piratas"), 80, replace = TRUE)
años <- sample(2000:2023, 80, replace = TRUE)
lego_sets <- data.frame(
  Set_Name = nombres,
  Piece_Count = piezas,
  Theme = temas,
  Year = años
)
#Filtra y muestra solo los conjuntos de Lego lanzados en el año 2020
filter(lego_sets, Year == 2020)
#Encuentra y muestra el nombre y el número de piezas del conjunto de Lego más grande
filter(lego_sets, Piece_Count == max(Piece_Count)) %>% select(Set_Name, Piece_Count)
#Calcula la cantidad total de piezas para cada tema y muestra un resumen ordenado en orden descendente
lego_sets %>% group_by(Theme) %>% summarise(n_pieces = sum(Piece_Count)) %>% arrange(desc(n_pieces))
#Calcula cuántos conjuntos de Lego se lanzaron en cada año y muéstralo ordenado por año
lego_sets %>% group_by(Year) %>% summarise(count = n())
#Encuentra los 3 temas más populares (con más conjuntos) y muestra el número de conjuntos y el número total de piezas para cada uno de ellos
lego_sets %>% group_by(Theme) %>% summarise(total_pieces = sum(Piece_Count), n_sets = n()) %>% arrange(desc(n_sets)) %>% slice(1:3)


# Dado un data frame llamado bebidas que contiene información sobre la edad, género, tipo de bebida y cantidad de copas consumidas por un grupo de personas, filtra y muestra únicamente a las mujeres mayores de 20 años. Para este suconjunto calcula la media, el máximo, la cantidad de copas totales y la desviación estándar de la edad para cada combinación de tipo de bebida. Finalemnte, agrega una nueva columna que indique cuántas personas se encuentran en cada grupo de tipo de bebida.

num_elementos <- 100
edades <- sample(18:70, num_elementos, replace = TRUE)
sexos <- sample(c("Hombre", "Mujer"), num_elementos, replace = TRUE)
tipos_bebida <- sample(c("Cerveza", "Vino", "Refresco", "Cóctel", "Agua"), num_elementos, replace = TRUE)
cantidad_copas <- sample(1:5, num_elementos, replace = TRUE)
bebidas <- data.frame(
  Edad = edades,
  Sexo = sexos,
  Bebida = tipos_bebida,
  Copas = cantidad_copas
)

mubidas <- subset(bebidas, Edad > 20 & Sexo == "Mujer")
summary(mubidas)
mubidas %>% group_by(Bebida) %>% summarise(media = mean(Copas), maximo = max(Copas), total = sum(Copas), desviación_estandar = sd(Edad))
#Finalemnte, agrega una nueva columna que indique cuántas personas se encuentran en cada grupo de tipo de bebida.
mubidas %>% group_by(Bebida) %>% mutate(n_personas = n()) %>% ungroup() #ein?



#Dado un data frame llamado peliculas, indique los 2 géneros con mayor puntuación media por país pero solo de peliculas para mayores de 13 o superiores, que incluya el número de películas en ese género, su beneficio medio (ganancia-presupuesto), la desviación estándar de la puntuación y la puntuación media. Ordenar los resultados por puntuación media por país de forma descendente.

# Crear un data frame con 150 filas
num_filas <- 150

# Generar datos ficticios
set.seed(123)  # Para reproducibilidad
paises <- sample(c("EE. UU.", "Reino Unido", "Francia", "España", "Italia"), num_filas, replace = TRUE)
nombres <- paste("Película", 1:num_filas)
años <- sample(1980:2023, num_filas, replace = TRUE)
puntuaciones <- round(runif(num_filas, 1, 10), 1)
tematicas <- sample(c("Acción", "Drama", "Comedia", "Ciencia Ficción", "Animación"), num_filas, replace = TRUE)
directores <- paste("Director", 1:num_filas)
companias <- sample(c("Warner Bros.", "Universal Pictures", "Disney", "Sony Pictures", "Paramount Pictures"), num_filas, replace = TRUE)
presupuestos <- round(runif(num_filas, 1000000, 50000000), 2)
ganancias <- round(presupuestos * runif(num_filas, 0.5, 2.5), 2)
ratings <- sample(c("G", "PG", "PG-13", "R", "NC-17"), num_filas, replace = TRUE)  # Columna de rating ficticio

# Crear el data frame
peliculas <- data.frame(
  País = paises,
  Nombre = nombres,
  Año = años,
  Puntuación = puntuaciones,
  Temática = tematicas,
  Director = directores,
  Compañía = companias,
  Presupuesto = presupuestos,
  Ganancia = ganancias,
  Rating = ratings
)

# Dado un data frame llamado peliculas, indique los 2 géneros con mayor puntuación media por país pero solo de peliculas para mayores de 13 o superiores, que incluya el número de películas en ese género, su beneficio medio (ganancia-presupuesto), la desviación estándar de la puntuación y la puntuación media. Ordenar los resultados por puntuación media por país de forma descendente.

peliculas %>%
 filter(Rating == "PG-13" | Rating == "R" | Rating == "NC-17") %>%
 group_by(País, Temática) %>%
 summarise(beneficio_medio = mean(Ganancia - Presupuesto), punt_media = mean(Puntuación), punt_sd = sd(Puntuación), n_pelis = n()) %>%
 arrange(País, desc(punt_media)) %>%
 slice(1:2) #No entiendo. ¿por qué me salen el top 2 géneros de cada país en vez de solamente las dos primeras entradas?

# Dado un conjunto de datos llamado notas que contiene información sobre las notas de los estudiantes en varias asignaturas, agrega una columna con la nota promedio de cada estudiante. Previamente reemplaza los valores faltantes con 0 (HINT: usa replace_na).

 # Generar datos ficticios
estudiantes <- paste("Estudiante", 1:50)
notas_matematicas <- sample(c(NA, 5, 6, 7, 8, 9, 10), 50, replace = TRUE)
notas_historia <- sample(c(NA, 4, 5, 6, 7, 8), 50, replace = TRUE)
notas_ciencias <- sample(c(NA, 6, 7, 8, 9, 10), 50, replace = TRUE)

# Crear el data frame
notas <- data.frame(
  Estudiante = estudiantes,
  Nota_Matemáticas = notas_matematicas,
  Nota_Historia = notas_historia,
  Nota_Ciencias = notas_ciencias
)
# agrega una columna con la nota promedio de cada estudiante. Previamente reemplaza los valores faltantes con 0 (HINT: usa replace_na).
notas <- replace_na(notas, list(Nota_Matemáticas = 0, Nota_Historia = 0, Nota_Ciencias = 0))
notas %>% mutate(nota_media = (Nota_Matemáticas + Nota_Historia + Nota_Ciencias)/ 3) #Poco elegante me parece, pero usando mean usaba la media de todas las notas
