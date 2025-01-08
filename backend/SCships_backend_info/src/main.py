from connection_bbdd import *
from ships_name import *
from ships_info import *
from ships_part import *
from ships_component import *

ship_info()
ship_parts()
ship_components()
#ships_names()

cursor.close()
conn.close()
