#!/bin/bash

# Parque Chas
count1=$(redis-cli GEORADIUS bataxi -58.479258 -34.582497 1 km | wc -l)
echo "Viajes a 1 km de distancia de Parque Chas: $count1"

# UTN
count2=$(redis-cli GEORADIUS bataxi -58.468606 -34.658304 1 km | wc -l)
echo "Viajes a 1 km de distancia de UTN: $count2"

# ITBA Madero
count3=$(redis-cli GEORADIUS bataxi -58.367862 -34.602938 1 km | wc -l)
echo "Viajes a 1 km de distancia de ITBA Madero: $count3"

# Sumar la cantidad de viajes
total_viajes=$((count1 + count2 + count3))

echo "Total viajes a 1 km de distancia de los 3 lugares: $total_viajes"

echo "----------------"

# Numero de keys
keys=$(redis-cli DBSIZE)
echo "Numero de keys en la base de datos: $keys"

echo "-----------------"

# Miembros en la key bataxi
miembros=$(redis-cli ZCARD bataxi)
echo "Miembros en la key bataxi: $miembros"
