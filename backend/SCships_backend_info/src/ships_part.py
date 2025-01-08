from ships_name import *
from connection_bbdd import *

def insert_parts(ship_id, parts, parent_id=None):
  for part in parts:
    # 1. Insertar la parte principal y obtener el ID insertado
    cursor.execute("""
          INSERT INTO ship_parts (ship_id, name, damage_max, parent_id)
          VALUES (%s, %s, %s, %s)
          RETURNING id;
      """, (ship_id, part["name"], part["damage_max"], parent_id))

    # Obtener el ID de la parte insertada
    part_id = cursor.fetchone()[0]

    # 2. Insertar las subpartes recursivamente
    if part["children"]:
      insert_parts(ship_id, part["children"], parent_id=part_id)

    conn.commit()  # Asegúrate de hacer commit después de cada inserción

def ship_parts():
  names = ships_names()

  for name in names:
    # 1. Obtener el id de la nave
    cursor.execute("SELECT id FROM ship_info WHERE nombre = %s", (name,))
    result = cursor.fetchone()
    if result:
      ship_id = result[0]
    else:
      print(f"No se encontró la nave {name}")
      continue

    url = f"https://api.star-citizen.wiki/api/v3/vehicles/{name}?locale=en_EN&include=components"
    response = requests.get(url)

    if response.status_code == 200:
      try:
        data = response.json()
        ship = data.get("data")

        if ship:
          partes = ship.get("parts")
          if partes:
            # Insertar las partes de manera relacional
            insert_parts(ship_id, partes)

            print(f"Partes de la nave {name} insertadas correctamente.")
        else:
          print(f"Error: Datos no encontrados para la nave {name}")

      except ValueError as e:
        print(f"Error al decodificar la respuesta JSON: {e}")
    else:
      print(f"Error en la solicitud. Código de estado: {response.status_code}")
