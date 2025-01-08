from ships_name import *
from connection_bbdd import *

def ship_info():
  # Conseguir los nombres de las naves
  names = ships_names()

  for name in names:
    url_template = "https://api.star-citizen.wiki/api/v3/vehicles/%s?locale=en_EN&include=components"
    url = url_template % (name,)

    response = requests.get(url)

    if response.status_code == 200:
      try:
        data = response.json()
        ship = data.get("data")

        if ship:
          nombre = ship.get("name")

          dimensiones = ship.get("sizes")
          if dimensiones:
            largo = dimensiones.get("length")
            ancho = dimensiones.get("beam")
            alto = dimensiones.get("height")
          else:
            largo = ancho = alto = None

          masa = ship.get("mass")
          carga = ship.get("cargo_capacity")

          tripulaciones = ship.get("crew")
          if tripulaciones:
            tmin = tripulaciones.get("min")
            tmax = tripulaciones.get("max")
          else:
            tmin = tmax = None

          velocidad = ship.get("speed")
          if velocidad:
            scm = velocidad.get("scm")
            vmax = velocidad.get("max")
          else:
            scm = vmax = None

          pcasco = ship.get("health")
          pescudo = ship.get("shield_hp")

          combustible = ship.get("fuel")
          if combustible:
            capacidad = combustible.get("capacity")
            consumo = combustible.get("usage")
            if consumo:
              principal = consumo.get("main")
              maniobra = consumo.get("maneuvering")
            else:
              principal = maniobra = None
          else:
            capacidad = consumo = None

          quantum = ship.get("quantum")
          if quantum:
            qvelocidad = quantum.get("quantum_speed")
            qpreparacion = quantum.get("quantum_spool_time")
            qcapacidad = quantum.get("quantum_fuel_capacity")
            qrango = quantum.get("quantum_range")
          else:
            qvelocidad = qpreparacion = qcapacidad = qrango = None

          agilidad = ship.get("agility")
          if agilidad:
            cabeceo = agilidad.get("pitch")
            guinada = agilidad.get("yaw")
            alabeo = agilidad.get("roll")
          else:
            cabeceo = guinada = alabeo = None

          foco = ship.get("foci")
          foco_json = json.dumps(foco)

          tipo = ship.get("type")
          descripcion = ship.get("description")
          manufacturer = ship.get("manufacturer").get("name")

          # Insertar en la tabla `ship_info`
          cursor.execute("""
              INSERT INTO ship_info (
                  nombre, largo, ancho, alto, masa, carga, tripulacion_min, tripulacion_max,
                  velocidad_scm, velocidad_max, pcasco, pescudo, combustible_capacidad,
                  combustible_consumo_principal, combustible_consumo_maniobra,
                  quantum_velocidad, quantum_preparacion, quantum_capacidad, quantum_rango,
                  agilidad_cabeceo, agilidad_guinada, agilidad_alabeo, foco, tipo, descripcion, manufacturer
              )
              VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
          """, (
            nombre, largo, ancho, alto, masa, carga, tmin, tmax,
            scm, vmax, pcasco, pescudo, capacidad, principal,
            maniobra, qvelocidad, qpreparacion, qcapacidad, qrango,
            cabeceo, guinada, alabeo, foco_json, tipo, descripcion, manufacturer
          ))

          conn.commit()
          print(f"Nave {name} insertada correctamente.")
        else:
          print(f"Error: Datos no encontrados para la nave {name}")

      except ValueError as e:
        print(f"Error al decodificar la respuesta JSON: {e}")
    else:
      print(f"Error en la solicitud. Código de estado: {response.status_code}")
