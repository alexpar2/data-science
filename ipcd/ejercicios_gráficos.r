#EJERCICIOS GRÁFICOS
library(ggplot2)
library(tidyverse)

ex1 <- data.frame(stretch=c(46,54,48,50,44,42,52), distance=c(148,182,173,166,109,141,166))

ggplot(ex1, aes(x = stretch, y = distance)) + 
geom_point(color="red", size=10) +
labs(title="Distancia en función de stretch", subtitle="Stretch the distance!", x="Stretch", y="Distance", caption="Fig. 1")