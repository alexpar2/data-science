"""
1. Escribe una función contar_letras(palabra, letra) que devuelva el número de veces que aparece una letra en una palabra.

Se debe resolver recorriendo la cadena carácter a carácter.

Por ejemplo: contar_letras("perro", "r") devuelve 2

2. Escribe una función contar_palabras(cadena) que cuente el número de veces que aparece cada palabra en cadena y devuelva el número de palabras.

Se debe resolver recorriendo la cadena carácter a carácter.

3. Un anagrama de una palabra pal1 es una palabra formada con las mismas letras que pal1 pero en orden distinto. Escribe una función anagrama(palabra1, palabra2) que determine si es una anagrama. Ejemplo: marta – trama

4. Escribe una función todas_las_letras(palabra, letras) que determine si se han usado todos los caracteres de letras en palabra.

5. Escribe una función suma_digitos(cad) que haga la suma de los dígitos de un número que está en cad. Modificar ahora la función para que también funcione si cad es un int.

Por ejemplo, suma_digitos("123") debería devolver 6
"""


#1
def contar_letras(palabra, letra):
    caracteres = list(palabra)
    cuenta = 0
    for c in caracteres:
        if c == letra:
            cuenta += 1
    return cuenta

print("Ejercicio 1")
print(contar_letras("alambre", "a"))

def contar_palabras(cadena):
    caracteres = list(cadena)
    buffer = ""
    conteo = {}
    for c in caracteres:
        if c == " ":
            if buffer:  # evita agregar palabras vacías
                conteo[buffer] = conteo.get(buffer, 0) + 1
                buffer = ""
        else:
            buffer += c
    # añadir la última palabra si no termina en espacio
    if buffer:
        conteo[buffer] = conteo.get(buffer, 0) + 1
    return conteo

print("ejercicio2")
print(contar_palabras("hola hola que tal que tal estás"))

def anagrama(pal1,pal2):
    char1 = list(pal1)
    char2 = list(pal2)
    if len(char1) == len(char2):
        for c in char1:
            if c in char2:
                char2.remove(c)
            else:
                result = "No es un anagrama"
                break
        
        if not char2:
            result = "Es un anagrama"
    else:
        result = "No es un anagrama"

    return result

print(anagrama("holaminga", "aohlangim"))
