import csv
import redis

# Conectar a Redis
r = redis.Redis(host='localhost', port=6379, db=0)

# Ruta del archivo CSV
csv_file_path = 'bataxi.csv'

# Leer el archivo CSV e importar los datos a Redis
with open(csv_file_path, mode='r', encoding='utf-8-sig') as file:
    reader = csv.DictReader(file)
    for row in reader:
        id_viaje_r = row['id_viaje_r']
        origen_viaje_x = float(row['origen_viaje_x'])
        origen_viaje_y = float(row['origen_viaje_y'])
        r.geoadd("bataxi", (origen_viaje_x, origen_viaje_y, id_viaje_r))

