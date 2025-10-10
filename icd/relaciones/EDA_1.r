library(tidyverse)
library(ggplot2)
usairlines <- read_csv("datasets/USAirlines.csv") %>% select(-1)
usairlines

# * Una vez descargado comprueba la dimensión y los nombres de las columnas del dataset. ¿Qué dimensión tiene? ¿qué tipo de datos alberga? (e.g. 4 variables numéricas continuas)

# 6 variables.

# Firm year, cost y price son enteros.
# Output y load son doubles.

sapply(usairlines, class)
usairlines$firm <- as.factor(usairlines$firm)

# * Calcula las tendencias centrales de todos los datos del dataset (mean, media) Tip: puedes usar la función apply()o tidyverse
# Puedes usar summary y te dice la media y la mediana de todas las columnas
# * Haz lo mismo para las medidas de dispersión mínimo y máximo. ¿Seria posible hacerlo con un único comando?. ¿Que hace la función range()?
# Summary también calcula el máximo y el mínimo de todas las columnas.

summary(usairlines)


# * Sin embargo las medidas mas populares de dispersión son la varianza (var()), su desviación standard (sd()) y la desviación absoluta de la mediana mad(). Calcula estas medidas para los valores de la variable RA
# * Imagina que quieres calcular dos de estos valores de una sola vez. ¿Te serviría este código?
# f = function(x) c(median(x), mad(x))   No funciona, sale un error que dice que necesita numeric data

usairlines$price %>% var
usairlines$price %>% sd
usairlines$price %>% mad


f = function(x) c(median(x), mad(x))
f(usairlines [,3])

# * Implementa estos cálculos para cost usando dplyr de tidyverse

f(usairlines$cost)

# * ¿Cuál sería el resultado de aplicar apply(USAirlines,2,f)?

apply(usairlines,2,f)
# apply aplica la función f a (2) que es las columnas del dataset. Una fila es median y la otra es mad

#* Vamos a medir la dispersión de la muestra utilizando el concepto de cuartiles. El percentil 90 es aquel dato que excede en un 10% a todos los demás datos. El cuartil (quantile) es el mismo concento, solo que habla de proporciones en vez de porcentajes. De forma que el percentil 90 es lo mismo que el cuartil 0.90. La mediana “median” de un dataset es el valor más central, en otras palabras exactamente la mitad del dataset excede la media. Calcula el cuartil .10 y .50 para la columna cost del dataset hip. Sugerencia: quantile()

quantile(usairlines$cost, probs = c(0.10, 0.50))


#* Los cuantiles 0.25 y 0.75 se conocen como el  “first quartile” o Q1 y el “third quartile” o Q3, respectivamente. Calcula los cuatro cuartiles para cost con un único comando.
quantile(usairlines$cost, probs = c(0.25,0.50,0.75,1.00))


# * Otra medida de dispersion es la diferencia entre el primer y el tercer cuartil conocida como rango intercuartil (IQR) Inter Quantile Range. ¿Obtienes ese valor con la función summary()?
summary(usairlines)
#no, no la obtengo
IQR(usairlines$cost)

#*Crea un scatterplot que te compare los valores de cost y output. Representa los puntos con el símbolo ‘.’ Y que estos puntos sean de color rojo si year el igual o mayor de 1980. Sugerencia: puedes usar dplyr/tidyverse o Rbase ifelse()
#¿Ves algún patrón?

ggplot(usairlines, aes(x = cost, y = output)) +
  geom_point(aes(color = year >= 1980), size=10) +
  scale_color_manual(values = c("FALSE" = "black", "TRUE" = "red")) +
  labs(title = "Scatterplot: Cost vs Output", x = "Cost", y = "Output")

# parece que cost y output están directamente relacionados


#* En vez de crear los plots por separado para cada par de columnas, hazlos con un solo comando con el scatterplot matrix

library(GGally)
ggpairs(usairlines)  #no es la panacea

# Ejemplo , InsectSprays dataset

# El dataset “InsectSprays” está incluido en la libreria de R “datasets”. Contiene el conteo de insectos extraidos de diferentes zonas agrícolas tratadas de forma experimental con diferentes insecticidas. Haz un boxplot para determinar que insecticida parece ser el más efectivo.

inspray <- InsectSprays
inspray$spray <- as.factor(inspray$spray)


ggplot(InsectSprays, aes(x = spray, y = count)) +
  geom_boxplot() +
  labs(title = "Boxplot de conteo por insecticida", x = "Insecticida", y = "Conteo")

#Está entre B y F. B tiene mayor media y F una dispersión más elevada. Pero diría que B es el mejor.


# Ejemplo , Carseats

# Instala la library(ISLR), vamos a trabajar con el dataset Carseats. Si vas a usar dplyr puedes inspeccionar el paquete “dlookr” 
# 1)	Encuentra que variables tienen skewness
# 2)	Genera dos listas, una de variables con skewness a la derecha y otra con skewness a la izquierda
# 3)	Averigua que variables no están distribuidas de forma normal, crea gráficos que lo prueben

library("ISLR")



