from connection_bbdd import *

def ships_names():
  base_url = "https://api.star-citizen.wiki/api/v3/vehicles?limit=300&locale=en_EN"
  names = []

  response = requests.get(base_url)

  if response.status_code == 200:
    try:
      data = response.json()

      # Revisar si la clave "data" está presente directamente
      ships = data.get("data")
      if ships:
        for ship in ships:
          if ship and isinstance(ship, dict):
            name = ship.get("name")
            uuid = ship.get("uuid")
            if name and uuid is not None:
              names.append(name)
        #print("Nombres de las naves:", names)
        #print(len(names))
        return names
      else:
        print(f"Error: No se encontraron datos en la respuesta.")
    except ValueError:
      print("Error al decodificar la respuesta JSON.")
  else:
    try:
      error_data = response.json()
      print(f"Error: {error_data.get('message', 'No message provided')}")
    except ValueError:
      print(f"Error: Código de estado {response.status_code} sin mensaje JSON.")


