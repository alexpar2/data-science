#EJERCICIOS TIDYVERSE
library(tidyverse)

data(mtcars)

print(mtcars[1:5,]) #más largo que sin tidyverse

mtcars$cyl <- as.factor(mtcars$cyl)
mtcars$gear <- as.factor(mtcars$gear)
mtcars$carb <- as.factor(mtcars$carb)
mtcars$vs <- as.logical(mtcars$vs)
mtcars$am <- as.logical(mtcars$am)
summary(mtcars)

filter(mtcars, hp > 100)

mtcars %>% select(mpg, cyl, hp, qsec)

mtcars %>% group_by(cyl) %>% summarise(NN = n()) %>% arrange(desc(NN))

filter(mtcars, hp == max(hp))

mtcars %>% filter(cyl == "8") %>% summarise(mean(hp))

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

filter(lego_sets, Year == 2020)

filter(lego_sets, Piece_Count == max(Piece_Count)) %>% select(Set_Name, Piece_Count)

lego_sets %>% group_by(Theme) %>% summarise(n_pieces = sum(Piece_Count)) %>% arrange(desc(n_pieces))

lego_sets %>% group_by(Year) %>% summarise(count = n())

lego_sets %>% group_by(Theme) %>% summarise(total_pieces = sum(Piece_Count), n_sets = n()) %>% arrange(desc(n_sets)) %>% slice(1:3)

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
