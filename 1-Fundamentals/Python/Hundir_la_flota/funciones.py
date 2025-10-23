import numpy as np

def tablero():
    tablero = np.full((10,10), " ")
    return tablero


def colocar_barcos(tablero, lista):
    for barco in lista:
        for posicion in barco:
            tablero[posicion] = "O"
    return tablero

def disparar(tablero, fila, columna):
    if tablero[fila, columna] == "O":
        print("Tocado")
        tablero[fila, columna] = "X"
    elif tablero[fila, columna] == "#":
        disparar(tablero, fila, columna)
    else:
        print("AGUA!!!!")
        tablero[fila, columna] = "#"
    return tablero