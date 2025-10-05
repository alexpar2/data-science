#EJERCICIOS VECTORES 
#1. Crea un vector de números impares entre el 1 y el 30 (ambos inclusive)
seq(1,30,2)
#2.Crea los siguientes vectores:
#   un vector del 1 al 20
1:20
#  un vector del 20 al 1
20:1
#  un vector que tenga el siguiente patrón 1,2,3,...,19,20,19,18,...,2,1
c(1:20, 19:1)
# 3. Crea una secuencia de números del 1 al 30 con un incremento de 0.5
seq(1,30,0.5)
# 4. Crea una secuencia que contenga las cuatro primeras letras del abecedario en minúscula 3 veces cada una (a a a b b b c c c d d d)
rep(letters[1:4], each=3)
# 5. Crea el vector numérico x con los valores 2.3, 3.3, 4.3 y accede al segundo elemento del vector
x <- seq(2.3, 4.3, 1)
x[2]
# 6. Crea un vector numérico z que contenga los números del 1 al 10. Cambia la clase del vector forzando que sea de tipo carácter. Después cambia el vector z a numerico otra vez
z <-1:10
z <- as.character(z)
z
z <- as.numeric(z)
z
# 7. Crea un vector numérico con valores no ordenados usando la función sample(). Una vez creado ordena el vector de forma ascendente usando la función sort(). ¿Si quisieras invertir el orden de los elementos del vector que función utilizarías?
a <-sample(z, 15, replace = TRUE)
a
b <- sort(a, decreasing = FALSE)
b
rev(b)
# 8. Crea un vector x que contenga los elementos -5,-1,0,1,2,3,4,5,6. Escribe un código del tipo x[algo], para extraer: 
x <-c(-5,-1,0:6)
x
#elementos de x menores que 0,
x[x<0]
#elementos de x menores o igual que 0,
x[x<=0]
#elementos de x mayores o igual que 3,
x[x>=3]
#elementos de x menores que 0 o mayores que 4,
x[x<0 | x>4]
#elementos de x mayores que 0 y menores que 4,
x[x>0 & x<4]
#elementos de x distintos de 0
x[x!=0]
# 9. Crea los siguientes vectores x<-month.name[1:6] y z<-month.name[4:10] a partir del vector original month.name. Recupera los valores idénticos entre los vectores x y z usando %in%
x <- month.name[1:6]
z <- month.name[4:10]
x[x %in% z]
#10. R permite extraer elementos de un vector que satisfacen determinadas condiciones usando la función subset(). Para el vector x <- c(6,1:3,NA,12) calcula los elementos mayores que 5 en x usando: 
x <- c(6,1:3,NA,12)
# el filtrado normal, es decir, con el operador >
x[x > 5]
# la función subset()
subset(x, x > 5)
