from ships_name import *
from connection_bbdd import *

def insert_components(ship_id, components):
  for component in components:
    cursor.execute("""
          INSERT INTO ship_component (
              ship_id, type, name, mounts, component_size, category, size,
              details, quantity, manufacturer, component_class
          )
          VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
      """, (
      ship_id,
      component["type"],
      component["name"],
      component["mounts"],
      component["component_size"],
      component["category"],
      component["size"],
      component["details"],
      component["quantity"],
      component["manufacturer"],
      component["component_class"]
    ))

  conn.commit()  # Realiza el commit de todas las inserciones

def ship_components():
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
          componentes = ship.get("components")
          if componentes:
            # Insertar las partes de manera relacional
            insert_components(ship_id, componentes)

            print(f"Componentes de la nave {name} insertadas correctamente.")
        else:
          print(f"Error: Datos no encontrados para la nave {name}")

      except ValueError as e:
        print(f"Error al decodificar la respuesta JSON: {e}")
    else:
      print(f"Error en la solicitud. Código de estado: {response.status_code}")

