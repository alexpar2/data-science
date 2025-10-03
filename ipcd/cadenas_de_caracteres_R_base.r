#CADENAS_DE_CARACTERES_R_BASE
#1. Crea un vector de cadenas de caracteres con tu nombre y apellidos (por ejemplo, ["Rocío", "Romero", Zaliz"]). A partir de el crea una nueva cadena de caracteres con la inicial de tu nombre, un punto y tus apellidos (por ejemplo, "R. Romero Zaliz").
nombre <- c("Alejandro","Pérez", "Argüello")
nombre
nombre2 <- paste(paste0(substr(nombre[1], 1, 1), "."), nombre[2], nombre[3], sep = " ")
nombre2
#2. Dado un vector de cadenas de caracteres que representan fechas (por ejemplo, ["2005-11-28", "2015-10-18", "2000-01-01"], utilizando el formato AÑO-MES-DÍA), mostrar sólo las correspondientes a los meses impares.
fechas <-c("2005-11-28", "2015-10-18", "2000-01-01")
fechas[grep("\\d+\\-[01][13579]\\-\\d+", fechas)]
#3.Dada una cadena de caracteres con varias palabras (por ejemplo, "Esta es una frase, pero no cualquier frase.") crea un vector con cada una de las palabras de la cadena (por ejemplo, ["Esta", "es", "una", "frase", "pero", "no", "cualquier", "frase"]). Tenga en cuenta todos los caracteres de puntuación posibles
frase <-  "Esta es una frase, pero no cualquier frase."
strsplit(frase, "[,\\. ]+")
#4. Busca en un vector de cadenas de caractees aquellas que incluyan sólo vocales "a" y/o "e" o ninguna (comprueba mayúsculas y minúsculas, considera á, é, Á y É como otros caracteres y no los que buscas).
frases2 <- c("Esta es una frase, pero no cualquier frase.", "aeaeae", "aeAEAE", "aeiou", "bcdfg", "ÁÉáé")
grep("\\b[aeiouAEIOU]+\\b|\\b[bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZ]+\\b", frases2, value = TRUE)
#5. Dados tres vectores numéricos que representan días, meses y años, crea un vector nuevo con fechas (sólo si son válidas, si la fecha es inválida ignorarla) (Sugerencia: investigue la función as.Date).
dias <- c(28, 18, 1)
meses <- c(11, 10, 1)
años <- c(2005, 2015, 2000)
fechas <- as.Date(paste(años, meses, dias, sep = "-"))
fechas[!is.na(fechas)]
class(fechas)
fechas
