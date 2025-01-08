from flask import Flask, jsonify
import psycopg2
from collections import OrderedDict

app = Flask(__name__)

# Conexión a la base de datos PostgreSQL
def get_db_connection():
    conn = psycopg2.connect(
        host='localhost',  # Tu host de base de datos
        dbname='postgres',  # Tu base de datos
        user='postgres',  # Tu usuario
        password='n30n'  # Tu contraseña
    )
    return conn

@app.route('/get_data', methods=['GET'])
def get_data():
    conn = get_db_connection()
    cursor = conn.cursor()

    # Realizar una consulta para obtener los datos de una tabla
    cursor.execute("SELECT * FROM ship_info")  # Cambia 'ship_info' por el nombre de tu tabla
    rows = cursor.fetchall()

    # Obtener los nombres de las columnas (en el orden original de la tabla)
    column_names = [desc[0] for desc in cursor.description]

    # Cerrar la conexión
    cursor.close()
    conn.close()

    # Convertir los datos a un formato de lista de diccionarios (con OrderedDict)
    data = []
    for row in rows:
        # Crear un OrderedDict donde las claves son los nombres de las columnas y los valores son los datos de la fila
        row_dict = OrderedDict((column_names[i], row[i]) for i in range(len(column_names)))
        data.append(row_dict)

    # Devolver los datos y los nombres de las columnas en formato JSON
    return jsonify({
        'data': data  # Los datos de las filas, también en el orden original de las columnas
    })

if __name__ == '__main__':
    app.run(debug=True)

