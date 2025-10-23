from funciones import tablero, colocar_barcos, disparar
import variables



tablero_jugador = tablero()
tablero_rival = tablero()

tablero_jugador = colocar_barcos(tablero_jugador, variables.barcos_jugador)
tablero_rival = colocar_barcos(tablero_rival, variables.barcos_rival)

print("Tablero jugador")
print(tablero_jugador)
print("_______________________________________________")
print("Tablero rival")


print(tablero_rival)
fila = int(input("Añade la fila: (0-9)"))
columna = int(input("Añade la columna: (0-9)"))

tablero_rival = disparar(tablero_rival, fila, columna)

print("Tablero rival")


print(tablero_rival)

