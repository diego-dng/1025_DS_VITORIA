# IMPORT
import sqlite3
from flask import Flask, jsonify, request

def bbdd(query):
    con = sqlite3.connect("books.db")
    cursor = con.cursor()
    query
    resultado = cursor.execute(query).fetchall()
    con.close()
    return resultado

app = Flask(__name__)
app.config["DEBUG"] = True

@app.route("/", methods = ["GET"])
def main():
    return "Api libros con BBDD"
# 0.Ruta para obtener todos los libros
@app.route("/libros", methods = ["GET"])
def libros():
    res = bbdd("SELECT * FROM books")
    return jsonify(res)
# 1.Ruta para obtener el conteo de libros por autor ordenados de forma descendente
@app.route("/libros_autor", methods = ["GET"])
def libro_autor():
    res = bbdd("SELECT author, count(*) FROM books GROUP BY author ORDER BY 2 DESC")
    return jsonify(res)

# 2.Ruta para obtener los libros de un autor
@app.route("/buscar_libro", methods = ["GET"])
def buscar_libro():
    autor = request.args["autor"]
    query = f"SELECT * FROM books WHERE author = '{autor}'"
    res = bbdd(query)
    return jsonify(res)
# 3.Ruta para añadir un libro
@app.route("/insertar_libro", methods = ["POST"])
def insertar_libro():
    """
    {
    [,]
    }
    """

app.run()