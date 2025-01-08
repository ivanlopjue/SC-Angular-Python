import psycopg
import requests
import json

# Conexión a la base de datos PostgreSQL
conn = psycopg.connect(
    dbname="postgres",  #
    user="postgres",
    password="n30n",
    host="localhost",
    port="5432"
)

cursor = conn.cursor()
